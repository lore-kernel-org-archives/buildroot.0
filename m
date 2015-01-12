From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 12 Jan 2015 10:32:16 +0100
Subject: [Buildroot] [PATCH v6 12/16] erlang-p1-stringprep: new package.
In-Reply-To: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1421055140-5092-13-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/Config.in                                    |  1 +
 package/erlang-p1-stringprep/Config.in               |  6 ++++++
 package/erlang-p1-stringprep/erlang-p1-stringprep.mk | 12 ++++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/erlang-p1-stringprep/Config.in
 create mode 100644 package/erlang-p1-stringprep/erlang-p1-stringprep.mk

diff --git a/package/Config.in b/package/Config.in
index 5a2707e..d48c305 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -402,6 +402,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-stringprep/Config.in"
 	source "package/erlang-p1-stun/Config.in"
 	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
diff --git a/package/erlang-p1-stringprep/Config.in b/package/erlang-p1-stringprep/Config.in
new file mode 100644
index 0000000..3ef77ed
--- /dev/null
+++ b/package/erlang-p1-stringprep/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_ERLANG_P1_STRINGPREP
+	bool "erlang-p1-stringprep"
+	help
+	  Erlang interface to stringprep
+
+	  https://github.com/processone/stringprep
diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
new file mode 100644
index 0000000..95b5402
--- /dev/null
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# erlang-p1-stringprep
+#
+################################################################################
+
+ERLANG_P1_STRINGPREP_VERSION = 9e9e0f8
+ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
+ERLANG_P1_STRINGPREP_LICENSE = GPLv2+
+ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.TCL
+
+$(eval $(rebar-package))
-- 
2.1.0
