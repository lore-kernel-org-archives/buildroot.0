From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Apr 2012 11:03:41 +0200
Subject: [Buildroot] [git commit] ngrep: removed redundant --enable-ipv6
Message-ID: <20120429090502.C24B496C08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11f6d7f82ef40f674386b1fcb2ae8d22f8a29956
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Option --enable-ipv6 now handled globally in autotargets configure.

Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ngrep/ngrep.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

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
