From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2010 19:42:53 +0100
Subject: [Buildroot] [PATCH 02/16] ccache: remove cleanup of documentation
In-Reply-To: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <53f670ac06837e0517cffad747435e5d1677d3fa.1266691382.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cleanup of documentation is handled in a global way, in the main
Makefile.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/ccache/ccache.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/toolchain/ccache/ccache.mk b/toolchain/ccache/ccache.mk
index c98937d..8e414b2 100644
--- a/toolchain/ccache/ccache.mk
+++ b/toolchain/ccache/ccache.mk
@@ -163,9 +163,6 @@ $(CCACHE_DIR2)/$(CCACHE_BINARY): $(CCACHE_DIR2)/.configured
 
 $(TARGET_DIR)/$(CCACHE_TARGET_BINARY): $(CCACHE_DIR2)/$(CCACHE_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(CCACHE_DIR2) install
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/man
-endif
 	# put a bunch of symlinks into /bin, since that is earlier
 	# in the default PATH than /usr/bin where gcc lives
 	(cd $(TARGET_DIR)/bin; \
-- 
1.6.3.3
