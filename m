From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Tue, 17 Dec 2019 13:32:53 -0800
Subject: [Buildroot] [PATCH v2] binutils/ARC: cleanup
In-Reply-To: <20191206221918.1c05e316@windsurf.home>
References: <20191206221918.1c05e316@windsurf.home>
Message-ID: <20191217213253.12446-1-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove special handling for ARC - as it is not needed for cksy etc.

A nice side benefit is that the ARC specific version now only needs to
be specified in single place (vs 3 currently) in binutils/Config.in.host

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 package/binutils/binutils.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index a19d6940f7c1..3ae5561d67d3 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -8,14 +8,10 @@
 # If not, we do like other packages
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
-ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2019.09-rc1
-else
 BINUTILS_VERSION = 2.32
 endif
-endif # BINUTILS_VERSION
 
-ifeq ($(BINUTILS_VERSION),arc-2019.09-rc1)
+ifeq ($(BR2_BINUTILS_VERSION_ARC),y)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
-- 
2.20.1
