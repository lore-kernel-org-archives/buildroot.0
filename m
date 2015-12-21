From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 16:56:52 +0100
Subject: [Buildroot] [PATCH 1/8 RFC] core: split long line of directories
In-Reply-To: <cover.1450712392.git.yann.morin.1998@free.fr>
References: <cover.1450712392.git.yann.morin.1998@free.fr>
Message-ID: <4fcb2d73e8b618e90f618090d21bca44c7dff6a2.1450712392.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

More are coming, so split for readability.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index dc657d9..f2b09ad 100644
--- a/Makefile
+++ b/Makefile
@@ -445,7 +445,9 @@ world: target-post-image
 # dependencies anywhere else
 #
 ################################################################################
-$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
+$(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR):
+	@mkdir -p $@
+$(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR_TARGET) $(REDIST_SOURCES_DIR_HOST):
 	@mkdir -p $@
 
 # We make a symlink lib32->lib or lib64->lib as appropriate
-- 
1.9.1
