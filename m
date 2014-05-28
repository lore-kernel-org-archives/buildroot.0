From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 May 2014 14:41:40 +0200
Subject: [Buildroot] [git commit] fakeroot: drop powerpc64le patch
Message-ID: <20140601083246.9A2A89CE5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f18c33b4cc9c344c6ac8e28bfac5ae42befc8b1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested by Arnout.

We don't provide fakeroot for the target, and using a powerpcp4le machine as
the build host is quite unlikely - So drop the patch.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fakeroot/01-powerpc64le-support.patch |   29 -------------------------
 1 files changed, 0 insertions(+), 29 deletions(-)

diff --git a/package/fakeroot/01-powerpc64le-support.patch b/package/fakeroot/01-powerpc64le-support.patch
deleted file mode 100644
index c26d9a5..0000000
--- a/package/fakeroot/01-powerpc64le-support.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Description: powerpc64le-support.patch: Patch configure to support ppc64el.
-Author: Adam Conrad <adconrad@ubuntu.com>
-
---- fakeroot-1.20.orig/configure
-+++ fakeroot-1.20/configure
-@@ -6509,6 +6509,9 @@ s390*-*linux*|s390*-*tpf*|sparc*-*linux*
- 	  ppc64-*linux*|powerpc64-*linux*)
- 	    LD="${LD-ld} -m elf32ppclinux"
- 	    ;;
-+	  powerpc64le-*linux*)
-+	    LD="${LD-ld} -m elf32lppclinux"
-+	    ;;
- 	  s390x-*linux*)
- 	    LD="${LD-ld} -m elf_s390"
- 	    ;;
-@@ -6525,9 +6528,12 @@ s390*-*linux*|s390*-*tpf*|sparc*-*linux*
- 	  x86_64-*linux*)
- 	    LD="${LD-ld} -m elf_x86_64"
- 	    ;;
--	  ppc*-*linux*|powerpc*-*linux*)
-+	  ppc-*linux*|powerpc-*linux*)
- 	    LD="${LD-ld} -m elf64ppc"
- 	    ;;
-+	  powerpcle-*linux*)
-+	    LD="${LD-ld} -m elf64lppc"
-+	    ;;
- 	  s390*-*linux*|s390*-*tpf*)
- 	    LD="${LD-ld} -m elf64_s390"
- 	    ;;
