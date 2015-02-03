From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:23:24 +0100
Subject: [Buildroot] [git commit] erlang-p1-stun: new package.
Message-ID: <20150203092417.D526B7FCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63e4680accc52ef873e774492361286bf9a16352
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    1 +
 package/erlang-p1-stun/Config.in         |    8 ++++++++
 package/erlang-p1-stun/erlang-p1-stun.mk |   14 ++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 851cc24..050b160 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,6 +401,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-stun/Config.in"
 	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
 	source "package/erlang-p1-xml/Config.in"
diff --git a/package/erlang-p1-stun/Config.in b/package/erlang-p1-stun/Config.in
new file mode 100644
index 0000000..70cdd91
--- /dev/null
+++ b/package/erlang-p1-stun/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ERLANG_P1_STUN
+	bool "erlang-p1-stun"
+	select BR2_PACKAGE_ERLANG_P1_TLS
+	select BR2_PACKAGE_ERLANG_P1_UTILS
+	help
+	  STUN library for Erlang
+
+	  https://github.com/processone/stun
diff --git a/package/erlang-p1-stun/erlang-p1-stun.mk b/package/erlang-p1-stun/erlang-p1-stun.mk
new file mode 100644
index 0000000..7b4b1a9
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
+ERLANG_P1_STUN_DEPENDENCIES = erlang-p1-tls erlang-p1-utils
+ERLANG_P1_STUN_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
