From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  8 Jan 2020 16:10:41 +0100
Subject: [Buildroot] [PATCH v2 5/5] package/perl-net-ping: remove it
In-Reply-To: <20200108151041.12757-1-francois.perrad@gadz.org>
References: <20200108151041.12757-1-francois.perrad@gadz.org>
Message-ID: <20200108151041.12757-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Net::Ping is a Perl core module (ie. bundled with perl)
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Config.in.legacy                         |  6 ++++++
 DEVELOPERS                               |  1 -
 package/Config.in                        |  1 -
 package/perl-net-ping/Config.in          |  6 ------
 package/perl-net-ping/perl-net-ping.hash |  6 ------
 package/perl-net-ping/perl-net-ping.mk   | 14 --------------
 6 files changed, 6 insertions(+), 28 deletions(-)
 delete mode 100644 package/perl-net-ping/Config.in
 delete mode 100644 package/perl-net-ping/perl-net-ping.hash
 delete mode 100644 package/perl-net-ping/perl-net-ping.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index e1e868531..85f88be15 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -158,6 +158,12 @@ config BR2_PACKAGE_PERL_MIME_BASE64
 	help
 	  MIME::Base64 is a Perl core module (ie. bundled with perl).
 
+config BR2_PACKAGE_PERL_NET_PING
+	bool "perl-net-ping was removed"
+	select BR2_LEGACY
+	help
+	  Net::Ping is a Perl core module (ie. bundled with perl).
+
 comment "Legacy options removed in 2019.11"
 
 config BR2_PACKAGE_OPENVMTOOLS_PROCPS
diff --git a/DEVELOPERS b/DEVELOPERS
index ba75f601f..4d2a442dc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2286,7 +2286,6 @@ F:	package/perl-crypt-openssl-aes/
 F:	package/perl-math-prime-util/
 F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
-F:	package/perl-net-ping/
 F:	package/perl-net-snmp/
 F:	package/perl-net-ssh2/
 F:	package/perl-net-telnet/
diff --git a/package/Config.in b/package/Config.in
index 5dab6ba31..fc97e6eb4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -761,7 +761,6 @@ menu "Perl libraries/modules"
 	source "package/perl-moo/Config.in"
 	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-http/Config.in"
-	source "package/perl-net-ping/Config.in"
 	source "package/perl-net-snmp/Config.in"
 	source "package/perl-net-ssh2/Config.in"
 	source "package/perl-net-ssleay/Config.in"
diff --git a/package/perl-net-ping/Config.in b/package/perl-net-ping/Config.in
deleted file mode 100644
index 21239a095..000000000
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
index 2842827c8..000000000
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
index b422c4eab..000000000
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
-- 
2.20.1
