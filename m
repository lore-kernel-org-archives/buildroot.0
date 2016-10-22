From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 16:21:14 +0200
Subject: [Buildroot] [git commit] package/gnuradio: include TARGET_CFLAGS to
	the overloaded CFLAGS
Message-ID: <20161022144115.98FE5819CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1255d0080ccecebfa4d53dfd36d0cbde8a3c6e61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
