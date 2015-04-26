From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 19:53:02 +0200
Subject: [Buildroot] [git commit] Makefile: implement a package based
	source-check target
Message-ID: <20150426202108.5197781734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9b928244a00106d01ee7ac5768072233fc6c5d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches the implementation of the global source-check
target to use a package infrastructure based mechanism, using the
$(1)-all-source-check target added in the previous commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

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
