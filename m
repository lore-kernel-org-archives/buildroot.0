From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Aug 2018 00:06:20 +0200
Subject: [Buildroot] [PATCH 3/3] linux: drop dependency on host-{bison, flex}
In-Reply-To: <cover.1533333972.git.yann.morin.1998@free.fr>
References: <cover.1533333972.git.yann.morin.1998@free.fr>
Message-ID: <0c44ca5ddc27dfe13152a08b4bdd48ce3b8599dc.1533333972.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we expect those two tools to be installed n the host, just
depend on them to generate the linux kconfig parser.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7527b11673..7f624e6cb7 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -62,7 +62,7 @@ LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 LINUX_PATCH = $(filter ftp://% http://% https://%,$(LINUX_PATCHES))
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES += host-bison host-flex host-kmod
+LINUX_DEPENDENCIES = host-kmod
 
 # host tools needed for kernel compression
 ifeq ($(BR2_LINUX_KERNEL_LZ4),y)
-- 
2.14.1
