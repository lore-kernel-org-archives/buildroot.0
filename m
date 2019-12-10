From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 22:59:50 +0100
Subject: [Buildroot] [PATCH 11/12] package/perl: add missing extract
 dependencies
In-Reply-To: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
References: <20191210215952.902477-1-thomas.petazzoni@bootlin.com>
Message-ID: <20191210215952.902477-12-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

perl uses suitable-extractor to manually extract a tarball, so it
should have the appropriate package dependencies added to
<pkg>_EXTRACT_DEPENDENCIES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl/perl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 0ab81ddb34..3b8b9fb0c4 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -27,6 +27,7 @@ define PERL_CROSS_EXTRACT
 	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
 	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
 endef
+PERL_EXTRACT_DEPENDENCIES += $(call extractor-pkg-dependency,$(PERL_CROSS_SOURCE))
 PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
 
 # Even though perl is not an autotools-package, it uses config.sub and
-- 
2.23.0
