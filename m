From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 10:57:22 +0100
Subject: [Buildroot] [git commit] erlang-p1-stringprep: add missing
	dependency on erlang-p1-utils
Message-ID: <20160308095752.3609E80440@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09f020105ff507845509374025c1fdfa7fda805f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/6a6fe920eb54d05ba7aff0da9c4dc5a799ae0e3b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-stringprep/Config.in               | 1 +
 package/erlang-p1-stringprep/erlang-p1-stringprep.mk | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/erlang-p1-stringprep/Config.in b/package/erlang-p1-stringprep/Config.in
index bc4d139..4beac04 100644
--- a/package/erlang-p1-stringprep/Config.in
+++ b/package/erlang-p1-stringprep/Config.in
@@ -4,6 +4,7 @@ comment "erlang-p1-stringprep needs a toolchain w/ C++"
 config BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	bool "erlang-p1-stringprep"
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_ERLANG_P1_UTILS
 	help
 	  Erlang interface to stringprep
 
diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
index 0a5a1f5..3bc8c72 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
@@ -8,5 +8,6 @@ ERLANG_P1_STRINGPREP_VERSION = 1.0.0
 ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
 ERLANG_P1_STRINGPREP_LICENSE = TCL (tools/*.tcl), Apache-2.0 (rest)
 ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.ALL LICENSE.TCL LICENSE.txt
+ERLANG_P1_STRINGPREP_DEPENDENCIES = erlang-p1-utils
 
 $(eval $(rebar-package))
