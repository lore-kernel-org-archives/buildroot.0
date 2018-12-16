From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:28:40 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/libgpgme:
 properly tweak gpgme-config
Message-ID: <20181216212438.99CE88B5D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=938f823fd1febde3bcba5f9e97638cacafdc93f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

libgpgme installs a gpgme-config script, it should be tweaked using
the <pkg>_CONFIG_SCRIPTS mechanism. This is generally useful and is
going to be particularly important with per-package directories.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3df53aa11dce9f80a2f97709c3a7056af4d13439)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgpgme/libgpgme.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 5c46c7c561..bc3c1ce45c 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -12,6 +12,7 @@ LIBGPGME_LICENSE_FILES = COPYING.LESSER
 LIBGPGME_INSTALL_STAGING = YES
 LIBGPGME_DEPENDENCIES = libassuan libgpg-error
 LIBGPGME_LANGUAGE_BINDINGS = cl
+LIBGPGME_CONFIG_SCRIPTS = gpgme-config
 
 LIBGPGME_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr \
