From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 22:27:59 +0200
Subject: [Buildroot] [git commit] protobuf-c: project is on github now
Message-ID: <20140507204846.1DAFD9CB25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=374e299f7dd22b4aa39da252c2e4edaaea52fa69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

old release tag got lost in translation

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf-c/protobuf-c.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 42f592b..75e15a2 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-PROTOBUF_C_VERSION = 0.15
-PROTOBUF_C_SITE = http://protobuf-c.googlecode.com/files
+PROTOBUF_C_VERSION = 1d1ad931dfda273bb12b9925d4b8cc413131af03
+PROTOBUF_C_SITE = $(call github,protobuf-c,protobuf-c,$(PROTOBUF_C_VERSION))
 PROTOBUF_C_DEPENDENCIES = host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf
 PROTOBUF_C_MAKE = $(MAKE1)
 PROTOBUF_C_CONF_OPT = --disable-protoc
 PROTOBUF_C_INSTALL_STAGING = YES
 PROTOBUF_C_LICENSE = BSD-3c
+PROTOBUF_C_AUTORECONF = YES
+HOST_PROTOBUF_C_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
