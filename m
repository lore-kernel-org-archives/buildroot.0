From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Mar 2020 17:46:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/erlang-p1-acme: needs C++
Message-ID: <20200307164619.1435341-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/79310855f9a2abe569365ffd27e776f1a56dba2e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/erlang-p1-acme/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/erlang-p1-acme/Config.in b/package/erlang-p1-acme/Config.in
index 2cd1985a4b..2c0d1d0337 100644
--- a/package/erlang-p1-acme/Config.in
+++ b/package/erlang-p1-acme/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ERLANG_P1_ACME
 	bool "erlang-p1-acme"
+	depends on BR2_INSTALL_LIBSTDCPP # erlang-jiffy
 	select BR2_PACKAGE_ERLANG_IDNA
 	select BR2_PACKAGE_ERLANG_JIFFY
 	select BR2_PACKAGE_ERLANG_JOSE
@@ -8,3 +9,6 @@ config BR2_PACKAGE_ERLANG_P1_ACME
 	  ACME client library for Erlang.
 
 	  https://github.com/processone/p1_acme
+
+comment "erlang-p1-acme needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.25.0
