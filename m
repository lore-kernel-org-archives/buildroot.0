From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 20:51:26 +0200
Subject: [Buildroot] [git commit] erlang-p1-tls: add missing dependency to
	openssl
Message-ID: <20150825185159.8A8888012F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4be8a0abc4b1e6236177a2950ad5694c15e05ce4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-tls/Config.in        |    1 +
 package/erlang-p1-tls/erlang-p1-tls.mk |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

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
