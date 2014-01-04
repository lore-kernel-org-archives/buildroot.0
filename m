From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sat,  4 Jan 2014 10:45:44 +0000
Subject: [Buildroot] [PATCH] zmqpp: fix license information
Message-ID: <1388832344-3725-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Commit 85d28790cdbaa68179632aca7e5708fead7614f0 bumped the zmqpp Git
snapshot to 30d72d95f2cfdf9c5cedfd56747f549d65e65847.

However, the zmqpp licensing has changed (from MIT to
"LGPLv3+ with exceptions"), and the license file names have changed.

Fixes autobuild failures such as the following.

  http://autobuild.buildroot.net/results/a60/a6029fcb670cd27687a68cb96f0f14f5c13caf47


Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/zmqpp/zmqpp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index cfd6f13..9839e66 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -8,8 +8,8 @@ ZMQPP_VERSION = 30d72d95f2cfdf9c5cedfd56747f549d65e65847
 ZMQPP_SITE = git://github.com/benjamg/zmqpp.git
 ZMQPP_INSTALL_STAGING = YES
 ZMQPP_DEPENDENCIES = zeromq
-ZMQPP_LICENSE = MIT
-ZMQPP_LICENSE_FILES = LICENSE
+ZMQPP_LICENSE = LGPLv3+ with exceptions
+ZMQPP_LICENSE_FILES = COPYING COPYING.LESSER
 
 ZMQPP_MAKE_OPT = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
 ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
-- 
1.8.3.2
