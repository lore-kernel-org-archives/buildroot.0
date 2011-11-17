From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Nov 2011 23:19:37 +0100
Subject: [Buildroot] [git commit] dependencies: remove unused lzma checking
	scripts
Message-ID: <20111117225824.599368F5C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8810f5a1956bfee8bdbed6bdc48a8d18fb47ef96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Files package/lzma/lzmacheck.sh and toolchain/dependencies/check-host-lzma.sh
are present since the very beginning of buildroot, but do not appear to be
used (anymore). Let's remove them.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lzma/lzmacheck.sh                 |    9 ---------
 toolchain/dependencies/check-host-lzma.sh |   13 -------------
 2 files changed, 0 insertions(+), 22 deletions(-)

diff --git a/package/lzma/lzmacheck.sh b/package/lzma/lzmacheck.sh
deleted file mode 100755
index bcb0423..0000000
--- a/package/lzma/lzmacheck.sh
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-
-bin=$(toolchain/dependencies/check-host-lzma.sh)
-if [ "x$bin" = "x" ] ; then
-  echo build-lzma-host-binary
-else
-  echo use-lzma-host-binary
-fi
-
diff --git a/toolchain/dependencies/check-host-lzma.sh b/toolchain/dependencies/check-host-lzma.sh
deleted file mode 100755
index 34e8f03..0000000
--- a/toolchain/dependencies/check-host-lzma.sh
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/sh
-
-ok=""
-
-for bin in /usr/bin/lzma $LZMA
-do
-# TODO: add check for proper functionality here..
-  $bin --version > /dev/null 2>&1 && ok="$bin"
-  if test "x$ok" != "x" ; then
-    break
-  fi
-done
-echo "$ok"
