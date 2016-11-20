From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Nov 2016 15:55:22 +0100
Subject: [Buildroot] [git commit] docs/manual: fix documentation about
	BR2_EXTERNAL_<name>_PATH variable
Message-ID: <20161120145529.094E38190D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d082d20a8ae3afd0638627fba662aaba7319ec69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The BR2_EXTERNAL documentation improperly tells to use the
BR2_EXTERNAL_<name>_DIR variable to reference the location of the
BR2_EXTERNAL directory. But in fact the variable is named
BR2_EXTERNAL_<name>_PATH.

In addition, some closing double quotes were missing.

This commit fixes both of those issues.

Signed-off-by: Jerry Evans <g4@novadsp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/customize-outside-br.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 70efabe..2ebb447 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -217,8 +217,8 @@ illustration, of course):
   |     `----
   |
   |- Config.in
-  |     |source "$BR2_EXTERNAL_BAR_42_DIR/package/pkg-1/Config.in
-  |     |source "$BR2_EXTERNAL_BAR_42_DIR/package/pkg-2/Config.in
+  |     |source "$BR2_EXTERNAL_BAR_42_PATH/package/pkg-1/Config.in"
+  |     |source "$BR2_EXTERNAL_BAR_42_PATH/package/pkg-2/Config.in"
   |     |
   |     |config BAR_42_FLASH_ADDR
   |     |    hex "my-board flash address"
@@ -229,7 +229,7 @@ illustration, of course):
   |     |include $(sort $(wildcard $(BR2_EXTERNAL_BAR_42_PATH)/package/*/*.mk))
   |     |
   |     |flash-my-board:
-  |     |    $(BR2_EXTERNAL_BAR_42_DIR)/board/my-board/flash-image \
+  |     |    $(BR2_EXTERNAL_BAR_42_PATH)/board/my-board/flash-image \
   |     |        --image $(BINARIES_DIR)/image.bin \
   |     |        --address $(BAR_42_FLASH_ADDR)
   |     `----
