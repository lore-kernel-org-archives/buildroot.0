From: Christopher McCrory <chrismcc@gmail.com>
Date: Sat, 11 Aug 2018 11:27:33 -0700
Subject: [Buildroot] [PATCH 01/17] perl-cgi: add host
In-Reply-To: <20180811182749.20924-1-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
Message-ID: <20180811182749.20924-2-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/perl-cgi/perl-cgi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/perl-cgi/perl-cgi.mk b/package/perl-cgi/perl-cgi.mk
index b8115de6ad..476f5f69c3 100644
--- a/package/perl-cgi/perl-cgi.mk
+++ b/package/perl-cgi/perl-cgi.mk
@@ -8,7 +8,9 @@ PERL_CGI_VERSION = 4.38
 PERL_CGI_SOURCE = CGI-$(PERL_CGI_VERSION).tar.gz
 PERL_CGI_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEEJO
 PERL_CGI_DEPENDENCIES = perl-html-parser
+HOST_PERL_CGI_DEPENDENCIES = host-perl-html-parser
 PERL_CGI_LICENSE = Artistic or GPL-1.0+
 PERL_CGI_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
2.14.4
