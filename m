From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Sep 2019 22:36:02 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/ffmpeg: broken on or1k with gcc
 < 9.x
Message-ID: <20190901203602.3911-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/961/9618aeffa7d72162d6643a89470c4a01d044a2dc/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: only the old gcc5 toolchain was affected, building with gcc9 works
    (Peter)

 package/ffmpeg/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index a5c05d9c1c..0c71415276 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -14,6 +14,8 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68467 for more
 	# details.
 	depends on !BR2_m68k_cf
+	# assertion fail in binutils
+	depends on !(BR2_or1k && !BR2_TOOLCHAIN_GCC_AT_LEAST_9)
 
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
-- 
2.20.1
