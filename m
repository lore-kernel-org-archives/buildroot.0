From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  3 Jul 2014 18:53:25 +0200
Subject: [Buildroot] [v2 2/3] perl-net-ssleay: fix build
In-Reply-To: <1404406406-9209-1-git-send-email-francois.perrad@gadz.org>
References: <1404406406-9209-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1404406406-9209-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

set the correct prefix, instead of '/usr' detected on the host

see http://autobuild.buildroot.net/results/135/135867ef85535863e3647cc5fb82accb6f77612c/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-ssleay/perl-net-ssleay.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 413fdf0..7e4c194 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -11,4 +11,6 @@ PERL_NET_SSLEAY_DEPENDENCIES = perl openssl
 PERL_NET_SSLEAY_LICENSE = OpenSSL
 PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
 
+PERL_NET_SSLEAY_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr
+
 $(eval $(perl-package))
-- 
1.9.1
