From: Blomme, Maarten <Maarten.Blomme@flir.com>
Date: Mon, 16 Apr 2018 08:09:26 +0000
Subject: [Buildroot] [PATCH 1/1] micropython: bump version to v1.9.3
Message-ID: <1523866445.3945.22.camel@flir.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build step now requires building mpy-cross first.

Signed-off-by: Blomme, Maarten <Maarten.Blomme at flir.com<mailto:Maarten.Blomme@flir.com>>
---
 package/micropython-lib/micropython-lib.hash | 2 +-
 package/micropython-lib/micropython-lib.mk   | 2 +-
 package/micropython/micropython.hash         | 2 +-
 package/micropython/micropython.mk           | 7 ++++---
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/micropython-lib/micropython-lib.hash
b/package/micropython-lib/micropython-lib.hash
index bc0c22efc5..f63c52cf0c 100644
--- a/package/micropython-lib/micropython-lib.hash
+++ b/package/micropython-lib/micropython-lib.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256
eb696009ff8c33004211e484649b34edb14f3efb2ff618942bc8888716757a55  micro
python-lib-v1.8.6.tar.gz
+sha256
66e15380eb109613263beb6825b8eecb9191088270c1a59e8c7d922dd57183c7  micro
python-lib-v1.9.3.tar.gz
diff --git a/package/micropython-lib/micropython-lib.mk
b/package/micropython-lib/micropython-lib.mk
index c9423feac6..3c46b92429 100644
--- a/package/micropython-lib/micropython-lib.mk
+++ b/package/micropython-lib/micropython-lib.mk
@@ -4,7 +4,7 @@
 #
 ######################################################################
##########

-MICROPYTHON_LIB_VERSION = v1.8.6
+MICROPYTHON_LIB_VERSION = v1.9.3
 MICROPYTHON_LIB_SITE = $(call github,micropython,micropython-
lib,$(MICROPYTHON_LIB_VERSION))
 MICROPYTHON_LIB_LICENSE = Python-2.0 (some modules), MIT (everything
else)
 MICROPYTHON_LIB_LICENSE_FILES = LICENSE
diff --git a/package/micropython/micropython.hash
b/package/micropython/micropython.hash
index 6ab7b10b66..d42d7ee148 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,2 +1,2 @@
 #locally computed
-sha256
55dd751c4c812809841fd06f4729b8341171c4b6c1dc28a9412455282554f8a5  micro
python-v1.8.7.tar.gz
+sha256
ce6b5c4548e85d84075635ff3e94d5cd3356b5fcc7593a7b49dd513612b6ed01  micro
python-v1.9.3.tar.gz
diff --git a/package/micropython/micropython.mk
b/package/micropython/micropython.mk
index 8336fb436f..2c6bddd81d 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ######################################################################
##########

-MICROPYTHON_VERSION = v1.8.7
+MICROPYTHON_VERSION = v1.9.3
 MICROPYTHON_SITE = $(call
github,micropython,micropython,$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
@@ -22,14 +22,15 @@ MICROPYTHON_MAKE_OPTS = MICROPY_PY_BTREE=0
 MICROPYTHON_MAKE_OPTS += MICROPY_PY_USSL=0

 define MICROPYTHON_BUILD_CMDS
-       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
+       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
+       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
                $(MICROPYTHON_MAKE_OPTS) \
                CROSS_COMPILE=$(TARGET_CROSS) \
                CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS)
 endef

 define MICROPYTHON_INSTALL_TARGET_CMDS
-       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/unix \
+       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
                $(MICROPYTHON_MAKE_OPTS) \
                CROSS_COMPILE=$(TARGET_CROSS) \
                CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \


________________________________

Notice to recipient: This email is meant for only the intended recipient of the transmission, and may be a communication privileged by law, subject to export control restrictions or that otherwise contains proprietary information. If you receive this email by mistake, please notify us immediately by replying to this message and then destroy it and do not review, disclose, copy or distribute it. Thank you in advance for your cooperation.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180416/93fa124e/attachment.html>
