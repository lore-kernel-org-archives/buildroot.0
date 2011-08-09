From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:39 +0200
Subject: [Buildroot] [PATCH 06/22] jpeg: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-6-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/jpeg/jpeg.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/jpeg/jpeg.mk b/package/jpeg/jpeg.mk
index 30a6225..adbe330 100644
--- a/package/jpeg/jpeg.mk
+++ b/package/jpeg/jpeg.mk
@@ -8,7 +8,6 @@ JPEG_SITE = http://www.ijg.org/files/
 JPEG_SOURCE = jpegsrc.v$(JPEG_VERSION).tar.gz
 JPEG_INSTALL_STAGING = YES
 JPEG_INSTALL_TARGET = YES
-JPEG_CONF_OPT = --program-prefix=
 
 define JPEG_REMOVE_USELESS_TOOLS
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,cjpeg djpeg jpegtrans rdjpgcom wrjpgcom)
-- 
1.7.2.5
