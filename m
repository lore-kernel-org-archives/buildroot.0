From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 23 Jan 2016 10:29:51 -0200
Subject: [Buildroot] [PATCH solution 1 v1] docs/manual: add version number
	to patch in prerequisites
Message-ID: <1453552191-3259-1-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

patch version 2.7 or later is required to apply patches that change
a file with space in the name

Below messages appear when using an older version:
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

The output of "diff -purN" when there are spaces in the name of a
changed file depends on the tool version:
diff <= v3.2 does not add double quotes to filenames
diff >= v3.3 adds double quotes to filenames

The tool 'patch' can handle patches with spaces in the name of a
changed file depending on the tool version:
patch >= 2.5.9 can handle unquoted filenames
patch >= 2.7 can handle both quoted and unquoted filenames

Fixes:
http://autobuild.buildroot.net/results/8ff/8ff91ab8e52000eb34dd8f662520cf1b31490cf5/
http://autobuild.buildroot.net/results/ea7/ea77d6b23aca0cb1cf527e6c16ddf5eba957a69c/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
libsoil is the only package today that patches a file with space in the
name.

There are other solutions. This is the trivial one.
See the reply to '[Buildroot] Analysis of build failures'
---
 docs/manual/prerequisite.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 7edad1f..510a5b3 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -26,7 +26,7 @@ between distributions).
 ** +gcc+ (version 2.95 or any later)
 ** `g++` (version 2.95 or any later)
 ** +bash+
-** +patch+
+** +patch+ (version 2.7 or any later)
 ** +gzip+
 ** +bzip2+
 ** +perl+ (version 5.8.7 or any later)
-- 
1.9.1
