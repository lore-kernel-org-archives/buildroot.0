From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 21:02:53 +0100
Subject: [Buildroot] [git commit] package/libpam-tacplus: remove duplicate
 LIBPAM_TACPLUS_AUTORECONF
Message-ID: <20201116195300.68E918216C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3b7753fb49a5bd4a412611c3f82efa71c58af435
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit [1] added a second LIBPAM_TACPLUS_AUTORECONF
because we are now patching configure.ac.
But LIBPAM_TACPLUS_AUTORECONF was already used because the
package is fetched from github.

[1] bd85d82f61af0578a64e74e1cfb56c3c1bf46fe1

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/849509860

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpam-tacplus/libpam-tacplus.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libpam-tacplus/libpam-tacplus.mk b/package/libpam-tacplus/libpam-tacplus.mk
index 9dd8466bf2..b9630d8b37 100644
--- a/package/libpam-tacplus/libpam-tacplus.mk
+++ b/package/libpam-tacplus/libpam-tacplus.mk
@@ -12,10 +12,9 @@ LIBPAM_TACPLUS_DEPENDENCIES = \
 	linux-pam \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl)
 # Fetching from github, we need to generate the configure script
+# 0001-Add-an-option-to-disable-Werror.patch
 LIBPAM_TACPLUS_AUTORECONF = YES
 LIBPAM_TACPLUS_INSTALL_STAGING = YES
-# We're patching configure.ac
-LIBPAM_TACPLUS_AUTORECONF = YES
 LIBPAM_TACPLUS_CONF_ENV = \
 	ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 LIBPAM_TACPLUS_CONF_OPTS = --disable-werror
