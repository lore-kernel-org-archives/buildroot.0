From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 26 Nov 2018 12:08:00 +0100
Subject: [Buildroot] [PATCH 08/15] erlang-p1-xmpp: Bump to version 1.2.5
In-Reply-To: <20181126110807.31431-1-johan.oudinet@gmail.com>
References: <20181126110807.31431-1-johan.oudinet@gmail.com>
Message-ID: <20181126110807.31431-9-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package now depends also on erlang-p1-tls and erlang-p1-zlib.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-xmpp/Config.in           | 2 ++
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash | 2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk   | 4 ++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-xmpp/Config.in b/package/erlang-p1-xmpp/Config.in
index 9b33e0c609..6e40fed10a 100644
--- a/package/erlang-p1-xmpp/Config.in
+++ b/package/erlang-p1-xmpp/Config.in
@@ -6,7 +6,9 @@ config BR2_PACKAGE_ERLANG_P1_XMPP
 	depends on BR2_INSTALL_LIBSTDCPP # erlang-p1-stringprep
 	select BR2_PACKAGE_ERLANG_P1_XML
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
+	select BR2_PACKAGE_ERLANG_P1_TLS
 	select BR2_PACKAGE_ERLANG_P1_UTILS
+	select BR2_PACKAGE_ERLANG_P1_ZLIB
 	help
 	  XMPP library for Erlang.
 
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
index d3d2dafb9e..e1c63a6065 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 558e8d8734052bdbe679cf10165a63944c208940ab84be78c97ba661dfcf3cb2 erlang-p1-xmpp-1.1.16.tar.gz
+sha256 699f50d50850272e67160b022fd27f3ccc46570e48968d8ee30d491bf926794d erlang-p1-xmpp-1.2.5.tar.gz
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
index 096876ca34..e20a84f4a3 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-ERLANG_P1_XMPP_VERSION = 1.1.16
+ERLANG_P1_XMPP_VERSION = 1.2.5
 ERLANG_P1_XMPP_SITE = $(call github,processone,xmpp,$(ERLANG_P1_XMPP_VERSION))
 ERLANG_P1_XMPP_LICENSE = Apache-2.0
 ERLANG_P1_XMPP_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_XMPP_INSTALL_STAGING = YES
 ERLANG_P1_XMPP_DEPENDENCIES = erlang-p1-xml erlang-p1-stringprep \
-	erlang-p1-utils host-erlang-p1-xml
+	erlang-p1-tls erlang-p1-utils erlang-p1-zlib host-erlang-p1-xml
 
 $(eval $(rebar-package))
 $(eval $(host-rebar-package))
-- 
2.17.1
