From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:02 +0100
Subject: [Buildroot] [PATCH 01/52] package/libpjsip: disable remaining
	unspecified options
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <4931634ed45a432739c9fd9481c6c4bfcc2fd747.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are a bunch of options that are left unspecified; explicitly
disable them.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libpjsip/libpjsip.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index cb0d866..7d30bbb 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -36,6 +36,23 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-ilbc-codec \
 	--disable-webrtc \
 	--disable-opus \
+	--disable-epoll \
+	--disable-oss \
+	--disable-ext-sound \
+	--disable-small-filter \
+	--disable-large-filter \
+	--disable-g711-codec \
+	--disable-l16-codec \
+	--disable-g722-codec \
+	--disable-libsamplerate \
+	--disable-sdl \
+	--disable-ffmpeg \
+	--disable-v4l2 \
+	--disable-openh264 \
+	--disable-libyuv \
+	--disable-ipp \
+	--disable-ssl \
+	--disable-silk \
 	--with-external-srtp=$(STAGING_DIR)/usr
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.7.4
