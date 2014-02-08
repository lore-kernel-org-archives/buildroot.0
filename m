From: Samuel Martin <s.martin49@gmail.com>
Date: Sat,  8 Feb 2014 15:34:55 +0100
Subject: [Buildroot] [PATCH v1 6/6] vlc: enable altivec support only when
	appropriate
In-Reply-To: <1391870095-3738-1-git-send-email-s.martin49@gmail.com>
References: <1391870095-3738-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1391870095-3738-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All PowerPC CPUs do not support altivec instruction set; so enable its
support only when the sub-architecture support it.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/vlc/vlc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 871373e..a0c8513 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -32,6 +32,13 @@ VLC_CONF_OPT += \
 	--disable-vsxu \
 	--disable-mtp
 
+# Set powerpc altivec appropriately
+ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+VCL_CONF_OPT += --enable-altivec
+else
+VLC_CONF_OPT += --disable-altivec
+endif
+
 ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 VLC_CONF_OPT += --enable-alsa
 VLC_DEPENDENCIES += alsa-lib
-- 
1.8.5.4
