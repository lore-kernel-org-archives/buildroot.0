From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:35:41 +0200
Subject: [Buildroot] [git commit] samba4: use the new gettext logic
Message-ID: <20170704233519.276357FB43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5add8f45dc8a6fa0ffb7161d31cbb9b8be04d94e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit switches to use the new gettext logic, which involves
using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
on gettext/host-gettext.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba4/samba4.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 93c45da..86546e9 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -15,7 +15,8 @@ SAMBA4_DEPENDENCIES = \
 	e2fsprogs popt python zlib \
 	$(if $(BR2_PACKAGE_LIBAIO),libaio) \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
-	$(if $(BR2_PACKAGE_READLINE),readline)
+	$(if $(BR2_PACKAGE_READLINE),readline) \
+	$(TARGET_NLS_DEPENDENCIES)
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 SAMBA4_CONF_OPTS += --with-acl-support
@@ -46,12 +47,6 @@ else
 SAMBA4_CONF_OPTS += --without-fam
 endif
 
-ifeq ($(BR2_PACKAGE_GETTEXT),y)
-SAMBA4_DEPENDENCIES += gettext
-else
-SAMBA4_CONF_OPTS += --without-gettext
-endif
-
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 SAMBA4_CONF_OPTS += --enable-gnutls
 SAMBA4_DEPENDENCIES += gnutls
