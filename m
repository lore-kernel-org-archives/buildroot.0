From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 17 Jul 2014 09:56:16 -0300
Subject: [Buildroot] [PATCH] pkg-autotools: fix bad GETTEXTIZE_OPT assignment
Message-ID: <1405601776-20042-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HOST_PKG_GETTEXTIZE_OPT should get assigned PKG_GETTEXTIZE_OPT and not
PKG_GETTEXTIZE. Fixes:
http://autobuild.buildroot.net/results/087/087e860173069f58fa9ceb2460d7455d31b2dff8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pkg-autotools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 50876cb..557413d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -97,7 +97,7 @@ endif
 
 ifndef $(2)_GETTEXTIZE_OPT
  ifdef $(3)_GETTEXTIZE_OPT
-  $(2)_GETTEXTIZE_OPT = $$($(3)_GETTEXTIZE)
+  $(2)_GETTEXTIZE_OPT = $$($(3)_GETTEXTIZE_OPT)
  else
   $(2)_GETTEXTIZE_OPT ?= -f
  endif
-- 
1.8.5.5
