From: Francois Perrad <fperrad@gmail.com>
Date: Sun,  9 Sep 2018 16:02:06 +0200
Subject: [Buildroot] [PATCH] pkg-perl: fix previous commit
Message-ID: <20180909140206.21822-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

there is no variable PERL_INSTALL_NAME in master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pkg-perl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 2888872dc..ebc6710bd 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -102,7 +102,7 @@ define $(2)_CONFIGURE_CMDS
 			LD="$$(TARGET_CC)" \
 			LDDLFLAGS="-shared $$(TARGET_LDFLAGS)" \
 			LDFLAGS="$$(TARGET_LDFLAGS)" \
-			PERL_INC=$$(STAGING_DIR)/usr/lib/$$(PERL_INSTALL_NAME)/$$(PERL_VERSION)/$$(PERL_ARCHNAME)/CORE \
+			PERL_INC=$$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$$(PERL_ARCHNAME)/CORE \
 			DESTDIR=$$(TARGET_DIR) \
 			INSTALLDIRS=vendor \
 			INSTALLVENDORLIB=/usr/lib/perl5/site_perl/$$(PERL_VERSION) \
-- 
2.17.1
