From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 23:21:03 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: broken on or1k with gcc <
 9.x
Message-ID: <20191021211447.5194383AB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7700aeca292f4a5d4c7655dfc88404d77587899a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/961/9618aeffa7d72162d6643a89470c4a01d044a2dc/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
