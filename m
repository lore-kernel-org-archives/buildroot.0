From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jul 2016 20:29:09 +0200
Subject: [Buildroot] [git commit] wavemon: depends on a toolchain with NPTL
Message-ID: <20160731183025.4E94881DF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e237f4a693abc9b1c741eb48209c0ed5d2a1af2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The software uses pthread_mutexattr_setrobust which isn't
available in uClibc-ng Linuxthreads support.

Fixes:
http://autobuild.buildroot.net/results/d81b199c74cb4251f0b0eb975f66cb5016eb464c/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wavemon/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wavemon/Config.in b/package/wavemon/Config.in
index b0f2f34..e073dee 100644
--- a/package/wavemon/Config.in
+++ b/package/wavemon/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_WAVEMON
 	bool "wavemon"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_LIBNL
 	help
@@ -14,5 +14,5 @@ config BR2_PACKAGE_WAVEMON
 
 	  https://github.com/uoaerg/wavemon
 
-comment "wavemon needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "wavemon needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
