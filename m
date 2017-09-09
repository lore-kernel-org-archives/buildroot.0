From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:49 +0200
Subject: [Buildroot] [PATCH 43/49 v2] package/libpjsip: add optional
	portaudio support
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <d3549e9e07e5403d2122c92ee686d649050df3c5.1504993178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/libpjsip/libpjsip.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index e090b406c3..f9d24d4aa4 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -62,6 +62,11 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 LIBPJSIP_DEPENDENCIES += util-linux
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+LIBPJSIP_DEPENDENCIES += portaudio
+LIBPJSIP_CONF_OPTS += --with-external-pa
+endif
+
 # Codecs can only be disabled. If explictly enabled, the check is
 # omitted (but successful), and there is no configure trace "Checking
 # if [codec] codec is disabled...no". So we only explicitly disable it
-- 
2.11.0
