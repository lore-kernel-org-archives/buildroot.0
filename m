From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:24:44 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-yconf: new package
Message-ID: <20200106201550.AEFF18EE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b98498d6e946c2ddde3c0047829491147375bd97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/erlang-p1-yconf/Config.in            |  5 +++++
 package/erlang-p1-yconf/erlang-p1-yconf.hash |  3 +++
 package/erlang-p1-yconf/erlang-p1-yconf.mk   | 13 +++++++++++++
 5 files changed, 23 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fb226ccaa8..abbd9e8083 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1275,6 +1275,7 @@ F:	package/erlang-p1-utils/
 F:	package/erlang-p1-xml/
 F:	package/erlang-p1-xmpp/
 F:	package/erlang-p1-yaml/
+F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
 F:	package/nginx-dav-ext/
 
diff --git a/package/Config.in b/package/Config.in
index 853961ee87..7914571ffb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -596,6 +596,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-xml/Config.in"
 	source "package/erlang-p1-xmpp/Config.in"
 	source "package/erlang-p1-yaml/Config.in"
+	source "package/erlang-p1-yconf/Config.in"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
 endif
diff --git a/package/erlang-p1-yconf/Config.in b/package/erlang-p1-yconf/Config.in
new file mode 100644
index 0000000000..3777ebbe14
--- /dev/null
+++ b/package/erlang-p1-yconf/Config.in
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_ERLANG_P1_YCONF
+	bool "erlang-p1-yconf"
+	select BR2_PACKAGE_ERLANG_P1_YAML
+	help
+	  YAML configuration processor.
diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.hash b/package/erlang-p1-yconf/erlang-p1-yconf.hash
new file mode 100644
index 0000000000..6d0a9f68a1
--- /dev/null
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 94724bde03c976cdf51d0d43eece73c70381ef60a9dd7e49292d194c0beaeb53 erlang-p1-yconf-1.0.1.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
diff --git a/package/erlang-p1-yconf/erlang-p1-yconf.mk b/package/erlang-p1-yconf/erlang-p1-yconf.mk
new file mode 100644
index 0000000000..5d44ec7eec
--- /dev/null
+++ b/package/erlang-p1-yconf/erlang-p1-yconf.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-p1-yconf
+#
+################################################################################
+
+ERLANG_P1_YCONF_VERSION = 1.0.1
+ERLANG_P1_YCONF_SITE = $(call github,processone,yconf,$(ERLANG_P1_YCONF_VERSION))
+ERLANG_P1_YCONF_LICENSE = Apache-2.0
+ERLANG_P1_YCONF_LICENSE_FILES = LICENSE
+ERLANG_P1_YCONF_DEPENDENCIES = erlang-p1-yaml
+
+$(eval $(rebar-package))
