From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:36 +0200
Subject: [Buildroot] [PATCH 67/69] perl: remove empty host dependencies
	definition
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-68-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/perl/perl.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 11b10ff5e480..d66e4487c1f7 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -90,10 +90,6 @@ define PERL_INSTALL_TARGET_CMDS
 	$(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl
 endef
 
-# We never want to have host-berkeleydb or host-gdbm as dependencies
-# of host-perl.
-HOST_PERL_DEPENDENCIES =
-
 HOST_PERL_CONF_OPTS = \
 	-des \
 	-Dprefix="$(HOST_DIR)/usr" \
-- 
2.1.0
