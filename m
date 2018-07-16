From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 13:30:32 +0200
Subject: [Buildroot] [git commit] perl-mime-base64-urlsafe: new package
Message-ID: <20180716113231.AE6FF8447D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=512cedea05bb8004bd00c98cefc2e57f52788245
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                   |  1 +
 package/Config.in                                            |  1 +
 package/perl-mime-base64-urlsafe/Config.in                   |  6 ++++++
 .../perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.hash   |  6 ++++++
 package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk | 12 ++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6208e2b6b2..88b4ad0a65 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1925,6 +1925,7 @@ F:	package/perl-convert-asn1/
 F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
 F:	package/perl-digest-md5/
+F:	package/perl-mime-base64-urlsafe/
 F:	package/pigz/
 F:	support/scripts/size-stats
 F:	utils/size-stats-compare
diff --git a/package/Config.in b/package/Config.in
index 1408b46bb7..e67bcc7f25 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -694,6 +694,7 @@ menu "Perl libraries/modules"
 	source "package/perl-lwp-mediatypes/Config.in"
 	source "package/perl-mail-dkim/Config.in"
 	source "package/perl-mailtools/Config.in"
+	source "package/perl-mime-base64-urlsafe/Config.in"
 	source "package/perl-mime-base64/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-dns/Config.in"
diff --git a/package/perl-mime-base64-urlsafe/Config.in b/package/perl-mime-base64-urlsafe/Config.in
new file mode 100644
index 0000000000..8abfdc25ab
--- /dev/null
+++ b/package/perl-mime-base64-urlsafe/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_MIME_BASE64_URLSAFE
+	bool "perl-mime-base64-urlsafe"
+	help
+	  Perl version of Python's URL-safe base64 codec
+
+	  https://metacpan.org/release/MIME-Base64-URLSafe
diff --git a/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.hash b/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.hash
new file mode 100644
index 0000000000..c6d01afe38
--- /dev/null
+++ b/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    eccf42cc7e9576dd23b9f39ad59c9b62 MIME-Base64-URLSafe-0.01.tar.gz
+sha256 cb9966c50538bb676ab67bc40a7c841019b23ba2243d0ffcc2ccf084e5c33798 MIME-Base64-URLSafe-0.01.tar.gz
+
+# computed by scancpan
+sha256 2fffac76f75709b6d94111a37f6cd8cab21e8f2b2de73b0b4fa53a5bed4efc15 README
diff --git a/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk b/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk
new file mode 100644
index 0000000000..d72b36fb04
--- /dev/null
+++ b/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# perl-mime-base64-urlsafe
+#
+################################################################################
+
+PERL_MIME_BASE64_URLSAFE_VERSION = 0.01
+PERL_MIME_BASE64_URLSAFE_SOURCE = MIME-Base64-URLSafe-$(PERL_MIME_BASE64_URLSAFE_VERSION).tar.gz
+PERL_MIME_BASE64_URLSAFE_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZUHO
+PERL_MIME_BASE64_URLSAFE_LICENSE_FILES = README
+
+$(eval $(perl-package))
