From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 25 Aug 2015 14:58:56 +0200
Subject: [Buildroot] [PATCH 1/1][v2] erlang-p1-tls: add missing dependency
	to openssl
Message-ID: <1440507536-29611-1-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

---
Changes v1 -> v2:
  - Add openssl dependency to the .mk file (suggested by Thomas).
---
 package/erlang-p1-tls/Config.in        | 1 +
 package/erlang-p1-tls/erlang-p1-tls.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/erlang-p1-tls/Config.in b/package/erlang-p1-tls/Config.in
index 42c6a3e..0df3348 100644
--- a/package/erlang-p1-tls/Config.in
+++ b/package/erlang-p1-tls/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ERLANG_P1_TLS
 	bool "erlang-p1-tls"
+	select BR2_PACKAGE_OPENSSL
 	help
 	  Erlang interface to OpenSSL
 
diff --git a/package/erlang-p1-tls/erlang-p1-tls.mk b/package/erlang-p1-tls/erlang-p1-tls.mk
index d706797..4f1fc48 100644
--- a/package/erlang-p1-tls/erlang-p1-tls.mk
+++ b/package/erlang-p1-tls/erlang-p1-tls.mk
@@ -9,5 +9,6 @@ ERLANG_P1_TLS_SITE = $(call github,processone,tls,$(ERLANG_P1_TLS_VERSION))
 ERLANG_P1_TLS_LICENSE = GPLv2+
 ERLANG_P1_TLS_LICENSE_FILES = COPYING
 ERLANG_P1_TLS_INSTALL_STAGING = YES
+ERLANG_P1_TLS_DEPENDENCIES = openssl
 
 $(eval $(rebar-package))
-- 
2.1.4
