From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:24:44 +0100
Subject: [Buildroot] [git commit] package/erlang-base64url: new package
Message-ID: <20200106201550.7C5408EE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7cf5b99bbbe54e99b4897df08803672428666f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/erlang-base64url/Config.in             |  6 ++++++
 package/erlang-base64url/erlang-base64url.hash |  3 +++
 package/erlang-base64url/erlang-base64url.mk   | 12 ++++++++++++
 5 files changed, 23 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 63e6981570..590c54d065 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1255,6 +1255,7 @@ F:	package/python-libconfig/
 
 N:	Johan Oudinet <johan.oudinet@gmail.com>
 F:	package/ejabberd/
+F:	package/erlang-base64url/
 F:	package/erlang-eimp/
 F:	package/erlang-goldrush/
 F:	package/erlang-jiffy/
diff --git a/package/Config.in b/package/Config.in
index 894284c650..0c4698f601 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -576,6 +576,7 @@ menu "Interpreter languages and scripting"
 	source "package/erlang/Config.in"
 if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
+	source "package/erlang-base64url/Config.in"
 	source "package/erlang-eimp/Config.in"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-jiffy/Config.in"
diff --git a/package/erlang-base64url/Config.in b/package/erlang-base64url/Config.in
new file mode 100644
index 0000000000..7883fa3831
--- /dev/null
+++ b/package/erlang-base64url/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_BASE64URL
+	bool "erlang-base64url"
+	help
+	  URL safe base64-compatible codec.
+
+	  https://github.com/dvv/base64url
diff --git a/package/erlang-base64url/erlang-base64url.hash b/package/erlang-base64url/erlang-base64url.hash
new file mode 100644
index 0000000000..becbe5db61
--- /dev/null
+++ b/package/erlang-base64url/erlang-base64url.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 7ef7210effd25ac1f82f190fcfaef53e49d7bc40bb94112c4aa07266c32a851b erlang-base64url-1.0.1.tar.gz
+sha256 d59dff2fa4c39f05188ee533fbf06479eef1b47f8cad6353f8ab3726cc6923bc LICENSE.txt
diff --git a/package/erlang-base64url/erlang-base64url.mk b/package/erlang-base64url/erlang-base64url.mk
new file mode 100644
index 0000000000..2d49631941
--- /dev/null
+++ b/package/erlang-base64url/erlang-base64url.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# erlang-base64url
+#
+################################################################################
+
+ERLANG_BASE64URL_VERSION = 1.0.1
+ERLANG_BASE64URL_SITE = $(call github,dvv,base64url,$(ERLANG_BASE64URL_VERSION))
+ERLANG_BASE64URL_LICENSE = MIT
+ERLANG_BASE64URL_LICENSE_FILES = LICENSE.txt
+
+$(eval $(rebar-package))
