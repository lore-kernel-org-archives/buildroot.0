From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Sep 2018 16:58:47 +0200
Subject: [Buildroot] [git commit] dvblast: drop NPTL dependency
Message-ID: <20180923150422.90D518890D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=382b377c11cfd6ff738ec0ce38e13968d4bb22e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest uClibc-ng version (1.0.30) provides clock_nanosleep() even
for non NPTL configurations.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dvblast/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dvblast/Config.in b/package/dvblast/Config.in
index 5597faea4f..973eee88c6 100644
--- a/package/dvblast/Config.in
+++ b/package/dvblast/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DVBLAST
 	bool "dvblast"
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BITSTREAM
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -10,5 +10,5 @@ config BR2_PACKAGE_DVBLAST
 
 	  http://www.videolan.org/projects/dvblast.html
 
-comment "dvblast needs a toolchain w/ NPTL"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+comment "dvblast needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
