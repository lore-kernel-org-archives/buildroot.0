From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 21 Mar 2020 09:55:34 +0100
Subject: [Buildroot] [PATCH] package/perl-crypt-ssleay: fix configure step
Message-ID: <20200321085534.21655-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

currently, the compilation of openssl-version.c relies on include files
from the system libssl-dev

see http://autobuild.buildroot.org/results/306/30659feaa11e7d0daf01c41e1bc1da2b9538968c/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-crypt-ssleay/perl-crypt-ssleay.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/perl-crypt-ssleay/perl-crypt-ssleay.mk b/package/perl-crypt-ssleay/perl-crypt-ssleay.mk
index 9564ee2b3..a67554847 100644
--- a/package/perl-crypt-ssleay/perl-crypt-ssleay.mk
+++ b/package/perl-crypt-ssleay/perl-crypt-ssleay.mk
@@ -15,4 +15,6 @@ PERL_CRYPT_SSLEAY_LICENSE = Artistic-2.0
 PERL_CRYPT_SSLEAY_LICENSE_FILES = README.md
 PERL_CRYPT_SSLEAY_DISTNAME = Crypt-SSLeay
 
+PERL_CRYPT_SSLEAY_CONF_OPTS = --incpath=$(STAGING_DIR)/usr/include
+
 $(eval $(perl-package))
-- 
2.20.1
