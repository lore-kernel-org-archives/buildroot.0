From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 21 May 2015 12:57:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/protobuf: Update site url
Message-ID: <1432205874-23855-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package moved to github:
https://developers.google.com/protocol-buffers/docs/downloads
"Our old Google Code repositiory is: https://code.google.com/p/protobuf/.
 We moved to github on Aug 26, 2014 [...]"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/protobuf/Config.in   |    2 +-
 package/protobuf/protobuf.mk |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 6015b13..bbb927f 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_PROTOBUF
 	  Protocol buffers are Google's language-neutral, platform-neutral,
 	  extensible mechanism for serializing structured data.
 
-	  http://code.google.com/p/protobuf/
+	  https://developers.google.com/protocol-buffers
 
 comment "protobuf needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 9043f98..b426873 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROTOBUF_VERSION = 2.5.0
-PROTOBUF_SITE = http://protobuf.googlecode.com/files
+PROTOBUF_VERSION = v2.5.0
+PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
 PROTOBUF_LICENSE = BSD-3c
 PROTOBUF_LICENSE_FILES = COPYING.txt
 
-- 
1.7.10.4
