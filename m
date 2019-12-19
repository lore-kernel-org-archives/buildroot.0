From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2019 14:04:24 +0100
Subject: [Buildroot] [git commit] package/wavpack: add openssl optional
 dependency
Message-ID: <20191219133600.97D7E8C9DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa8cf22d7e94158a84cdd3235b83805468629784
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

wavpack optionally depends on libcrypto since version 5.2.0 and
https://github.com/dbry/WavPack/commit/e158df5353b57ac7002d5cac4b3a040eba4c0c9f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
