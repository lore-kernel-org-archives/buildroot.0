From: Lionel Flandrin <lionel@svkt.org>
Date: Tue,  5 Feb 2019 11:28:13 +0100
Subject: [Buildroot] [PATCH 1/2] package/zeromq: Allow building with draft
 APIs enabled
Message-ID: <20190205102814.11288-1-lionel@svkt.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Lionel Flandrin <lionel@svkt.org>
---
 package/zeromq/Config.in | 7 +++++++
 package/zeromq/zeromq.mk | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index 69be9f002c..fdcdebc691 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -52,4 +52,11 @@ config BR2_PACKAGE_ZEROMQ_PGM
 	  3208) implemented either over raw IP packets or UDP
 	  datagrams (encapsulated PGM).
 
+config BR2_PACKAGE_ZEROMQ_DRAFTS
+	bool "Enable ZeroMQ draft APIs"
+	help
+	  Enable unstable draft ZeroMQ APIs
+
+	  https://pyzmq.readthedocs.io/en/latest/draft.html
+
 endif
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index da57f8745c..0761e54405 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -47,6 +47,10 @@ else
 ZEROMQ_CONF_OPTS += --without-pgm
 endif
 
+ifeq ($(BR2_PACKAGE_ZEROMQ_DRAFTS),y)
+ZEROMQ_CONF_OPTS += --enable-drafts
+endif
+
 # ZeroMQ uses libsodium if it's available.
 ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
 ZEROMQ_DEPENDENCIES += libsodium
-- 
2.20.1
