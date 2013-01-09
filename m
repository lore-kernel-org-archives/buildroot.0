From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Jan 2013 13:20:05 +0100
Subject: [Buildroot] [git commit] Makefile: system.mk rootfs modifications
	should be done before target-finalize
Message-ID: <20130109122336.F19269A6E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec100c7e2108d3e174ec082c62e3f8d73ed33a92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So they don't override E.G. changes done in post build scripts
(E.G. password settings).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 4b09437..074674a 100644
--- a/Makefile
+++ b/Makefile
@@ -322,6 +322,7 @@ include package/*/*.mk
 
 include boot/common.mk
 include linux/linux.mk
+include system/system.mk
 
 TARGETS+=target-finalize
 
@@ -335,7 +336,6 @@ TARGETS+=target-generatelocales
 endif
 endif
 
-include system/system.mk
 include fs/common.mk
 
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
