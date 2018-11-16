From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Nov 2018 23:12:41 +0100
Subject: [Buildroot] [git commit] package/libassuan: fixup libassuan-config
Message-ID: <20181116221008.7F0BC837FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a9fa7e5e7bfa355b1aadc53d67dd356f54efb33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libassuan library installs libassuan-config, but it is not
currently fixed up by our <pkg>_CONFIG_SCRIPTS logic. While this
doesn't cause any problem today, it fails badly with per-package
folders, so let's use <pkg>_CONFIG_SCRIPTS.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libassuan/libassuan.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index e807086b73..4dc8f70d1f 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -13,5 +13,6 @@ LIBASSUAN_INSTALL_STAGING = YES
 LIBASSUAN_DEPENDENCIES = libgpg-error
 LIBASSUAN_CONF_OPTS = \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
+LIBASSUAN_CONFIG_SCRIPTS = libassuan-config
 
 $(eval $(autotools-package))
