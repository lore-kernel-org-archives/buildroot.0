From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 23:30:33 +0200
Subject: [Buildroot] [git commit] package/gnuradio: link with libatomic when
	needed
Message-ID: <20170722212628.1FE15803E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83ce8070b4f11c833026771f72916b423c444eb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/528/52825918bf65b23241cd68d99513350703469294/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuradio/gnuradio.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 6407dd4..a55c116 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -30,6 +30,10 @@ GNURADIO_CONF_OPTS = \
 # compile time.
 GNURADIO_INSTALL_STAGING = YES
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GNURADIO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 # Yes, this is silly, because -march is already known by the compiler
 # with the internal toolchain, and passed by the external wrapper for
 # external toolchains. Nonetheless, gnuradio does some matching on the
