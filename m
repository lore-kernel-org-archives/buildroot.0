From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 17:06:52 +0200
Subject: [Buildroot] [git commit] transmission: add license information
Message-ID: <20140626151144.624E59D018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=576cdb78e915e4cae40bd1e2de87c350f641d043
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: also mention openssl exception]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/transmission.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 37cc58b..07a76ab 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -15,10 +15,11 @@ TRANSMISSION_DEPENDENCIES = \
 	openssl \
 	zlib
 TRANSMISSION_AUTORECONF = YES
-
 TRANSMISSION_CONF_OPT = \
 	--disable-libnotify \
 	--enable-lightweight
+TRANSMISSION_LICENSE = GPLv2 or GPLv3 with OpenSSL exception
+TRANSMISSION_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_UTP),y)
 	TRANSMISSION_CONF_OPT += --enable-utp
