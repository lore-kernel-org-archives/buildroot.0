From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Nov 2018 19:55:32 +0100
Subject: [Buildroot] [git commit] perl-net-ssleay: fix dependency
Message-ID: <20181129185455.9E0B57FEF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1514da371f83ddc3345d688671f1a1c36bb74594
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this dependency was accidentally removed
by https://git.busybox.net/buildroot/commit/package/perl-net-ssleay?id=da9e06cabc578bf9138e100d1492a2d5f2038415

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-net-ssleay/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-net-ssleay/Config.in b/package/perl-net-ssleay/Config.in
index 16b18c45d6..6998553ef8 100644
--- a/package/perl-net-ssleay/Config.in
+++ b/package/perl-net-ssleay/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_NET_SSLEAY
 	bool "perl-net-ssleay"
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_OPENSSL
 	help
 	  Perl extension for using OpenSSL.
 
