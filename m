From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 May 2012 23:55:42 +0200
Subject: [Buildroot] [git commit] pkg-download.mk: Add missing argument when
	downloading from primary mirror
Message-ID: <20120505221418.8F21696BD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b93a8ceadf13a98cb4ac5dada52dcd92307edf6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-download.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ccf819e..b833de9 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -207,7 +207,7 @@ define DOWNLOAD_INNER
 	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
 		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
 			scp) $(call $(DL_MODE)_SCP,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
-			*) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
+			*) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
 	if test -n "$(1)" ; then \
