From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:37:57 +0200
Subject: [Buildroot] [PATCHv2 13/21] Makefile: implement a package based
	source-check target
In-Reply-To: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1428856685-4403-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches the implementation of the global source-check
target to use a package infrastructure based mechanism, using the
$(1)-all-source-check target added in the previous commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 6937dd3..7d94ee8 100644
--- a/Makefile
+++ b/Makefile
@@ -617,8 +617,7 @@ external-deps:
 	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
 
 # check if download URLs are outdated
-source-check:
-	$(MAKE1) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
+source-check: $(foreach p,$(PACKAGES),$(p)-all-source-check)
 
 legal-info-clean:
 	@rm -fr $(LEGAL_INFO_DIR)
-- 
2.1.0
