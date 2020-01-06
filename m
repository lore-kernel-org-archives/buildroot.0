From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:24:44 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-acme: new package
Message-ID: <20200106201550.B84738EE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e92c8978d3a5bf2dfa5271ce46be926c2e8cd14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/erlang-p1-acme/Config.in           | 10 ++++++++++
 package/erlang-p1-acme/erlang-p1-acme.hash |  3 +++
 package/erlang-p1-acme/erlang-p1-acme.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index abbd9e8083..d0e915779a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1262,6 +1262,7 @@ F:	package/erlang-idna/
 F:	package/erlang-jiffy/
 F:	package/erlang-jose/
 F:	package/erlang-lager/
+F:	package/erlang-p1-acme/
 F:	package/erlang-p1-cache-tab/
 F:	package/erlang-p1-iconv/
 F:	package/erlang-p1-mqtree/
diff --git a/package/Config.in b/package/Config.in
index 7914571ffb..436216338a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -583,6 +583,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-jiffy/Config.in"
 	source "package/erlang-jose/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-acme/Config.in"
 	source "package/erlang-p1-cache-tab/Config.in"
 	source "package/erlang-p1-iconv/Config.in"
 	source "package/erlang-p1-mqtree/Config.in"
diff --git a/package/erlang-p1-acme/Config.in b/package/erlang-p1-acme/Config.in
new file mode 100644
index 0000000000..2cd1985a4b
--- /dev/null
+++ b/package/erlang-p1-acme/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_ERLANG_P1_ACME
+	bool "erlang-p1-acme"
+	select BR2_PACKAGE_ERLANG_IDNA
+	select BR2_PACKAGE_ERLANG_JIFFY
+	select BR2_PACKAGE_ERLANG_JOSE
+	select BR2_PACKAGE_ERLANG_P1_YCONF
+	help
+	  ACME client library for Erlang.
+
+	  https://github.com/processone/p1_acme
diff --git a/package/erlang-p1-acme/erlang-p1-acme.hash b/package/erlang-p1-acme/erlang-p1-acme.hash
new file mode 100644
index 0000000000..036cb923bd
--- /dev/null
+++ b/package/erlang-p1-acme/erlang-p1-acme.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 556a9628c323a5a83116ed78599c891f74447b0bac237c095e776c7009089656 erlang-p1-acme-1.0.1.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE.txt
diff --git a/package/erlang-p1-acme/erlang-p1-acme.mk b/package/erlang-p1-acme/erlang-p1-acme.mk
new file mode 100644
index 0000000000..ae77d4a580
--- /dev/null
+++ b/package/erlang-p1-acme/erlang-p1-acme.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-p1-acme
+#
+################################################################################
+
+ERLANG_P1_ACME_VERSION = 1.0.1
+ERLANG_P1_ACME_SITE = $(call github,processone,p1_acme,$(ERLANG_P1_ACME_VERSION))
+ERLANG_P1_ACME_LICENSE = Apache-2.0
+ERLANG_P1_ACME_LICENSE_FILES = LICENSE.txt
+ERLANG_P1_ACME_DEPENDENCIES = erlang-idna erlang-jiffy erlang-jose erlang-p1-yconf
+
+$(eval $(rebar-package))
