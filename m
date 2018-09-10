From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:42:18 +0200
Subject: [Buildroot] [git commit] pkg-perl: fix previous commit
Message-ID: <20180910154123.01E0683B10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e58e19a9ec1dc1a6900063c43aa9d32b6578ecf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

there is no variable PERL_INSTALL_NAME in master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-perl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 2888872dc8..ebc6710bd4 100644
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
