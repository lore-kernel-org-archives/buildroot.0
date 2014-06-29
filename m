From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:46:20 +0200
Subject: [Buildroot] [git commit] perl-net-ssleay: new package
Message-ID: <20140629085038.4DEF79BBA3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e0c33e535974b00a48da6b767f743e5fb68fa72
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |    1 +
 package/perl-net-ssleay/Config.in          |    7 +++++++
 package/perl-net-ssleay/perl-net-ssleay.mk |   14 ++++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index dc3d6b7..01a91b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -424,6 +424,7 @@ endif
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-mojolicious/Config.in"
+	source "package/perl-net-ssleay/Config.in"
 endmenu
 endif
 	source "package/php/Config.in"
diff --git a/package/perl-net-ssleay/Config.in b/package/perl-net-ssleay/Config.in
new file mode 100644
index 0000000..bc219b0
--- /dev/null
+++ b/package/perl-net-ssleay/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_NET_SSLEAY
+	bool "perl-net-ssleay"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Perl extension for using OpenSSL
+
+	  https://metacpan.org/release/Net-SSLeay
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
new file mode 100644
index 0000000..413fdf0
--- /dev/null
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-net-ssleay
+#
+################################################################################
+
+PERL_NET_SSLEAY_VERSION = 1.64
+PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
+PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM/
+PERL_NET_SSLEAY_DEPENDENCIES = perl openssl
+PERL_NET_SSLEAY_LICENSE = OpenSSL
+PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
