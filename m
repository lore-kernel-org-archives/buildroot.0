From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Jun 2013 15:57:03 -0300
Subject: [Buildroot] [PATCH 3/3] jquery-keyboard: bump to version 1.17.7
In-Reply-To: <1371063424-28818-1-git-send-email-gustavo@zacarias.com.ar>
References: <1371063424-28818-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1371063424-28818-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And select/install jquery-ui since it's almost mandatory.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jquery-keyboard/Config.in          | 1 +
 package/jquery-keyboard/jquery-keyboard.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jquery-keyboard/Config.in b/package/jquery-keyboard/Config.in
index ee97662..e44193e 100644
--- a/package/jquery-keyboard/Config.in
+++ b/package/jquery-keyboard/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_JQUERY_KEYBOARD
 	bool "jQuery keyboard"
 	select BR2_PACKAGE_JQUERY
+	select BR2_PACKAGE_JQUERY_UI
 	help
 	  Virtual Keyboard using jQuery UI
 
diff --git a/package/jquery-keyboard/jquery-keyboard.mk b/package/jquery-keyboard/jquery-keyboard.mk
index 769fdba..0d9b69b 100644
--- a/package/jquery-keyboard/jquery-keyboard.mk
+++ b/package/jquery-keyboard/jquery-keyboard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JQUERY_KEYBOARD_VERSION = 1.17.4
+JQUERY_KEYBOARD_VERSION = 1.17.7
 JQUERY_KEYBOARD_SITE = \
 	http://github.com/Mottie/Keyboard/tarball/v$(JQUERY_KEYBOARD_VERSION)
 JQUERY_KEYBOARD_LICENSE = MIT WTFPL
-- 
1.8.1.5
