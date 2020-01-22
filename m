From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 22 Jan 2020 22:00:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/libpam-tacplus: add openssl
 optional dependency
Message-ID: <20200122210046.844027-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openssl is an optional dependency since version 1.4.1 and
https://github.com/kravietz/pam_tacplus/commit/789cf4a85266dcb426ed133b2d07df86d0a55972

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpam-tacplus/libpam-tacplus.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
index f69d275cb6..fd2b4f9a30 100644
--- a/package/libpam-tacplus/libpam-tacplus.mk
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -8,7 +8,9 @@ LIBPAM_TACPLUS_VERSION = 1.5.1
 LIBPAM_TACPLUS_SITE = $(call github,jeroennijhof,pam_tacplus,v$(LIBPAM_TACPLUS_VERSION))
 LIBPAM_TACPLUS_LICENSE = GPL-2.0+
 LIBPAM_TACPLUS_LICENSE_FILES = COPYING
-LIBPAM_TACPLUS_DEPENDENCIES = linux-pam
+LIBPAM_TACPLUS_DEPENDENCIES = \
+	linux-pam \
+	$(if $(BR2_PACKAGE_OPENSSL),openssl)
 # Fetching from github, we need to generate the configure script
 LIBPAM_TACPLUS_AUTORECONF = YES
 LIBPAM_TACPLUS_INSTALL_STAGING = YES
-- 
2.24.1
