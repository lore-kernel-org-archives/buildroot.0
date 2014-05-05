From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 05 May 2014 09:52:13 +0200
Subject: [Buildroot] [PATCH v2] Makefile: move fs/common.mk above external.mk
Message-ID: <d407527a4c853dd989fb.1399276333@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Philippe Reynes <tremyfr@yahoo.fr>

The file external.mk was included before fs/common.mk, so it was impossible
to add rootfs targets using the BR2_EXTERNAL mechanism.
This change moves the inclusion of fs/common.mk before external.mk to allow
this.

Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
[ThomasDS: rebased, update commit message]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: rebased, update commit message

Makefile |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -388,6 +388,7 @@ include $(sort $(wildcard package/*/*.mk
 include boot/common.mk
 include linux/linux.mk
 include system/system.mk
+include fs/common.mk
 
 include $(BR2_EXTERNAL)/external.mk
 
@@ -401,8 +402,6 @@ ifeq ($(BR2_ECLIPSE_REGISTER),y)
 TARGETS += toolchain-eclipse-register
 endif
 
-include fs/common.mk
-
 TARGETS_SOURCE := $(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN := $(patsubst %,%-dirclean,$(TARGETS))
 
