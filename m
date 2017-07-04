From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 4 Jul 2017 16:03:55 +0200
Subject: [Buildroot] [PATCH v3 05/14] Makefile: remove $(HOST_DIR)/usr from
	BR_PATH
In-Reply-To: <20170704140404.4098-1-arnout@mind.be>
References: <20170704140404.4098-1-arnout@mind.be>
Message-ID: <20170704140404.4098-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now $(HOST_DIR)/usr is a symlink to $(HOST_DIR), it makes no sense to
still have it in BR_PATH.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7453bfd193..19d8b442a3 100644
--- a/Makefile
+++ b/Makefile
@@ -440,7 +440,7 @@ TAR_OPTIONS = $(call qstrip,$(BR2_TAR_OPTIONS)) -xf
 HOST_DIR := $(call qstrip,$(BR2_HOST_DIR))
 
 # Quotes are needed for spaces and all in the original PATH content.
-BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"
+BR_PATH = "$(HOST_DIR)/bin:$(HOST_DIR)/sbin:$(PATH)"
 
 # Location of a file giving a big fat warning that output/target
 # should not be used as the root filesystem.
-- 
2.13.2
