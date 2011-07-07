From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Jul 2011 10:57:01 +0200
Subject: [Buildroot] [git commit] Makefile.package.in: extract: only ensure
	r/w access for user
Message-ID: <20110707090855.880338A3A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2f2542595f69734d61d208bfbf1094901be5432f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There's no reason to make the source files writable for everyone.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 4bd40ba..6b63bae 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -246,7 +246,7 @@ $(BUILD_DIR)/%/.stamp_extracted:
 	$(Q)$(if $($(PKG)_SOURCE),$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
 	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -)
 # some packages have messed up permissions inside
-	$(Q)chmod -R ug+rw $(@D)
+	$(Q)chmod -R +rw $(@D)
 	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
-- 
1.7.3.4
