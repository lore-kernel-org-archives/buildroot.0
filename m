From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 11:46:15 +0200
Subject: [Buildroot] [git commit] Makefile: remove $(HOST_DIR)/usr from
	BR_PATH
Message-ID: <20170705095035.E0F3B817B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c8872d8e71a99a1eee448d57d25403dbab9dafc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now $(HOST_DIR)/usr is a symlink to $(HOST_DIR), it makes no sense to
still have it in BR_PATH.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7453bfd..19d8b44 100644
--- a/Makefile
+++ b/Makefile
@@ -440,7 +440,7 @@ TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
 
 # Quotes are needed for spaces and all in the original PATH content.
-BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
+BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
 
 # Location of a file giving a big fat warning that output/target
 # should not be used as the root filesystem.
