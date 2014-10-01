From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 22:45:21 +0200
Subject: [Buildroot] [git commit] package/gnupg2: add bzip2 optional
	dependency
Message-ID: <20141001204538.89B309D7C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b39e3e39eb15264efafec3cb7c4ac89a951b9ab9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is to improve build reproducibility.

[Thomas: add --enable-bzip2 --with-bzip options.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnupg2/gnupg2.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 33b5bc0..b0e7297 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -26,4 +26,11 @@ endef
 GNUPG2_POST_INSTALL_TARGET_HOOKS += GNUPG2_REMOVE_GPGV2
 endif
 
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+GNUPG2_CONF_OPT += --enable-bzip2 --with-bzip2=$(STAGING_DIR)
+GNUPG2_DEPENDENCIES += bzip2
+else
+GNUPG2_CONF_OPT += --disable-bzip2
+endif
+
 $(eval $(autotools-package))
