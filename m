From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 12 Jun 2017 15:40:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/erlang-p1-xmpp: Add a missing
	dependency from a selected package
Message-ID: <20170612134039.26191-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package selects erlang-p1-stringprep, which depends on
BR2_INSTALL_LIBSTDCPP. Thus, it should also depend on this item.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-xmpp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/erlang-p1-xmpp/Config.in b/package/erlang-p1-xmpp/Config.in
index 1d518e2023..c7a68bc800 100644
--- a/package/erlang-p1-xmpp/Config.in
+++ b/package/erlang-p1-xmpp/Config.in
@@ -1,5 +1,9 @@
+comment "erlang-p1-xmpp needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_ERLANG_P1_XMPP
 	bool "erlang-p1-xmpp"
+	depends on BR2_INSTALL_LIBSTDCPP # erlang-p1-stringprep
 	select BR2_PACKAGE_ERLANG_P1_XML
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	help
-- 
2.11.0
