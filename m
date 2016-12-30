From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:47 +0100
Subject: [Buildroot] [PATCH 46/52] package/libpjsip: add optional portaudio
	support
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <ee7af0523588df90be22fd9ce2d0baf81fc3d542.1483093662.git.yann.morin.1998@free.fr>
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
index 19f6edb..23041f2 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -58,6 +58,11 @@ ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
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
2.7.4
