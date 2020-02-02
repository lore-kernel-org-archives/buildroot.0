From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Feb 2020 09:07:14 +0100
Subject: [Buildroot] [git commit] package/libpam-tacplus: add openssl
 optional dependency
Message-ID: <20200202075629.C5AE9881A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdc37c6a33c9a7c073f6d99900a90b24fbbcf9e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

openssl is an optional dependency since version 1.4.1 and
https://github.com/kravietz/pam_tacplus/commit/789cf4a85266dcb426ed133b2d07df86d0a55972

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
