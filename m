From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:24:44 +0100
Subject: [Buildroot] [git commit] package/erlang-jose: new package
Message-ID: <20200106201550.868618EE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e14e61c26c760b9c2f66e88d15d2ac4f6a3f3585
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/erlang-jose/Config.in        |  8 ++++++++
 package/erlang-jose/erlang-jose.hash |  3 +++
 package/erlang-jose/erlang-jose.mk   | 13 +++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 590c54d065..18adc166f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1259,6 +1259,7 @@ F:	package/erlang-base64url/
 F:	package/erlang-eimp/
 F:	package/erlang-goldrush/
 F:	package/erlang-jiffy/
+F:	package/erlang-jose/
 F:	package/erlang-lager/
 F:	package/erlang-p1-cache-tab/
 F:	package/erlang-p1-iconv/
diff --git a/package/Config.in b/package/Config.in
index 0c4698f601..52d556c5ee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -580,6 +580,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-eimp/Config.in"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-jiffy/Config.in"
+	source "package/erlang-jose/Config.in"
 	source "package/erlang-lager/Config.in"
 	source "package/erlang-p1-cache-tab/Config.in"
 	source "package/erlang-p1-iconv/Config.in"
diff --git a/package/erlang-jose/Config.in b/package/erlang-jose/Config.in
new file mode 100644
index 0000000000..8101ff4103
--- /dev/null
+++ b/package/erlang-jose/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ERLANG_JOSE
+	bool "erlang-jose"
+	select BR2_PACKAGE_ERLANG_BASE64URL
+	help
+	  JSON Object Signing and Encryption (JOSE) for Erlang and
+	  Elixir.
+
+	  https://github.com/potatosalad/erlang-jose
diff --git a/package/erlang-jose/erlang-jose.hash b/package/erlang-jose/erlang-jose.hash
new file mode 100644
index 0000000000..71a1543d92
--- /dev/null
+++ b/package/erlang-jose/erlang-jose.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 d55a9d3a1697833fed555a21f1aeb2727af88193995cb6ffa945d4b6749d0e8d erlang-jose-1.9.0.tar.gz
+sha256 6397e2bd9a35a64c1bb798b937071fbe49d90667f717e65c74a0d0fe93d5c1be LICENSE.md
diff --git a/package/erlang-jose/erlang-jose.mk b/package/erlang-jose/erlang-jose.mk
new file mode 100644
index 0000000000..43ed22a9f7
--- /dev/null
+++ b/package/erlang-jose/erlang-jose.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# erlang-jose
+#
+################################################################################
+
+ERLANG_JOSE_VERSION = 1.9.0
+ERLANG_JOSE_SITE = $(call github,potatosalad,erlang-jose,$(ERLANG_JOSE_VERSION))
+ERLANG_JOSE_LICENSE = MIT
+ERLANG_JOSE_LICENSE_FILES = LICENSE.md
+ERLANG_JOSE_DEPENDENCIES = erlang-base64url
+
+$(eval $(rebar-package))
