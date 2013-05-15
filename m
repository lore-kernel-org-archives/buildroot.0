From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 15 May 2013 14:47:31 -0700
Subject: [Buildroot] [PATCH 1/2] libosip2: disable multi-thread support for
	toolchains without threads
Message-ID: <1368654452-16294-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also added license information

Fixes:
http://autobuild.buildroot.org/results/dcf/dcfbdc1a1ee032881ad5e2f7ca6622d90fc7cb19

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/libosip2/libosip2.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 713851b..1f4a370 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -7,5 +7,10 @@
 LIBOSIP2_VERSION = 3.6.0
 LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
 LIBOSIP2_INSTALL_STAGING = YES
+LIBOSIP2_LICENSE = LGPL
+LIBOSIP2_LICENSE_FILES = COPYING
+
+LIBOSIP2_CONF_OPT = \
+	--enable-mt=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,no)
 
 $(eval $(autotools-package))
-- 
1.7.4.1
