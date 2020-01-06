From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:24:44 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-pkix: new package
Message-ID: <20200106201550.A40548EE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f56d9f352302bc3885a6eb5a3946fcd0b89d8534
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/erlang-p1-pkix/Config.in           |  6 ++++++
 package/erlang-p1-pkix/erlang-p1-pkix.hash |  2 ++
 package/erlang-p1-pkix/erlang-p1-pkix.mk   | 12 ++++++++++++
 5 files changed, 22 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d4b30815..fb226ccaa8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1266,6 +1266,7 @@ F:	package/erlang-p1-cache-tab/
 F:	package/erlang-p1-iconv/
 F:	package/erlang-p1-mqtree/
 F:	package/erlang-p1-oauth2/
+F:	package/erlang-p1-pkix/
 F:	package/erlang-p1-sip/
 F:	package/erlang-p1-stringprep/
 F:	package/erlang-p1-stun/
diff --git a/package/Config.in b/package/Config.in
index 760e3fd4f0..853961ee87 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -587,6 +587,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-iconv/Config.in"
 	source "package/erlang-p1-mqtree/Config.in"
 	source "package/erlang-p1-oauth2/Config.in"
+	source "package/erlang-p1-pkix/Config.in"
 	source "package/erlang-p1-sip/Config.in"
 	source "package/erlang-p1-stringprep/Config.in"
 	source "package/erlang-p1-stun/Config.in"
diff --git a/package/erlang-p1-pkix/Config.in b/package/erlang-p1-pkix/Config.in
new file mode 100644
index 0000000000..dfd43f9de4
--- /dev/null
+++ b/package/erlang-p1-pkix/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_P1_PKIX
+	bool "erlang-p1-pkix"
+	help
+	  PKIX certificates management library for Erlang.
+
+	  https://github.com/processone/pkix
diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.hash b/package/erlang-p1-pkix/erlang-p1-pkix.hash
new file mode 100644
index 0000000000..cb6004f6b2
--- /dev/null
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 184069d9055991cb8b7bd07dde8737a0a793e66e1ec1020deb680f83260a3e82 erlang-p1-pkix-1.0.4.tar.gz
diff --git a/package/erlang-p1-pkix/erlang-p1-pkix.mk b/package/erlang-p1-pkix/erlang-p1-pkix.mk
new file mode 100644
index 0000000000..9f902d44bb
--- /dev/null
+++ b/package/erlang-p1-pkix/erlang-p1-pkix.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# erlang-p1-pkix
+#
+################################################################################
+
+ERLANG_P1_PKIX_VERSION = 1.0.4
+ERLANG_P1_PKIX_SITE = $(call github,processone,pkix,$(ERLANG_P1_PKIX_VERSION))
+ERLANG_P1_PKIX_LICENSE = Apache-2.0
+ERLANG_P1_PKIX_LICENSE_FILES = LICENSE
+
+$(eval $(rebar-package))
