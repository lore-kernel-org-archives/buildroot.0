From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 15:21:31 +0200
Subject: [Buildroot] [git commit] fftw: fix build failure with old gcc
Message-ID: <20150411132152.0BB488080E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9cd352f4df400e93dc0a6c0e09f679ae84ed2240
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-Ofast is not available on gcc <4.6. This option is equivalent to
-O3 -ffast-math.

Fixes:
http://autobuild.buildroot.org/results/207/207a20a3ca5e62029823b1361479d5cd38fefeb0/
http://autobuild.buildroot.net/results/871/871b29c9bbf94aa05034c442f35c8771f83abe1e/

[Thomas: remove Yann SoB.]

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fftw/fftw.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 1148909..5045ab6 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -18,7 +18,7 @@ FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_PRECISION_QUAD),--enable,--disable)-qu
 
 FFTW_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_PACKAGE_FFTW_FAST),y)
-FFTW_CFLAGS += -Ofast
+FFTW_CFLAGS += -O3 -ffast-math
 endif
 
 # x86 optimisations
