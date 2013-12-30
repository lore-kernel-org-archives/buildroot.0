From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 30 Dec 2013 18:57:54 +0100
Subject: [Buildroot] [PATCH 3/3] lame: depend on libiconv if appropriate
In-Reply-To: <1388426274-17641-1-git-send-email-berndkuhls@hotmail.com>
References: <1388426274-17641-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP21319D14FC37C46519B7F62D9CE0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/lame/lame.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index 38a39a3..36aed70 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -15,6 +15,8 @@ LAME_CONF_OPT = --enable-dynamic-frontends
 LAME_LICENSE = LGPLv2+
 LAME_LICENSE_FILES = COPYING
 
+LAME_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LAME_DEPENDENCIES += libsndfile
 LAME_CONF_OPT += --with-fileio=sndfile
-- 
1.7.9.5
