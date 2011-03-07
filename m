From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Mar 2011 23:31:27 +0100
Subject: [Buildroot] [git commit master 1/1] gnuconfig: Remove sh patch.
Message-ID: <20110308062855.275508EB73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7fb5445d30cbad11b97ed14ae6dc686b85fe3af7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A similar patch appears to have been applied upstream.

Signed-off-by: Will Newton <will.newton@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnuconfig/patches/config.sub.sh.patch |   39 -------------------------
 1 files changed, 0 insertions(+), 39 deletions(-)
 delete mode 100644 package/gnuconfig/patches/config.sub.sh.patch

diff --git a/package/gnuconfig/patches/config.sub.sh.patch b/package/gnuconfig/patches/config.sub.sh.patch
deleted file mode 100644
index c8727df..0000000
--- a/package/gnuconfig/patches/config.sub.sh.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-gnuconfig seems intent on only supporting superfluous targets that don't
-represent any real hardware (such as sh2a LE). GCC in its infinite wisdom is
-also incapable of supporting tuning for other variants in a sensible fashion.
-
-As such, we still need to be able to support such useful targets as
-sh2a_nofpueb in order to not only get the byte order right, but also to
-support -m2a-nofpu tuning from the kernel (though we tend to do this through
--Wa,-isa= instead, as the binutils people do a much better job of not screwing
-up their config code every other day. Way to go config.gcc..).
-
-The fact that the sh variant matching is the ugliest out of any of the other
-architectures doesn't seem to deter GCC folk from their well thought out and
-brilliantly managed config target list.
-
-Index: config.sub
-===================================================================
-RCS file: /cvsroot/config/config/config.sub,v
-retrieving revision 1.356
-diff -u -r1.356 config.sub
---- config.sub	28 Jun 2007 06:56:43 -0000	1.356
-+++ config.sub	9 Jul 2007 17:38:48 -0000
-@@ -277,7 +277,7 @@
- 	| powerpc | powerpc64 | powerpc64le | powerpcle | ppcbe \
- 	| pyramid \
- 	| score \
--	| sh | sh[1234] | sh[24]a | sh[23]e | sh[34]eb | sheb | shbe | shle | sh[1234]le | sh3ele \
-+	| sh | sh[1234] | sh[24]a | sh[24]a*eb | sh[23]e | sh[34]eb | sheb | shbe | shle | sh[1234]le | sh3ele \
- 	| sh64 | sh64le \
- 	| sparc | sparc64 | sparc64b | sparc64v | sparc86x | sparclet | sparclite \
- 	| sparcv8 | sparcv9 | sparcv9b | sparcv9v \
-@@ -358,7 +358,7 @@
- 	| powerpc-* | powerpc64-* | powerpc64le-* | powerpcle-* | ppcbe-* \
- 	| pyramid-* \
- 	| romp-* | rs6000-* \
--	| sh-* | sh[1234]-* | sh[24]a-* | sh[23]e-* | sh[34]eb-* | sheb-* | shbe-* \
-+	| sh-* | sh[1234]-* | sh[24]a-* | sh[24]a*eb-* | sh[23]e-* | sh[34]eb-* | sheb-* | shbe-* \
- 	| shle-* | sh[1234]le-* | sh3ele-* | sh64-* | sh64le-* \
- 	| sparc-* | sparc64-* | sparc64b-* | sparc64v-* | sparc86x-* | sparclet-* \
- 	| sparclite-* \
-- 
1.7.3.4
