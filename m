From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:24:44 +0100
Subject: [Buildroot] [git commit] package/erlang-idna: new package
Message-ID: <20200106201550.909458EE4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad9542ae8d0d8866d41aeddfdea58bad30d5229e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/erlang-idna/Config.in        |  6 ++++++
 package/erlang-idna/erlang-idna.hash |  3 +++
 package/erlang-idna/erlang-idna.mk   | 12 ++++++++++++
 5 files changed, 23 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 18adc166f7..606ee1a87c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1258,6 +1258,7 @@ F:	package/ejabberd/
 F:	package/erlang-base64url/
 F:	package/erlang-eimp/
 F:	package/erlang-goldrush/
+F:	package/erlang-idna/
 F:	package/erlang-jiffy/
 F:	package/erlang-jose/
 F:	package/erlang-lager/
diff --git a/package/Config.in b/package/Config.in
index 52d556c5ee..15e9348502 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -579,6 +579,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-base64url/Config.in"
 	source "package/erlang-eimp/Config.in"
 	source "package/erlang-goldrush/Config.in"
+	source "package/erlang-idna/Config.in"
 	source "package/erlang-jiffy/Config.in"
 	source "package/erlang-jose/Config.in"
 	source "package/erlang-lager/Config.in"
diff --git a/package/erlang-idna/Config.in b/package/erlang-idna/Config.in
new file mode 100644
index 0000000000..de7116689a
--- /dev/null
+++ b/package/erlang-idna/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_IDNA
+	bool "erlang-idna"
+	help
+	  A pure Erlang IDNA implementation that follows RFC5891.
+
+	  https://github.com/benoitc/erlang-idna
diff --git a/package/erlang-idna/erlang-idna.hash b/package/erlang-idna/erlang-idna.hash
new file mode 100644
index 0000000000..2200bbad8d
--- /dev/null
+++ b/package/erlang-idna/erlang-idna.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 d57e20ee88018ff0431e0275e91ada5915782870c9981fc798bcd05589031d6f erlang-idna-6.0.0.tar.gz
+sha256 95f5c9410a95332b0833c4606028ee00008cd8c497336e230df3144d1a720bda LICENSE
diff --git a/package/erlang-idna/erlang-idna.mk b/package/erlang-idna/erlang-idna.mk
new file mode 100644
index 0000000000..27a32fb06d
--- /dev/null
+++ b/package/erlang-idna/erlang-idna.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# erlang-idna
+#
+################################################################################
+
+ERLANG_IDNA_VERSION = 6.0.0
+ERLANG_IDNA_SITE = $(call github,benoitc,erlang-idna,$(ERLANG_IDNA_VERSION))
+ERLANG_IDNA_LICENSE = MIT
+ERLANG_IDNA_LICENSE_FILES = LICENSE
+
+$(eval $(rebar-package))
