From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:26:05 +0100
Subject: [Buildroot] [PATCH 19/24 v3] erlang-p1-stun: new package.
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <348fc3903281bdc3e8764092d97bfabc6c0220a2.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Johan Oudinet <johan.oudinet@gmail.com>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                        |  1 +
 package/erlang-p1-stun/Config.in         |  7 +++++++
 package/erlang-p1-stun/erlang-p1-stun.mk | 14 ++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/erlang-p1-stun/Config.in
 create mode 100644 package/erlang-p1-stun/erlang-p1-stun.mk

diff --git a/package/Config.in b/package/Config.in
index 21c4071..52c597a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -395,6 +395,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-stun/Config.in"
 	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
 	source "package/erlang-p1-xml/Config.in"
diff --git a/package/erlang-p1-stun/Config.in b/package/erlang-p1-stun/Config.in
new file mode 100644
index 0000000..bbe6bae
--- /dev/null
+++ b/package/erlang-p1-stun/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ERLANG_P1_STUN
+	bool "erlang-p1-stun"
+	depends on BR2_PACKAGE_ERLANG
+	select BR2_PACKAGE_ERLANG_P1_TLS
+	select BR2_PACKAGE_ERLANG_P1_UTILS
+	help
+	  STUN library for Erlang
diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
new file mode 100644
index 0000000..d963caa
--- /dev/null
+++ b/package/erlang-p1-stun/erlang-p1-stun.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# erlang-p1-stun
+#
+################################################################################
+
+ERLANG_P1_STUN_VERSION = a7c07b6
+ERLANG_P1_STUN_SITE = $(call github,processone,stun,$(ERLANG_P1_STUN_VERSION))
+ERLANG_P1_STUN_LICENSE = GPLv2+
+ERLANG_P1_STUN_LICENSE_FILES = COPYING
+ERLANG_P1_STUN_DEPENDENCIES = erlang host-erlang-rebar erlang-p1-tls erlang-p1-utils
+ERLANG_P1_STUN_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
-- 
1.9.1
