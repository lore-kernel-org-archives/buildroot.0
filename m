From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 23 Jan 2016 13:28:47 -0200
Subject: [Buildroot] [PATCH v1 1/3] package/libsoil: allow build using patch
	v2.5.9 or any later
Message-ID: <1453562929-19230-1-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well-formed patch fails to apply
- patch v2.6:
Hunk #1 FAILED at 1.
Hunk #2 FAILED at 23.
- patch v2.6.1:
can't find file to patch at input line 11
Perhaps you used the wrong -p or --strip option?
[snap]
No file to patch.  Skipping patch.
2 out of 2 hunks ignored
Patch failed!  Please fix 0001-fix-makefile.patch!

The mandatory build tool "patch" versions v2.5.9, v2.6 and v2.6.1
cannot handle diff v3.3 output when there are spaces in filenames.
The same does not occur using "patch" v2.7 or any later.

Workaround: patch with spaces in filename must be hand-edited to
remove the double quotes from the filename to support old versions
of the tool "patch" on the host system.

Fixes:
http://autobuild.buildroot.net/results/8ff/8ff91ab8e52000eb34dd8f662520cf1b31490cf5/
http://autobuild.buildroot.net/results/ea7/ea77d6b23aca0cb1cf527e6c16ddf5eba957a69c/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
I hand-edited the patch, but it could also be generated using old diff v3.2
---
 package/libsoil/0001-fix-makefile.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsoil/0001-fix-makefile.patch b/package/libsoil/0001-fix-makefile.patch
index 3b80048..b728d04 100644
--- a/package/libsoil/0001-fix-makefile.patch
+++ b/package/libsoil/0001-fix-makefile.patch
@@ -6,8 +6,8 @@ http://anonscm.debian.org/cgit/pkg-games/libsoil.git/tree/debian/patches/linking
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 diff -uNr "soil.org/projects/makefile/alternate Makefile.txt" "soil/projects/makefile/alternate Makefile.txt"
---- "soil.org/projects/makefile/alternate Makefile.txt"	2008-07-07 18:13:28.000000000 +0200
-+++ "soil/projects/makefile/alternate Makefile.txt"	2015-11-07 11:15:04.140106336 +0100
+--- soil.org/projects/makefile/alternate Makefile.txt	2008-07-07 18:13:28.000000000 +0200
++++ soil/projects/makefile/alternate Makefile.txt	2015-11-07 11:15:04.140106336 +0100
 @@ -1,8 +1,8 @@
  MAKE = make
 -CC = gcc
-- 
1.9.1
