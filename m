From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 Jan 2010 22:55:42 +0100
Subject: [Buildroot] [git commit master] package: fix unstripped binary
	installation
Message-ID: <20100128220035.EE72A77751@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=96879ab1def240c7d3868690047c37915cc26679
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index e643577..bc0ac7c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -163,7 +163,7 @@ TARGET_STRIP=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-sstrip
 STRIPCMD=$(TARGET_STRIP)
 endif
 ifeq ($(BR2_STRIP_none),y)
-TARGET_STRIP=true Not_stripping
+TARGET_STRIP=true
 STRIPCMD=$(TARGET_STRIP)
 endif
 INSTALL:=$(shell which install || type -p install)
-- 
1.6.3.3
