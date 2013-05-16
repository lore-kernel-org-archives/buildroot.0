From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 16 May 2013 10:21:25 +0200
Subject: [Buildroot] [git commit] libeXosip2: disable multi-thread support
	for toolchains without threads
Message-ID: <20130516082742.EFA1B99A40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb1ba5dff1748226c13cb92320f5171c026a47ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also added license information

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libeXosip2/libeXosip2.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index d72ab61..7fef1a6 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -7,6 +7,8 @@
 LIBEXOSIP2_VERSION = 3.6.0
 LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip/
 LIBEXOSIP2_INSTALL_STAGING = YES
+LIBEXOSIP2_LICENSE = GPLv2+
+LIBEXOSIP2_LICENSE_FILES = COPYING
 
 LIBEXOSIP2_DEPENDENCIES = host-pkgconf libosip2
 
@@ -17,4 +19,7 @@ else
 LIBEXOSIP2_CONF_OPT += --disable-openssl
 endif
 
+LIBEXOSIP2_CONF_OPT += \
+	--enable-mt=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,no)
+
 $(eval $(autotools-package))
