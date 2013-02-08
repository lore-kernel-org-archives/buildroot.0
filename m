From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 8 Feb 2013 22:41:40 +0100
Subject: [Buildroot] [git commit] libgpg-error: use <pkg>_CONFIG_SCRIPTS
Message-ID: <20130208214322.EEB2596DC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ff6989445eac9ce59a5041c656bcb0319dce0eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libgpg-error installs a gpg-error-config script, but it wasn't fixed
up properly. Use the <pkg>_CONFIG_SCRIPTS to handle this.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libgpg-error/libgpg-error.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 288165b..4114310 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -9,5 +9,6 @@ LIBGPG_ERROR_SITE = ftp://ftp.gnupg.org/gcrypt/libgpg-error
 LIBGPG_ERROR_LICENSE = LGPLv2.1+
 LIBGPG_ERROR_LICENSE_FILES = COPYING.LIB
 LIBGPG_ERROR_INSTALL_STAGING = YES
+LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 
 $(eval $(autotools-package))
