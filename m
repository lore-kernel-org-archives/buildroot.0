From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 16:42:52 +0200
Subject: [Buildroot] [PATCHv3 08/18] Makefile: implement a package based
	source-check target
In-Reply-To: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1429972982-25495-9-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches the implementation of the global source-check
target to use a package infrastructure based mechanism, using the
$(1)-all-source-check target added in the previous commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index a442325..f5ff574 100644
--- a/Makefile
+++ b/Makefile
@@ -619,8 +619,7 @@ external-deps:
 	@$(MAKE1) -Bs $(EXTRAMAKEARGS) _external-deps | sort -u
 
 # check if download URLs are outdated
-source-check:
-	$(MAKE1) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
+source-check: $(foreach p,$(PACKAGES),$(p)-all-source-check)
 
 legal-info-clean:
 	@rm -fr $(LEGAL_INFO_DIR)
-- 
2.1.0
