From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Sep 2009 15:14:44 +0200
Subject: [Buildroot] [PATCH 2/7] makefile: use qstrip
In-Reply-To: <cover.1252156486.git.thomas.petazzoni@free-electrons.com>
References: <cover.1252156486.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6cdf2481ee620843d56391a7a658c04b772d6c19.1252156486.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.6.0.4
