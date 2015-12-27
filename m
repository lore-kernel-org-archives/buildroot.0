From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 14:29:24 +0100
Subject: [Buildroot] [git commit] stunnel: use BR2_TOOLCHAIN_HAS_SSP instead
	of BR2_ENABLE_SSP
Message-ID: <20151227133840.11CFF822CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0923816c64f2912226164d171e0ae92d39fb979e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All packages use BR2_TOOLCHAIN_HAS_SSP to determine whether they can
use SSP suppport or not, except stunnel. Therefore, this commit makes
stunnel consistent with other packages. This is also necessary in
preparation to the removal of BR2_ENABLE_SSP in favor of a choice
between various SSP options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/stunnel/stunnel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index ae187a6..bfa7d3f 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -11,7 +11,7 @@ STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPTS = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork \
 	--disable-libwrap
 STUNNEL_CONF_ENV = \
-	ax_cv_check_cflags___fstack_protector=$(if $(BR2_ENABLE_SSP),yes,no)
+	ax_cv_check_cflags___fstack_protector=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 STUNNEL_LICENSE = GPLv2+
 STUNNEL_LICENSE_FILES = COPYING COPYRIGHT.GPL
 
