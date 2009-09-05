From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Sep 2009 15:24:12 +0200
Subject: [Buildroot] [git commit master] makefile: use qstrip
Message-ID: <20090905132510.DE69F77767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6cdf2481ee620843d56391a7a658c04b772d6c19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index fd272b5..f2e349f 100644
--- a/Makefile
+++ b/Makefile
@@ -373,8 +373,7 @@ endif
 
 ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST=$(PROJECT_BUILD_DIR)/locales.nopurge
-LOCALE_NOPURGE=$(strip $(subst ",,$(BR2_ENABLE_LOCALE_WHITELIST)))
-#"))
+LOCALE_NOPURGE=$(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
 
 target-purgelocales:
 	rm -f $(LOCALE_WHITELIST)
-- 
1.6.3.3
