From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 28 Nov 2012 17:09:21 +0100
Subject: [Buildroot] [PATCHv3 for-next 5/6] cpanminus: requires host-qemu
In-Reply-To: <1354118962-18601-1-git-send-email-arnout@mind.be>
References: <1354118962-18601-1-git-send-email-arnout@mind.be>
Message-ID: <1354118962-18601-5-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

It's still broken, but is someone wants to try it out then at least
the dependency is there.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v3: Don't bother adding dependencies to Config.in
---
 package/cpanminus/cpanminus.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
index d3a338b..af35e93 100644
--- a/package/cpanminus/cpanminus.mk
+++ b/package/cpanminus/cpanminus.mk
@@ -7,7 +7,7 @@
 CPANMINUS_VERSION = 1.5018
 CPANMINUS_SOURCE = miyagawa-cpanminus-$(CPANMINUS_VERSION)-0-gee6cd30.tar.gz
 CPANMINUS_SITE = https://github.com/miyagawa/cpanminus/tarball/$(CPANMINUS_VERSION)
-CPANMINUS_DEPENDENCIES = perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES))
+CPANMINUS_DEPENDENCIES = host-qemu perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES))
 
 CPANMINUS_RUN_PERL = $(QEMU_USER) $(STAGING_DIR)/usr/bin/perl
 CPANMINUS_ARCHNAME = $(shell $(CPANMINUS_RUN_PERL) -MConfig -e "print Config->{archname}")
-- 
1.7.10.4
