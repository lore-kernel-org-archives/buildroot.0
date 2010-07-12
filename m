From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 12 Jul 2010 22:46:13 +0200
Subject: [Buildroot] [PATCH 2/5] toolchain: rename external toolchain dir
In-Reply-To: <1278967576-11399-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1278967576-11399-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1278967576-11399-3-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename the external toolchain directory.
When new backends are here, it will be easier to sort them out
if they are all prefixed the same way.

Signed-off-by: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
---
 toolchain/Config.in                                |    4 ++--
 .../Config.in                                      |    0
 .../Config.in.2                                    |    0
 .../ext-tool.mk                                    |    0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename toolchain/{external-toolchain => toolchain-external}/Config.in (100%)
 rename toolchain/{external-toolchain => toolchain-external}/Config.in.2 (100%)
 rename toolchain/{external-toolchain => toolchain-external}/ext-tool.mk (100%)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index ee94143..52b9d8b 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -17,7 +17,7 @@ config BR2_TOOLCHAIN_EXTERNAL
 endchoice
 
 source "toolchain/Config.in.1"
-source "toolchain/external-toolchain/Config.in"
+source "toolchain/toolchain-external/Config.in"
 
 # we want gdb config in the middle of both source and external
 # toolchains, but mconf won't let us source the same file twice,
@@ -26,6 +26,6 @@ source "toolchain/gdb/Config.in"
 comment "Common Toolchain Options"
 
 source "toolchain/Config.in.2"
-source "toolchain/external-toolchain/Config.in.2"
+source "toolchain/toolchain-external/Config.in.2"
 
 endmenu
diff --git a/toolchain/external-toolchain/Config.in b/toolchain/toolchain-external/Config.in
similarity index 100%
rename from toolchain/external-toolchain/Config.in
rename to toolchain/toolchain-external/Config.in
diff --git a/toolchain/external-toolchain/Config.in.2 b/toolchain/toolchain-external/Config.in.2
similarity index 100%
rename from toolchain/external-toolchain/Config.in.2
rename to toolchain/toolchain-external/Config.in.2
diff --git a/toolchain/external-toolchain/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
similarity index 100%
rename from toolchain/external-toolchain/ext-tool.mk
rename to toolchain/toolchain-external/ext-tool.mk
-- 
1.7.1
