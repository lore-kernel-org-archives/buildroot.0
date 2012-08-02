From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:52:50 -0000
Subject: [Buildroot] [git commit branch/next] libxslt: use libgcrypt-config
	from STAGING_DIR
Message-ID: <20120802195249.0723C8E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e388ac59039a9f5892b1afc7333a827d18ad0f68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Otherwise, if the host has a libgcrypt-config, that one will be used.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libxslt/libxslt.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 15b6e6a..a40a8a9 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -16,6 +16,7 @@ LIBXSLT_DEPENDENCIES = libxml2
 # If we have enabled libgcrypt then use it, else disable crypto support.
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBXSLT_DEPENDENCIES += libgcrypt
+LIBXSLT_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 else
 LIBXSLT_CONF_OPT += --without-crypto
 endif
