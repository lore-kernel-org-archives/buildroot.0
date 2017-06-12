From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 23:21:28 +0200
Subject: [Buildroot] [git commit] package/erlang-p1-xmpp: add missing
	dependency on C++ from erlang-p1-stringprep
Message-ID: <20170612212205.EB8B3816A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31ad7876d253bf9f53c3be97e51ee5562d84c56e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package selects erlang-p1-stringprep, which depends on
BR2_INSTALL_LIBSTDCPP. Thus, it should also depend on this item.

Fixes:

  http://autobuild.buildroot.net/results/fe76971fead52acdd64612161e92a48a4ad36572/

Signed-off-by: Johan Oudinet <johan.oudinet@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-xmpp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/erlang-p1-xmpp/Config.in b/package/erlang-p1-xmpp/Config.in
index 1d518e2..c7a68bc 100644
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
