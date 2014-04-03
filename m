From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:35:38 +0200
Subject: [Buildroot] [git commit] Revert "civetweb: fix build for xtensa"
Message-ID: <20140403193845.24DEF9A856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e90b33c7475e3f40cd3ff15472cfd2efdf1a0dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 37084ead509fa42db39637fcb837e7a99197c6c9.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/civetweb/civetweb.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index be7620a..4b73a5e 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -25,9 +25,6 @@ endif
 
 ifeq ($(BR2_CIVETWEB_WITH_LUA),y)
 	CIVETWEB_CONF_OPT += WITH_LUA=1
-ifeq ($(BR2_xtensa),y)
-	CIVETWEB_COPT += -mtext-section-literals
-endif
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
