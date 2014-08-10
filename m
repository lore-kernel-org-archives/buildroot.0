From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 10 Aug 2014 20:17:25 +0200
Subject: [Buildroot] [PATCH] perl: fix warnings at runtime
Message-ID: <1407694645-26356-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

autosplit.ix files are used by AutoLoader.pm

    Can't locate auto/Net/SSLeay/autosplit.ix in @INC (@INC contains: /usr/lib/perl5/site_perl/5.18.2/arm-linux /usr/lib/perl5/site_perl/5.18.2 /usr/lib/perl5/5.18.2/arm-linux /usr/lib/perl5/5.18.2 .) at /usr/lib/perl5/5.18.2/AutoLoader.pm line 181.
     at /usr/lib/perl5/site_perl/5.18.2/arm-linux/Net/SSLeay.pm line 24.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index e01570e..01e0166 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -129,7 +129,6 @@ define PERL_FINALIZE_TARGET
 	find $(TARGET_DIR)/usr/lib/perl5/ -name 'extralibs.ld' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib/perl5/ -name '*.bs' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib/perl5/ -name '.packlist' -print0 | xargs -0 rm -f
-	find $(TARGET_DIR)/usr/lib/perl5/ -name 'autosplit.ix' -print0 | xargs -0 rm -f
 endef
 
 TARGET_FINALIZE_HOOKS += PERL_FINALIZE_TARGET
-- 
1.9.1
