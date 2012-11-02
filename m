From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Nov 2012 21:08:50 +0100
Subject: [Buildroot] [git commit] Support KERNEL_ARCH for AArch64
Message-ID: <20121102231432.29C59999E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b90a10303e459dd288d434b27fc1e688ff94afba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The architecture tuple is 'aarch64', but the kernel people decided to
call it 'arm64', so we have to do some mungling to get the kernel
architecture name from the Buildroot architecture name.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 0128839..dff6aeb 100644
--- a/Makefile
+++ b/Makefile
@@ -235,6 +235,7 @@ ARCH:=$(call qstrip,$(BR2_ARCH))
 KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
 	-e s/arm.*/arm/ -e s/sa110/arm/ \
+	-e s/aarch64/arm64/ \
 	-e s/bfin/blackfin/ \
 	-e s/parisc64/parisc/ \
 	-e s/powerpc64/powerpc/ \
