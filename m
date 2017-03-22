From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 23:10:03 +0100
Subject: [Buildroot] [git commit] janus-gateway: bump to v0.2.2
Message-ID: <20170322221051.B140682245@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f87bffabc85169ef96a23523a10854573e44d6a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In addition, a new option sample-event-handler has been added. It has
been disabled by default in the .mk file, as it requires
libcurl. Support for it can be added later.

While at it, remove a trailing space.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/janus-gateway/janus-gateway.hash | 2 +-
 package/janus-gateway/janus-gateway.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/janus-gateway/janus-gateway.hash b/package/janus-gateway/janus-gateway.hash
index 68b9c31..546aff9 100644
--- a/package/janus-gateway/janus-gateway.hash
+++ b/package/janus-gateway/janus-gateway.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 5d071592faca2a1574b996b4ca07b6c9e02cd42a719b0dbb4bfb5dfde8d55ff3 janus-gateway-v0.2.1.tar.gz
+sha256 f5b1909fd9b8546f8be518f7c682b80916a8204c95f23a95c720524df62cca34 janus-gateway-v0.2.2.tar.gz
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 212fa47..f58db81 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-JANUS_GATEWAY_VERSION = v0.2.1
+JANUS_GATEWAY_VERSION = v0.2.2
 JANUS_GATEWAY_SITE = $(call github,meetecho,janus-gateway,$(JANUS_GATEWAY_VERSION))
 JANUS_GATEWAY_LICENSE = GPLv3
 JANUS_GATEWAY_LICENSE_FILES = COPYING
 
 # ding-libs provides the ini_config library
 JANUS_GATEWAY_DEPENDENCIES = host-pkgconf jansson libnice \
-	libsrtp host-gengetopt libglib2 openssl 
+	libsrtp host-gengetopt libglib2 openssl
 
 # Straight out of the repository, no ./configure, and we also patch
 # configure.ac.
@@ -24,7 +24,8 @@ JANUS_GATEWAY_POST_PATCH_HOOKS += JANUS_GATEWAY_M4
 
 JANUS_GATEWAY_CONF_OPTS = \
 	--disable-data-channels \
-	--disable-rabbitmq
+	--disable-rabbitmq \
+	--disable-sample-event-handler
 
 ifeq ($(BR2_PACKAGE_JANUS_AUDIO_BRIDGE),y)
 JANUS_GATEWAY_DEPENDENCIES += opus
