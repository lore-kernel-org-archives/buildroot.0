From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Sep 2013 13:52:51 -0300
Subject: [Buildroot] [PATCH 2/6] libcdaudio: disable autoreconf
In-Reply-To: <1379350375-18843-1-git-send-email-gustavo@zacarias.com.ar>
References: <1379350375-18843-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1379350375-18843-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's no stated purpose and it breaks with automake 1.12+
If it breaks in some scenario ping me, i've got a patch to fix the
autoreconf issue and re-enable it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcdaudio/libcdaudio.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libcdaudio/libcdaudio.mk b/package/libcdaudio/libcdaudio.mk
index 151bb8c..06f8926 100644
--- a/package/libcdaudio/libcdaudio.mk
+++ b/package/libcdaudio/libcdaudio.mk
@@ -5,10 +5,7 @@
 ################################################################################
 
 LIBCDAUDIO_VERSION = 0.99.12p2
-LIBCDAUDIO_SOURCE = libcdaudio-$(LIBCDAUDIO_VERSION).tar.gz
 LIBCDAUDIO_SITE = http://downloads.sourceforge.net/project/libcdaudio/libcdaudio/$(LIBCDAUDIO_VERSION)/
-LIBCDAUDIO_AUTORECONF = YES
-LIBCDAUDIO_LIBTOOL_PATCH = YES
 LIBCDAUDIO_INSTALL_STAGING = YES
 LIBCDAUDIO_CONFIG_SCRIPTS = libcdaudio-config
 
-- 
1.8.1.5
