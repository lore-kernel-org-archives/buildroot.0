From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jul 2014 23:46:39 +0200
Subject: [Buildroot] [git commit] uclibc: use $(MAKE) iso $(MAKE1) for
	menuconfig target
Message-ID: <20140729214725.45B879D333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=419f276c1375e6923860b6d1590a7364f7f23d68
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no real reason to run uclibc-menuconfig in non-parallel mode,
even though one can neither expect performance benefits from a parallel
menuconfig.
Nevertheless, $(MAKE) is the default, so this patch removes the unnecessary
non-default $(MAKE1) usage for uclibc-menuconfig.

This is a simplification introduced in preparation of the kconfig-package
infrastructure.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 4bc5ae1..e7749af 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -543,7 +543,7 @@ $(UCLIBC_DIR)/.stamp_config_fixup_done: $(UCLIBC_DIR)/.config
 $(UCLIBC_TARGET_CONFIGURE): $(UCLIBC_DIR)/.stamp_config_fixup_done
 
 uclibc-menuconfig: $(UCLIBC_DIR)/.config
-	$(MAKE1) -C $(UCLIBC_DIR) \
+	$(MAKE) -C $(UCLIBC_DIR) \
 		$(UCLIBC_MAKE_FLAGS) \
 		PREFIX=$(STAGING_DIR) \
 		DEVEL_PREFIX=/usr/ \
