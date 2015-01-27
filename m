From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 27 Jan 2015 12:21:13 +0200
Subject: [Buildroot] [PATCH] alsa-utils: needs dynamic library support
Message-ID: <27b7692b7892024566e160a09c2d49df8cb3481c.1422354073.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/314/314dac9f5e62ae9beb598eb1b4cb35c0a7bfe792/
http://autobuild.buildroot.net/results/964/964e44f0c1653370600c7e8c647abda3f6380e34/
http://autobuild.buildroot.net/results/d72/d72f31bab907c7485d03db4597d01fd759277db4/
...

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/alsa-utils/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index cc667115084b..d8418639e394 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -1,12 +1,13 @@
-comment "alsa-utils needs a toolchain w/ largefile, threads"
+comment "alsa-utils needs a toolchain w/ largefile, threads, dynamic library"
 	depends on BR2_USE_MMU # fork
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
 	depends on BR2_USE_MMU # fork
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
-- 
2.1.4
