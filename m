From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 30 Mar 2014 21:57:47 +0400
Subject: [Buildroot] [PATCH v3 03/10] Revert "civetweb: fix build for xtensa"
In-Reply-To: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
References: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1396202274-5109-4-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 37084ead509fa42db39637fcb837e7a99197c6c9.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v2 -> v3:
- new patch

 package/civetweb/civetweb.mk | 3 ---
 1 file changed, 3 deletions(-)

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
-- 
1.8.1.4
