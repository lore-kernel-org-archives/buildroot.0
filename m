From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Oct 2016 11:44:33 +0200
Subject: [Buildroot] [PATCH v3 4/8] package/gnuradio: includes TARGET_CFLAGS
	to the overloaded CFLAGS
In-Reply-To: <20161015094437.6989-1-s.martin49@gmail.com>
References: <20161015094437.6989-1-s.martin49@gmail.com>
Message-ID: <20161015094437.6989-5-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/gnuradio/gnuradio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 972f7a4..5cb00d2 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -36,7 +36,7 @@ GNURADIO_INSTALL_STAGING = YES
 # CFLAGS to decide whether to build the NEON functions or not, and
 # wants to see the string 'armv7' in the CFLAGS.
 ifeq ($(BR2_ARM_CPU_ARMV7A)$(BR2_ARM_CPU_HAS_NEON),yy)
-GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="-march=armv7-a"
+GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -march=armv7-a"
 endif
 
 # As soon as -mfpu=neon is supported by the compiler, gnuradio will try
-- 
2.10.0
