From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Aug 2014 23:01:38 +0200
Subject: [Buildroot] [git commit] perl: fix warnings at runtime
Message-ID: <20140811213123.9FFBA9D3F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d70f19ee93e573ccfec08cb594d9c44aab7b6fa2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

autosplit.ix files are used by AutoLoader.pm

    Can't locate auto/Net/SSLeay/autosplit.ix in @INC (@INC contains: /usr/lib/perl5/site_perl/5.18.2/arm-linux /usr/lib/perl5/site_perl/5.18.2 /usr/lib/perl5/5.18.2/arm-linux /usr/lib/perl5/5.18.2 .) at /usr/lib/perl5/5.18.2/AutoLoader.pm line 181.
     at /usr/lib/perl5/site_perl/5.18.2/arm-linux/Net/SSLeay.pm line 24.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

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
