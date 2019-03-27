From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 17:51:59 +0100
Subject: [Buildroot] [git commit] package/wavemon: remove NPTL dependency
Message-ID: <20190327164849.D8D1383616@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cefb9bb7fd87d3edbe62dcb4c490054f1396e5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wavemon does not use pthread_mutexattr_setrobust since version 0.8.2 and
https://github.com/uoaerg/wavemon/commit/d271685e03bc896829d8cc01ca0de28cd7b6ba72

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wavemon/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wavemon/Config.in b/package/wavemon/Config.in
index b72a617759..0cb4cb5c69 100644
--- a/package/wavemon/Config.in
+++ b/package/wavemon/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_WAVEMON
 	bool "wavemon"
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBNL
 	help
@@ -15,5 +15,5 @@ config BR2_PACKAGE_WAVEMON
 
 	  https://github.com/uoaerg/wavemon
 
-comment "wavemon needs a toolchain w/ NPTL"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+comment "wavemon needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
