From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:48:58 +0200
Subject: [Buildroot] [PATCH 02/34] reproducibility: override locale and
	timezone
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-2-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index ec7dccb..86b2ed2 100644
--- a/Makefile
+++ b/Makefile
@@ -218,6 +218,13 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(BR2_CONFIG)
 endif
 
+export BR2_REPRODUCIBLE
+ifeq ($(BR2_REPRODUCIBLE),y)
+export TZ=UTC
+export LANG=C
+export LC_ALL=C
+endif
+
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
 ifeq ("$(origin V)", "command line")
-- 
2.7.4
