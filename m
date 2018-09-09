From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Sep 2018 15:09:36 +0200
Subject: [Buildroot] [git commit] pkg-perl: move PERL_INC in configure step
Message-ID: <20180909130843.BA68083891@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae94fff1c5695b4efcab0aed69212476be85fb52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

this workaround for old ExtUtils-MakeMaker is now useless

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-perl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index b0d5789ac5..2888872dc8 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -102,6 +102,7 @@ define $(2)_CONFIGURE_CMDS
 			LD="$$(TARGET_CC)" \
 			LDDLFLAGS="-shared $$(TARGET_LDFLAGS)" \
 			LDFLAGS="$$(TARGET_LDFLAGS)" \
+			PERL_INC=$$(STAGING_DIR)/usr/lib/$$(PERL_INSTALL_NAME)/$$(PERL_VERSION)/$$(PERL_ARCHNAME)/CORE \
 			DESTDIR=$$(TARGET_DIR) \
 			INSTALLDIRS=vendor \
 			INSTALLVENDORLIB=/usr/lib/perl5/site_perl/$$(PERL_VERSION) \
@@ -147,7 +148,6 @@ define $(2)_BUILD_CMDS
 		$$(PERL_RUN) Build $$($(2)_BUILD_OPTS) build; \
 	else \
 		$$(MAKE1) \
-			PERL_INC=$$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$$(PERL_ARCHNAME)/CORE \
 			FIXIN=: \
 			$$($(2)_BUILD_OPTS) pure_all; \
 	fi
