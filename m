From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:47 +0200
Subject: [Buildroot] [PATCH 14/22] lighttpd: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-14-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/lighttpd/lighttpd.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 45941eb..ba5f5cf 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -11,7 +11,6 @@ LIGHTTPD_CONF_OPT = \
 	--libdir=/usr/lib/lighttpd \
 	--libexecdir=/usr/lib \
 	--localstatedir=/var \
-	--program-prefix="" \
 	$(if $(BR2_LARGEFILE),,--disable-lfs)
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
-- 
1.7.2.5
