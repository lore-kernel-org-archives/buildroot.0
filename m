From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:39 +0200
Subject: [Buildroot] [RFC v4 05/16] pkg-perl: use TARGET_MAKE_ENV to add pps
	support
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-6-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In the TARGET_MAKE_ENV variable will be added the GCC_SYSROOT variable
that is needed for per-package staging feature.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/pkg-perl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 6577588..d879771 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -130,7 +130,7 @@ define $(2)_BUILD_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
 		$$(PERL_RUN) Build $$($(2)_BUILD_OPTS) build; \
 	else \
-		$$(MAKE1) \
+		$$(TARGET_MAKE_ENV) $$(MAKE1) \
 			PERL_INC=$$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$$(PERL_ARCHNAME)/CORE \
 			$$($(2)_BUILD_OPTS) pure_all; \
 	fi
-- 
2.4.3
