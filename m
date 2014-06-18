From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jun 2014 22:11:13 -0300
Subject: [Buildroot] [PATCH 4/4] kbd: bump to version 1.15.5
In-Reply-To: <1403053873-21190-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403053873-21190-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403053873-21190-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/kbd/kbd.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index ea14b8c..0655613 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-KBD_VERSION = 1.15.2
+KBD_VERSION = 1.15.5
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
+KBD_CONF_OPT = --disable-vlock
+KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 KBD_LICENSE = GPLv2+
 KBD_LICENSE_FILES = COPYING
 
-KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-
 $(eval $(autotools-package))
-- 
1.8.5.5
