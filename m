From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 16 May 2013 10:21:05 +0200
Subject: [Buildroot] [git commit] libosip2: disable multi-thread support for
	toolchains without threads
Message-ID: <20130516082742.9DFBD99A40@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f96a135667a65dea094fb9b4a8849892d4be9d4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also added license information

Fixes:
http://autobuild.buildroot.org/results/dcf/dcfbdc1a1ee032881ad5e2f7ca6622d90fc7cb19

[Peter: License is LGPLv2.1+
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libosip2/libosip2.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 713851b..182fa18 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -7,5 +7,10 @@
 LIBOSIP2_VERSION = 3.6.0
 LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
 LIBOSIP2_INSTALL_STAGING = YES
+LIBOSIP2_LICENSE = LGPLv2.1+
+LIBOSIP2_LICENSE_FILES = COPYING
+
+LIBOSIP2_CONF_OPT = \
+	--enable-mt=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,no)
 
 $(eval $(autotools-package))
