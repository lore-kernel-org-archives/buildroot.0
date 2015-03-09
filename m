From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  9 Mar 2015 23:14:52 +0100
Subject: [Buildroot] [PATCH 3/3] Download: remove trailing slash cleanups
	for SITE URLs
In-Reply-To: <1425939292-14719-1-git-send-email-luca@lucaceresoli.net>
References: <1425939292-14719-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1425939292-14719-4-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not needed anymore since the URLs have been cleared.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/perl/perl.mk   | 2 +-
 package/pkg-generic.mk | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 133e8aa..b9a3a57 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -26,7 +26,7 @@ PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
 # together with perl
 
 define PERL_CROSS_DOWNLOAD
-	$(call DOWNLOAD,$(PERL_CROSS_SITE:/=)/$(PERL_CROSS_SOURCE))
+	$(call DOWNLOAD,$(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE))
 endef
 PERL_POST_DOWNLOAD_HOOKS += PERL_CROSS_DOWNLOAD
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c1b379b..9818141 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -84,12 +84,12 @@ ifeq ($(DL_MODE),DOWNLOAD)
 		done ; \
 	fi
 endif
-	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
-	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
+	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_SOURCE)))
+	$(foreach p,$($(PKG)_EXTRA_DOWNLOADS),$(call DOWNLOAD,$($(PKG)_SITE)/$(p))$(sep))
 	$(foreach p,$($(PKG)_PATCH),\
 		$(if $(findstring ://,$(p)),\
 			$(call DOWNLOAD,$(p)),\
-			$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))\
+			$(call DOWNLOAD,$($(PKG)_SITE)/$(p))\
 		)\
 	$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
-- 
1.9.1
