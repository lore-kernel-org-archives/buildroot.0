From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 20 Sep 2014 22:07:21 +0200
Subject: [Buildroot] [PATCH 2/3] package/gnupg2: add bzip2 optional
	dependency
In-Reply-To: <1411243642-17955-1-git-send-email-romain.naour@openwide.fr>
References: <1411243642-17955-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1411243642-17955-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/gnupg2/gnupg2.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 1e3506a..e0c130b 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -27,4 +27,10 @@ endef
 GNUPG2_POST_INSTALL_TARGET_HOOKS += GNUPG2_REMOVE_GPGV2
 endif
 
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+GNUPG2_DEPENDENCIES += bzip2
+else
+GNUPG2_CONF_OPT += --disable-bzip2
+endif
+
 $(eval $(autotools-package))
-- 
1.9.3
