From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Oct 2012 17:40:35 +0100
Subject: [Buildroot] [PATCH 5/7] Support KERNEL_ARCH for AArch64
In-Reply-To: <1351442438-20639-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1351442438-20639-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1351442438-20639-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The architecture tuple is 'aarch64', but the kernel people decided to
call it 'arm64', so we have to do some mungling to get the kernel
architecture name from the Buildroot architecture name.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    1 +
 1 file changed, 1 insertion(+)

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
-- 
1.7.9.5
