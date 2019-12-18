From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 18 Dec 2019 23:23:19 +0100
Subject: [Buildroot] [PATCH 2/2] package/wavpack: add openssl optional
 dependency
In-Reply-To: <20191218222319.1259596-1-fontaine.fabrice@gmail.com>
References: <20191218222319.1259596-1-fontaine.fabrice@gmail.com>
Message-ID: <20191218222319.1259596-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wavpack optionally depends on libcrypto since version 5.2.0 and
https://github.com/dbry/WavPack/commit/e158df5353b57ac7002d5cac4b3a040eba4c0c9f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wavpack/wavpack.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wavpack/wavpack.mk b/package/wavpack/wavpack.mk
index 9246b95397..8cb7754b2b 100644
--- a/package/wavpack/wavpack.mk
+++ b/package/wavpack/wavpack.mk
@@ -17,6 +17,13 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 WAVPACK_CONF_OPTS += LIBS=-liconv
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+WAVPACK_DEPENDENCIES += openssl
+WAVPACK_CONF_OPTS += --enable-libcrypto
+else
+WAVPACK_CONF_OPTS += --disable-libcrypto
+endif
+
 # WavPack "autodetects" CPU type to enable ASM code. However, the assembly code
 # for ARM is written for ARMv7 only and building WavPack for an ARM-non-v7
 # architecture will fail. We explicitly enable ASM for the supported
-- 
2.24.0
