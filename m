From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 May 2014 00:31:53 +0200
Subject: [Buildroot] [git commit] Makefile: move fs/common.mk above
	external.mk
Message-ID: <20140518223631.024279CC52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00b1ff615634c1d90531cc684a657af71b1465d4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The file external.mk was included before fs/common.mk, so it was impossible
to add rootfs targets using the BR2_EXTERNAL mechanism.
This change moves the inclusion of fs/common.mk before external.mk to allow
this.

Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
[ThomasDS: rebased, update commit message]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d91231c..4b93805 100644
--- a/Makefile
+++ b/Makefile
@@ -387,6 +387,7 @@ include $(sort $(wildcard package/*/*.mk))
 include boot/common.mk
 include linux/linux.mk
 include system/system.mk
+include fs/common.mk
 
 include $(BR2_EXTERNAL)/external.mk
 
@@ -400,8 +401,6 @@ ifeq ($(BR2_ECLIPSE_REGISTER),y)
 TARGETS += toolchain-eclipse-register
 endif
 
-include fs/common.mk
-
 TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN := $(patsubst %,%-dirclean,$(TARGETS))
 
