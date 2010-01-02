From: Clark Rawlins <clark.rawlins@escient.com>
Date: Sat, 02 Jan 2010 17:29:28 -0500
Subject: [Buildroot] [PATCH 1/1] Permit configure users to specify a board
	name.
Message-ID: <1262471368.23927.13.camel@venture>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this change it isn't possible to change the
board name to match your target with this change it
is possible to do so.

Signed-off-by: Clark Rawlins <clark.rawlins@escient.com>
---
 target/device/x86/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target/device/x86/Config.in b/target/device/x86/Config.in
index 0b88f7a..d09e405 100644
--- a/target/device/x86/Config.in
+++ b/target/device/x86/Config.in
@@ -15,7 +15,7 @@ config BR2_TARGET_I686
 endchoice
 
 config BR2_BOARD_NAME
-	string
+	string "Board Name"
 	default "i686"		if BR2_TARGET_I686
 
 config BR2_BOARD_PATH
-- 
1.6.3.3
