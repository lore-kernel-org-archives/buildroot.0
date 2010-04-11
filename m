From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Apr 2010 21:10:35 +0200
Subject: [Buildroot] [git commit master] Remove variables useless after
	BR2_PREFER_IMA removal
Message-ID: <20100411195038.96FF420B98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1d1b55a25045f066b57e05f6d0a609449cb97910
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Makefile.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/toolchain/Makefile.in b/toolchain/Makefile.in
index db1a87a..16451ee 100644
--- a/toolchain/Makefile.in
+++ b/toolchain/Makefile.in
@@ -40,9 +40,5 @@ endif
 # FIXME -- this is temporary
 OPTIMIZE_FOR_CPU=$(ARCH)
 
-# late binding check to see if the target cc supports -fwhole-program
-CFLAGS_WHOLE_PROGRAM = $(call cc-option,-fwhole-program,)
-CFLAGS_COMBINE = $(call cc-option,-combine,)
-
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
-- 
1.6.3.3
