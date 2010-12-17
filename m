From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Dec 2010 14:04:34 -0300
Subject: [Buildroot] [PATCH 13/13] ed: bump to version 1.5
In-Reply-To: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
References: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1292605474-19443-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Bump to version 1.5

* Really configure right (or wrong depending on perspective) since we
  weren't building ed for the target it was completely broken.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ed/ed.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index 158667b..e7016bf 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -3,8 +3,10 @@
 # ed
 #
 #############################################################
-ED_VERSION:=1.1
-ED_SOURCE:=ed-$(ED_VERSION).tar.bz2
-ED_SITE:=$(BR2_GNU_MIRROR)/ed/
+
+ED_VERSION = 1.5
+ED_SITE = $(BR2_GNU_MIRROR)/ed
+ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)"
 
 $(eval $(call AUTOTARGETS,package,ed))
-- 
1.7.2.2
