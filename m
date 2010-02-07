From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun,  7 Feb 2010 19:07:47 +0100
Subject: [Buildroot] [PATCH 05/14] directfb: added support for lirc
In-Reply-To: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1265566076-10628-6-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/directfb/Config.in   |    5 +++++
 package/directfb/directfb.mk |    4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index 7c41cdf..6c78597 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -65,6 +65,11 @@ config BR2_PACKAGE_DIRECTFB_KEYBOARD
 	bool "compile keyboard input driver"
 	default y
 
+config BR2_PACKAGE_DIRECTFB_LIRC
+	bool "compile lirc input driver"
+	select BR2_PACKAGE_LIRC
+	default n
+
 config BR2_PACKAGE_DIRECTFB_PS2MOUSE
 	bool "compile PS2 mouse input driver"
 	default y
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 2f095ee..a065a22 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -80,6 +80,10 @@ endif
 ifeq ($(BR2_PACKAGE_DIRECTFB_KEYBOARD),y)
 DIRECTFB_INPUT+= keyboard
 endif
+ifeq ($(BR2_PACKAGE_DIRECTFB_KEYBOARD),y)
+DIRECTFB_INPUT+= lirc
+DIRECTFB_DEP+= lirc
+endif
 ifeq ($(BR2_PACKAGE_DIRECTFB_PS2MOUSE),y)
 DIRECTFB_INPUT+= ps2mouse
 endif
-- 
1.6.6
