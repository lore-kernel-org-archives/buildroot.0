From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 22:09:42 +0100
Subject: [Buildroot] [git commit] vlc: enable altivec support only when
	appropriate
Message-ID: <20140208212129.ED7359C8B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c2534c50cbd82bcb18dca4f22835a7b461d4083
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All PowerPC CPUs do not support altivec instruction set; so enable its
support only when the sub-architecture support it.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index b184de3..2730f07 100644
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
