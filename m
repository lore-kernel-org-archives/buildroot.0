From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 28 Oct 2015 20:17:38 +0100
Subject: [Buildroot] [PATCH] host-perl: fix patching
Message-ID: <1446059858-2646-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.net/results/c8e/c8e6bbe50ca71835bdde9503a9fe23ace8236a09/

the newest patches are against perl-cross,
so we need to extract perl-cross in the host-perl case.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 7192700..d35e05c 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -31,6 +31,7 @@ define PERL_CROSS_EXTRACT
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
 endef
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
+HOST_PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
 define PERL_CROSS_SET_POD
 	$(SED) s/$(PERL_CROSS_OLD_POD)/$(PERL_CROSS_NEW_POD)/g $(@D)/Makefile
-- 
2.5.0
