From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 21 Aug 2018 22:41:32 +0200
Subject: [Buildroot] [PATCH/next v2 1/3] package/perl-crypt-openssl-guess:
 new package
Message-ID: <20180821204134.2819-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming version bumps of perl-crypt-openssl-random and
perl-crypt-openssl-rsa, only host-package is needed.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: switched to host package (Thomas)

 DEVELOPERS                                          |  1 +
 .../perl-crypt-openssl-guess.hash                   |  6 ++++++
 .../perl-crypt-openssl-guess.mk                     | 13 +++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
 create mode 100644 package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ccbc0a3b7a..154315fcfb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -330,6 +330,7 @@ F:	package/libyuv/
 F:	package/mesa3d/
 F:	package/minidlna/
 F:	package/mjpg-streamer/
+F:	package/perl-crypt-openssl-guess/
 F:	package/perl-crypt-openssl-random/
 F:	package/perl-crypt-openssl-rsa/
 F:	package/perl-digest-sha1/
diff --git a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
new file mode 100644
index 0000000000..327b06900a
--- /dev/null
+++ b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    e768fe2c07826b0ac9ea604c79f93032 Crypt-OpenSSL-Guess-0.11.tar.gz
+sha256 aa6b18e38cb852cbad80a58cd90c395b40819d4d01e0ab37e7703149094d7167 Crypt-OpenSSL-Guess-0.11.tar.gz
+
+# computed by scancpan
+sha256 5c739f181ce7aa31d739277996ff230067dad39332e5597c0dffd36e5d784072 LICENSE
diff --git a/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
new file mode 100644
index 0000000000..69d7a0ef8f
--- /dev/null
+++ b/package/perl-crypt-openssl-guess/perl-crypt-openssl-guess.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-crypt-openssl-guess
+#
+################################################################################
+
+PERL_CRYPT_OPENSSL_GUESS_VERSION = 0.11
+PERL_CRYPT_OPENSSL_GUESS_SOURCE = Crypt-OpenSSL-Guess-$(PERL_CRYPT_OPENSSL_GUESS_VERSION).tar.gz
+PERL_CRYPT_OPENSSL_GUESS_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AK/AKIYM
+PERL_CRYPT_OPENSSL_GUESS_LICENSE = Artistic or GPL-1.0+
+PERL_CRYPT_OPENSSL_GUESS_LICENSE_FILES = LICENSE
+
+$(eval $(host-perl-package))
-- 
2.18.0
