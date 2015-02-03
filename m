From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:23:27 +0100
Subject: [Buildroot] [git commit] erlang-p1-stringprep: new package.
Message-ID: <20150203092417.E1C527FCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b41208c86cf764c040f961daddae1d77c913532
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fixup license, it uses the TCL license, and not GPLv2+.]

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/erlang-p1-stringprep/Config.in             |    6 ++++++
 .../erlang-p1-stringprep/erlang-p1-stringprep.mk   |   12 ++++++++++++
 3 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 050b160..f66e24e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -401,6 +401,7 @@ if BR2_PACKAGE_ERLANG
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
index 0000000..29bbe26
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
+ERLANG_P1_STRINGPREP_LICENSE = TCL
+ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.TCL
+
+$(eval $(rebar-package))
