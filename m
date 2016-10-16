From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 16 Oct 2016 13:12:41 +0200
Subject: [Buildroot] [PATCH v6 5/9] package/gnuradio: include TARGET_CFLAGS
	to the overloaded CFLAGS
In-Reply-To: <20161016111245.1847-1-s.martin49@gmail.com>
References: <20161016111245.1847-1-s.martin49@gmail.com>
Message-ID: <20161016111245.1847-6-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
changes v5->v6:
- none

changes v4->v5:
- none

changes v3->v4:
- fix commit subject
- update A/R/T tags

changes v2->v3:
- new patch
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
