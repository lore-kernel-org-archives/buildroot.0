From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Nov 2013 09:07:41 +0100
Subject: [Buildroot] [git commit] libvncserver: fix build without pthread
Message-ID: <20131113080840.A9E069BC85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6ee44b6d497f412b5b6c6223462a8a687c82af7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/761/7618028d0781269d2f6f0a14d814da456f207475/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvncserver/libvncserver.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index fe48838..a96b8c5 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -15,6 +15,10 @@ LIBVNCSERVER_CONFIG_SCRIPTS = libvncserver-config
 # only used for examples
 LIBVNCSERVER_CONF_OPT += --with-sdl-config=/bin/false
 
+ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBVNCSERVER_CONF_OPT += --without-pthread
+endif
+
 ifneq ($(BR2_INET_IPV6),y)
 LIBVNCSERVER_CONF_OPT += --without-ipv6
 endif
