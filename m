From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Feb 2017 21:21:31 +0100
Subject: [Buildroot] [PATCH] package/hiredis: fix makefile code
Message-ID: <1487103691-29199-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiredis/hiredis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index eb96711..cd406f1 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -19,7 +19,7 @@ ifeq ($(BR2_STATIC_LIBS),y)
 HIREDIS_TARGETS += static
 else ifeq ($(BR2_SHARED_LIBS),y)
 HIREDIS_TARGETS += dynamic
-else ifeq $(BR2_SHARED_STATIC_LIBS),y)
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 HIREDIS_TARGETS += dynamic static
 endif
 
-- 
2.7.4
