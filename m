From: Semyon Kolganov <semenak94@mail.ru>
Date: Sun,  7 May 2017 20:43:04 +0300
Subject: [Buildroot] [PATCH] mpir: fix ARM, PowerPC and mips builds failure
In-Reply-To: <1494178984-19821-1-git-send-email-semenak94@mail.ru>
References: <mpir: fix ARM, PowerPC64 and MIPS build failure>
 <1494178984-19821-1-git-send-email-semenak94@mail.ru>
Message-ID: <1494178984-19821-2-git-send-email-semenak94@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 * ARM
     http://autobuild.buildroot.net/results/fd0/fd032f7dbd4cace84bb31e8017cb6139ef3c1072
     http://autobuild.buildroot.net/results/c36/c360581c2925529f18635aac32c2865899f5e0f5

 * MIPS
     http://autobuild.buildroot.net/results/c45/c45dd59f10693b0d9a86dac4733c6c3dde4554f1

 * PowerPC64
      http://autobuild.buildroot.net/results/be1/be1478836b2e7b580174641f48de92c9b02512a7

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
---
 package/mpir/mpir.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
index b7f3829..420d065 100644
--- a/package/mpir/mpir.mk
+++ b/package/mpir/mpir.mk
@@ -12,6 +12,9 @@ MPIR_LICENSE_FILES = COPYING.LIB
 MPIR_INSTALL_STAGING = YES
 MPIR_DEPENDENCIES = gmp host-yasm
 
+# Prefer generic build
+MPIR_CONF_ENV += MPN_PATH=generic
+
 ifeq ($(BR2_MIPS_NABI32),y)
 MPIR_CONF_OPTS += ABI=n32
 endif
-- 
2.7.4
