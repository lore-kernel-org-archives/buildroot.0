From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  6 May 2015 00:48:08 +0200
Subject: [Buildroot] [PATCH] package/poppler: autoconf options take two
	dashes
Message-ID: <1430866088-893-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/poppler/poppler.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index f8b684b..234b7cc 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -74,9 +74,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENJPEG),y)
 POPPLER_DEPENDENCIES += openjpeg
-POPPLER_CONF_OPTS += -enable-libopenjpeg=openjpeg1
+POPPLER_CONF_OPTS += --enable-libopenjpeg=openjpeg1
 else
-POPPLER_CONF_OPTS += -enable-libopenjpeg=none
+POPPLER_CONF_OPTS += --enable-libopenjpeg=none
 endif
 
 $(eval $(autotools-package))
-- 
1.9.1
