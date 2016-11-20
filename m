From: jerry at chordia.co.uk <jerry@chordia.co.uk>
Date: Sun, 20 Nov 2016 13:28:36 -0000
Subject: [Buildroot] Possible documentation error and a patch
Message-ID: <193601d24331$ffd8ea30$ff8abe90$@chordia.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings. 

I think the example here
http://nightly.buildroot.org/manual.html#outside-br-custom has a couple of
typos?

The example layout has $BR2_EXTERNAL_BAR_42_DIR instead of
$BR2_EXTERNAL_BAR_42_PATH in a couple of places and the source lines in the
example config.in are incorrectly quoted.

If I've read this correctly please find patch attached.

BR,

Jerry

Signed-off-by: Jerry Evans g4 at novadsp.com
---
 docs/manual/customize-outside-br.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/customize-outside-br.txt
b/docs/manual/customize-outside-br.txt
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
   |     |include $(sort $(wildcard
$(BR2_EXTERNAL_BAR_42_PATH)/package/*/*.mk))
   |     |
   |     |flash-my-board:
-  |     |    $(BR2_EXTERNAL_BAR_42_DIR)/board/my-board/flash-image \
+  |     |    $(BR2_EXTERNAL_BAR_42_PATH)/board/my-board/flash-image \
   |     |        --image $(BINARIES_DIR)/image.bin \
   |     |        --address $(BAR_42_FLASH_ADDR)
   |     `----
-- 
2.7.4
