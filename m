From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 09:55:27 +0100
Subject: [Buildroot] [git commit] libftdi: fix typo in variable name
Message-ID: <20170207090318.D1E6B7FA5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d8cf78f7240560a9262d8c2b31fd9db158fd29f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed out during the check-package discussion, there is a typo in a
variable name:

http://lists.busybox.net/pipermail/buildroot/2016-December/180765.html

Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libftdi/libftdi.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index 2364c46..c1952ac 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -12,14 +12,14 @@ LIBFTDI_INSTALL_STAGING = YES
 LIBFTDI_CONFIG_SCRIPTS = libftdi-config
 LIBFTDI_AUTORECONF = YES
 
-LIBFDTI_CONF_OPTS = --without-examples
+LIBFTDI_CONF_OPTS = --without-examples
 
 # configure detect it automaticaly so we need to force it
 ifeq ($(BR2_PACKAGE_LIBTFDI_CPP),y)
 LIBFTDI_DEPENDENCIES += boost
-LIBFDTI_CONF_OPTS += --enable-libftdipp
+LIBFTDI_CONF_OPTS += --enable-libftdipp
 else
-LIBFDTI_CONF_OPTS += --disable-libftdipp
+LIBFTDI_CONF_OPTS += --disable-libftdipp
 endif
 
 $(eval $(autotools-package))
