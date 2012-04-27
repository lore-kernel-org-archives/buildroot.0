From: Vanya Sergeev <vsergeev@gmail.com>
Date: Fri, 27 Apr 2012 16:13:45 -0400
Subject: [Buildroot] [PATCH] ngrep: removed redundant --enable-ipv6
Message-ID: <1335557625-19895-1-git-send-email-vsergeev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Option --enable-ipv6 now handled globally in autotargets configure.

Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
---
 package/ngrep/ngrep.mk |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index e9c640a..daf7c6f 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -15,10 +15,6 @@ NGREP_CONF_OPT =  \
 	--with-pcre=$(STAGING_DIR)/usr \
 	--disable-dropprivs
 
-ifeq ($(BR2_INET_IPV6),y)
-NGREP_CONF_OPT += --enable-ipv6
-endif
-
 NGREP_DEPENDENCIES = libpcap pcre
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.10
