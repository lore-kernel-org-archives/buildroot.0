From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:49 +0100
Subject: [Buildroot] [PATCH 19/51] package/gcc: simplify setting GCC_SOURCE
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <4ad1bcde2431831f5a69cb816133a58650ddc90a.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We have a conditional block to set the GCC_SOURCE variable, so we do not
need to use a 'make' conditonal assignment.

Just move setting GCC_SOURCE in the conditional block.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 51e8378..091bba7 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -15,10 +15,9 @@ GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION)
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
+GCC_SOURCE = gcc-$(GCC_VERSION).tar.bz2
 endif
 
-GCC_SOURCE ?= gcc-$(GCC_VERSION).tar.bz2
-
 #
 # Xtensa special hook
 #
-- 
1.9.1
