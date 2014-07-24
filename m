From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Jul 2014 19:49:29 +0200
Subject: [Buildroot] [PATCH 2 of 7] uclibc: use $(MAKE) iso $(MAKE1) for
	menuconfig target
In-Reply-To: <patchbomb.1406224167@localhost>
References: <patchbomb.1406224167@localhost>
Message-ID: <7c00a2ad37245845229c.1406224169@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no real reason to run uclibc-menuconfig in non-parallel mode,
even though one can neither expect performance benefits from a parallel
menuconfig.
Nevertheless, $(MAKE) is the default, so this patch removes the unnecessary
non-default $(MAKE1) usage for uclibc-menuconfig.

This is a simplification introduced in preparation of the kconfig-package
infrastructure.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/uclibc/uclibc.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff -r c9dcec875ddb -r 7c00a2ad3724 package/uclibc/uclibc.mk
--- a/package/uclibc/uclibc.mk	Mon Jun 30 21:08:13 2014 +0200
+++ b/package/uclibc/uclibc.mk	Wed Jul 23 21:12:48 2014 +0200
@@ -543,7 +543,7 @@
 $(UCLIBC_TARGET_CONFIGURE): $(UCLIBC_DIR)/.stamp_config_fixup_done
 
 uclibc-menuconfig: $(UCLIBC_DIR)/.config
-	$(MAKE1) -C $(UCLIBC_DIR) \
+	$(MAKE) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
 		DEVEL_PREFIX=/usr/ \
