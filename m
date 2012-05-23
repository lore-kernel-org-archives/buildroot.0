From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 May 2012 21:49:40 +0200
Subject: [Buildroot] [git commit] pkg-download.mk: Add missing argument when
	downloading from primary mirror (scp)
Message-ID: <20120523202633.2AD6496D8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ae7d814075095b43e25c8ef11be6a14234241cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This problem was already fixed by Markos Chandras for wget, but not for scp.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-download.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index b833de9..7d1e543 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -206,7 +206,7 @@ endef
 define DOWNLOAD_INNER
 	$(Q)if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
 		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
-			scp) $(call $(DL_MODE)_SCP,$(BR2_PRIMARY_SITE),$(2)) && exit ;; \
+			scp) $(call $(DL_MODE)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
 			*) $(call $(DL_MODE)_WGET,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
 		esac ; \
 	fi ; \
