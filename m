From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 23:29:18 +0100
Subject: [Buildroot] [git commit branch/next] erlang-fast_tls: remove unused
	package
Message-ID: <20160221222921.E1CB780AE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d14100fb4e6ddcf7eff01fe9c49676ccc3c7f1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package was added in error when updating ejabberd dependencies. It
is not used.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 -
 package/erlang-fast_tls/Config.in          |  8 --------
 package/erlang-fast_tls/erlang-fast_tls.mk | 14 --------------
 3 files changed, 23 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c5442de..c69d632 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -472,7 +472,6 @@ menu "Interpreter languages and scripting"
 	source "package/erlang/Config.in"
 if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
-	source "package/erlang-fast_tls/Config.in"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
 	source "package/erlang-p1-cache-tab/Config.in"
diff --git a/package/erlang-fast_tls/Config.in b/package/erlang-fast_tls/Config.in
deleted file mode 100644
index 3bf52a1..0000000
--- a/package/erlang-fast_tls/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_ERLANG_FAST_TLS
-	bool "erlang-fast_tls"
-	select BR2_PACKAGE_ERLANG_P1_UTILS
-	select BR2_PACKAGE_OPENSSL
-	help
-	  TLS / SSL OpenSSL-based native driver for Erlang / Elixir
-
-	  https://github.com/processone/fast_tls
diff --git a/package/erlang-fast_tls/erlang-fast_tls.mk b/package/erlang-fast_tls/erlang-fast_tls.mk
deleted file mode 100644
index 63c55c5..0000000
--- a/package/erlang-fast_tls/erlang-fast_tls.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# erlang-fast_tls
-#
-################################################################################
-
-ERLANG_FAST_TLS_VERSION = 1.0.0
-ERLANG_FAST_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_FAST_TLS_VERSION))
-ERLANG_FAST_TLS_LICENSE = Apache-2.0
-ERLANG_FAST_TLS_LICENSE_FILES = LICENSE.txt
-ERLANG_FAST_TLS_INSTALL_STAGING = YES
-ERLANG_FAST_TLS_DEPENDENCIES = openssl erlang-p1-utils
-
-$(eval $(rebar-package))
