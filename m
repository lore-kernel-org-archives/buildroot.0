From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:23 +0100
Subject: [Buildroot] [PATCH 22/52] package/asterisk: add optional libsrtp
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <8f8af61a67ef93ca566f87eced45244917936bf2.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 0fd2ecd..a63579a 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -72,7 +72,6 @@ ASTERISK_CONF_OPTS += \
 	--without-spandsp \
 	--without-ss7 \
 	--without-sqlite \
-	--without-srtp \
 	--without-suppserv \
 	--without-tds \
 	--without-termcap \
@@ -199,6 +198,13 @@ else
 ASTERISK_CONF_OPTS += --without-speex  --without-speexdsp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSRTP),y)
+ASTERISK_DEPENDENCIES += libsrtp
+ASTERISK_CONF_OPTS += --with-srtp
+else
+ASTERISK_CONF_OPTS += --without-srtp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
 ASTERISK_DEPENDENCIES += libvorbis
 ASTERISK_CONF_OPTS += --with-vorbis
-- 
2.7.4
