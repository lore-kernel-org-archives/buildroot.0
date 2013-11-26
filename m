From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue, 26 Nov 2013 03:09:41 -0600
Subject: [Buildroot] [PATCH 1/1] protobuf-c: disable parallel build
Message-ID: <1385456981-7960-1-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/f47c4f0883019ba3a8e61a9ae51b7bd7f347b38c/

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/protobuf-c/protobuf-c.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/protobuf-c/protobuf-c.mk b/package/protobuf-c/protobuf-c.mk
index 31fb593..271f6d8 100644
--- a/package/protobuf-c/protobuf-c.mk
+++ b/package/protobuf-c/protobuf-c.mk
@@ -8,6 +8,7 @@ PROTOBUF_C_VERSION = 0.15
 PROTOBUF_C_SITE = http://protobuf-c.googlecode.com/files
 PROTOBUF_C_DEPENDENCIES = protobuf host-protobuf-c
 HOST_PROTOBUF_C_DEPENDENCIES = host-protobuf
+PROTOBUF_C_MAKE = $(MAKE1)
 PROTOBUF_C_CONF_OPT = --disable-protoc
 PROTOBUF_C_INSTALL_STAGING = YES
 PROTOBUF_C_LICENSE = BSD-3c
-- 
1.7.1
