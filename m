From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:02:22 +0200
Subject: [Buildroot] [git commit] kbd: bump to version 1.15.5
Message-ID: <20140618123419.E32E89D043@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37f0a3d5cf849a8bd68bf78d50636967e8adfc5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kbd/kbd.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
