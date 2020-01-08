From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jan 2020 18:24:00 +0100
Subject: [Buildroot] [git commit] package/perl-net-ping: remove it
Message-ID: <20200108171504.8EED684054@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1e54f71ef85b558affce1ee28efaefe160665b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Net::Ping is a Perl core module (ie. bundled with perl)
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                         |  6 ++++++
 DEVELOPERS                               |  1 -
 package/Config.in                        |  1 -
 package/perl-net-ping/Config.in          |  6 ------
 package/perl-net-ping/perl-net-ping.hash |  6 ------
 package/perl-net-ping/perl-net-ping.mk   | 14 --------------
 6 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 80a26b4f01..c483ac3856 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2020.02"
 
+config BR2_PACKAGE_PERL_NET_PING
+	bool "perl-net-ping was removed"
+	select BR2_LEGACY
+	help
+	  Net::Ping is a Perl core module (ie. bundled with perl).
+
 config BR2_PACKAGE_PERL_MIME_BASE64
 	bool "perl-mime-base64 was removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index c2a6356aa0..1f86c256a5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2375,7 +2375,6 @@ F:	package/perl-crypt-openssl-aes/
 F:	package/perl-math-prime-util/
 F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
-F:	package/perl-net-ping/
 F:	package/perl-net-snmp/
 F:	package/perl-net-ssh2/
 F:	package/perl-net-telnet/
diff --git a/package/Config.in b/package/Config.in
index bec618a08f..45935ce18e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -775,7 +775,6 @@ menu "Perl libraries/modules"
 	source "package/perl-moo/Config.in"
 	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-http/Config.in"
-	source "package/perl-net-ping/Config.in"
 	source "package/perl-net-snmp/Config.in"
 	source "package/perl-net-ssh2/Config.in"
 	source "package/perl-net-ssleay/Config.in"
diff --git a/package/perl-net-ping/Config.in b/package/perl-net-ping/Config.in
deleted file mode 100644
index 21239a095f..0000000000
--- a/package/perl-net-ping/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_PERL_NET_PING
-	bool "perl-net-ping"
-	help
-	  check a remote host for reachability.
-
-	  https://metacpan.org/release/Net-Ping
diff --git a/package/perl-net-ping/perl-net-ping.hash b/package/perl-net-ping/perl-net-ping.hash
deleted file mode 100644
index 2842827c85..0000000000
--- a/package/perl-net-ping/perl-net-ping.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5    eb90f86dcc31126e88be02ecb62d5303 Net-Ping-2.72.tar.gz
-sha256 555af602f54229cd81fef7da1a81516800f3155c6dc4d07dc71be1de3253dd6a Net-Ping-2.72.tar.gz
-
-# computed by scancpan
-sha256 9441a22309a2b40ff1282ac1906c137f07f5e521e7b1ec162b251f6006051b47 README
diff --git a/package/perl-net-ping/perl-net-ping.mk b/package/perl-net-ping/perl-net-ping.mk
deleted file mode 100644
index b422c4eaba..0000000000
--- a/package/perl-net-ping/perl-net-ping.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# perl-net-ping
-#
-################################################################################
-
-PERL_NET_PING_VERSION = 2.72
-PERL_NET_PING_SOURCE = Net-Ping-$(PERL_NET_PING_VERSION).tar.gz
-PERL_NET_PING_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
-PERL_NET_PING_LICENSE = Artistic or GPL-1.0+
-PERL_NET_PING_LICENSE_FILES = README
-PERL_NET_PING_DISTNAME = Net-Ping
-
-$(eval $(perl-package))
