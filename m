From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2016 15:05:14 +0200
Subject: [Buildroot] [git commit] toolchain-external: fix registration of
	hook for Sourcery Aarch64 toolchain
Message-ID: <20160508130713.E493181D60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60b843edf0b53397b6712a3a3b30bdf9f5ff7237
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As noticed by Romain Naour, commit
4d39ca1c2ab19766abf0430abe9b65ba0e16602b ("toolchain-external: fix
installation for CodeSourcery AArch64 toolchain") has a small bug where
a post-install hook doing fixups in TARGET_DIR was registered as a
staging installation hook while it should have been registered as a
target installation hook. This commit fixes this inconsistency.

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 0ca4b91..24c1f03 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -384,7 +384,7 @@ TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY
 define TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
 	ln -sf ld-2.20.so $(TARGET_DIR)/lib/ld-linux-aarch64.so.1
 endef
-TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
+TOOLCHAIN_EXTERNAL_POST_INSTALL_TARGET_HOOKS += TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64_TARGET_FIXUP
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS),y)
 TOOLCHAIN_EXTERNAL_VERSION = 1.1.12
 TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-$(TOOLCHAIN_EXTERNAL_VERSION)
