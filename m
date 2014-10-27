From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 27 Oct 2014 22:48:35 +0100
Subject: [Buildroot] [PATCH] schifra: fix build of examples
Message-ID: <1414446515-18578-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The OPTIONS argument passed to make had a redundant -o option, leading
to:

g++ -pipe -Os   -o -o schifra_reed_solomon_speed_evaluation schifra_reed_solomon_speed_evaluation.cpp -lstdc++ -lm
arm-linux-musleabi-g++: error: schifra_reed_solomon_speed_evaluation: No such file or directory

Fixes:
http://autobuild.buildroot.net/results/2143b4f6f22f50ccb4af36732cc7d9304daa3ff9/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
This has been in buildroot for more than two years and it cannot ever
have succeeded... How come the autobuilders didn't pick this up?

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/schifra/schifra.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/schifra/schifra.mk b/package/schifra/schifra.mk
index 96387d3..e55bf02 100644
--- a/package/schifra/schifra.mk
+++ b/package/schifra/schifra.mk
@@ -12,7 +12,7 @@ SCHIFRA_LICENSE = schifra license
 SCHIFRA_LICENSE_FILES = schifra_license.txt
 
 SCHIFRA_MAKE_OPTS = COMPILER="$(TARGET_CXX)" \
-		   OPTIONS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o"
+		   OPTIONS="$(TARGET_CFLAGS) $(TARGET_LDFLAGS)"
 
 # The examples are the only buildable artefacts.
 ifeq ($(BR2_PACKAGE_SCHIFRA_EXAMPLES),y)
-- 
2.1.1
