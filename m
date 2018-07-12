From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Thu, 12 Jul 2018 23:00:54 +0200
Subject: [Buildroot] [PATCH 10/10] perl-net-telnet: new package
In-Reply-To: <20180712210054.13775-1-thomas.de_schampheleire@nokia.com>
References: <20180712210054.13775-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180712210054.13775-11-thomas.de_schampheleire@nokia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/perl-net-telnet/Config.in            |  6 ++++++
 package/perl-net-telnet/perl-net-telnet.hash |  6 ++++++
 package/perl-net-telnet/perl-net-telnet.mk   | 12 ++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/perl-net-telnet/Config.in
 create mode 100644 package/perl-net-telnet/perl-net-telnet.hash
 create mode 100644 package/perl-net-telnet/perl-net-telnet.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f509041441..f37efa457a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1930,6 +1930,7 @@ F:	package/perl-mojolicious-plugin-authentication/
 F:	package/perl-net-ping/
 F:	package/perl-net-snmp/
 F:	package/perl-net-ssh2/
+F:	package/perl-net-telnet/
 F:	package/pigz/
 F:	support/scripts/size-stats
 F:	utils/size-stats-compare
diff --git a/package/Config.in b/package/Config.in
index 40547760fc..c980e81003 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -704,6 +704,7 @@ menu "Perl libraries/modules"
 	source "package/perl-net-snmp/Config.in"
 	source "package/perl-net-ssh2/Config.in"
 	source "package/perl-net-ssleay/Config.in"
+	source "package/perl-net-telnet/Config.in"
 	source "package/perl-netaddr-ip/Config.in"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-time-hires/Config.in"
diff --git a/package/perl-net-telnet/Config.in b/package/perl-net-telnet/Config.in
new file mode 100644
index 0000000000..6d7993c608
--- /dev/null
+++ b/package/perl-net-telnet/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_NET_TELNET
+	bool "perl-net-telnet"
+	help
+	  Interact with TELNET port or other TCP ports
+
+	  https://metacpan.org/release/Net-Telnet
diff --git a/package/perl-net-telnet/perl-net-telnet.hash b/package/perl-net-telnet/perl-net-telnet.hash
new file mode 100644
index 0000000000..cf1def6a57
--- /dev/null
+++ b/package/perl-net-telnet/perl-net-telnet.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    d2514080116c1b0fa5f96295c84538e3 Net-Telnet-3.04.tar.gz
+sha256 e64d567a4e16295ecba949368e7a6b8b5ae2a16b3ad682121d9b007dc5d2a37a Net-Telnet-3.04.tar.gz
+
+# computed by scancpan
+sha256 05beca683093827706ef45a4958bf23bcd91990e0beeb0b098f97c661478c90d README
diff --git a/package/perl-net-telnet/perl-net-telnet.mk b/package/perl-net-telnet/perl-net-telnet.mk
new file mode 100644
index 0000000000..04d170d10a
--- /dev/null
+++ b/package/perl-net-telnet/perl-net-telnet.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# perl-net-telnet
+#
+################################################################################
+
+PERL_NET_TELNET_VERSION = 3.04
+PERL_NET_TELNET_SOURCE = Net-Telnet-$(PERL_NET_TELNET_VERSION).tar.gz
+PERL_NET_TELNET_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JR/JROGERS
+PERL_NET_TELNET_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
2.16.4
