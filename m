From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Dec 2010 14:04:28 -0300
Subject: [Buildroot] [PATCH 07/13] findutils: bump to version 4.4.2
In-Reply-To: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
References: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1292605474-19443-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/findutils/findutils.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index a1893ad..7ab6b0b 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -3,8 +3,10 @@
 # findutils
 #
 #############################################################
-FINDUTILS_VERSION:=4.2.31
-FINDUTILS_SOURCE:=findutils-$(FINDUTILS_VERSION).tar.gz
-FINDUTILS_SITE:=$(BR2_GNU_MIRROR)/findutils/
+
+FINDUTILS_VERSION = 4.4.2
+FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
+FINDUTILS_CONF_ENV = gl_cv_func_stdin=yes \
+			gl_cv_func_wcwidth_works=yes
 
 $(eval $(call AUTOTARGETS,package,findutils))
-- 
1.7.2.2
