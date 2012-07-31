From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 20:30:04 +0200
Subject: [Buildroot] [git commit] sysprof: add patch to fix build failures
	related to NT_GNU_BUILD_ID
Message-ID: <20120731193352.A16AA96FCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed7e0927f8e4c480b3efde9928fb886f47d36b85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../sysprof-02-define-NT_GNU_BUILD_ID.patch        |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/sysprof/sysprof-02-define-NT_GNU_BUILD_ID.patch b/package/sysprof/sysprof-02-define-NT_GNU_BUILD_ID.patch
new file mode 100644
index 0000000..dcc2cbe
--- /dev/null
+++ b/package/sysprof/sysprof-02-define-NT_GNU_BUILD_ID.patch
@@ -0,0 +1,22 @@
+On uclibc elf.h does not have GNU extentions but we need this define
+so we define it locally if its not getting it from elf.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: git/elfparser.h
+===================================================================
+--- git.orig/elfparser.h	2011-07-16 18:57:41.000000000 -0700
++++ git/elfparser.h	2011-07-16 20:28:54.733829895 -0700
+@@ -17,6 +17,10 @@
+  */
+ #include <glib.h>
+ 
++#ifndef NT_GNU_BUILD_ID
++#define NT_GNU_BUILD_ID 3
++#endif
++
+ typedef struct ElfSym ElfSym;
+ typedef struct ElfParser ElfParser;
+ 
