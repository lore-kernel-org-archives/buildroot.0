From: Rick Taylor <tropicalstormuk@gmail.com>
Date: Fri, 18 Jul 2014 09:42:41 +0100
Subject: [Buildroot] [PATCH 1/3] Add $$(PKG)_AUTORECONF_ENV argument to
	autotools package autoreconf command to allow environment
	variables to be used.
Message-ID: <1405672963-16069-1-git-send-email-rick.taylor@cassidian.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rick Taylor <rick.taylor@cassidian.com>
---
 package/pkg-autotools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 557413d..255c42d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -228,7 +228,7 @@ endef
 #
 define AUTORECONF_HOOK
 	@$$(call MESSAGE,"Autoreconfiguring")
-	$$(Q)cd $$($$(PKG)_SRCDIR) && $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
+	$$(Q)cd $$($$(PKG)_SRCDIR) && $$($$(PKG)_AUTORECONF_ENV) $$(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
 	$$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
 		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
 			ltmain_version=`sed -n '/^[ 	]*VERSION=/{s/^[ 	]*VERSION=//;p;q;}' $$$$i | \
-- 
1.9.1
