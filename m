From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Tue, 14 Jun 2016 17:31:10 +0200
Subject: [Buildroot] [PATCH 02/12] reproducibility: override locale and
	timezone
In-Reply-To: <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1465918277-30675-2-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
---
 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index 3f5c3d3..0217ff0 100644
--- a/Makefile
+++ b/Makefile
@@ -208,6 +208,13 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
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
2.8.2
