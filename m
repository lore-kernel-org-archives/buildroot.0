From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 22:26:52 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: more verbose in
	crosstool-ng backend
Message-ID: <20101213214845.9FE968E2C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5c09e36cb66dcb5badfa954a5e632428292f37a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, Crosstool-NG hides all the details of the toolchain build
process. However, this is inconsistent with the typical Buildroot
build, and the rotating progress thing makes log file resulting from
redirecting the Buildroot output a bit unusable. Therefore, switch the
Crosstool-NG configuration to a more verbose default.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../toolchain-crosstool-ng/crosstool-ng.config     |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.config b/toolchain/toolchain-crosstool-ng/crosstool-ng.config
index d5ee244..506f78a 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.config
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.config
@@ -72,12 +72,12 @@ CT_CONFIG_SHELL_CUSTOM_PATH="/bin/sh"
 # CT_LOG_ERROR is not set
 # CT_LOG_WARN is not set
 # CT_LOG_INFO is not set
-CT_LOG_EXTRA=y
-# CT_LOG_ALL is not set
+# CT_LOG_EXTRA is not set
+CT_LOG_ALL=y
 # CT_LOG_DEBUG is not set
-CT_LOG_LEVEL_MAX="EXTRA"
+CT_LOG_LEVEL_MAX="ALL"
 # CT_LOG_SEE_TOOLS_WARN is not set
-CT_LOG_PROGRESS_BAR=y
+# CT_LOG_PROGRESS_BAR is not set
 CT_LOG_TO_FILE=y
 CT_LOG_FILE_COMPRESS=y
 
-- 
1.7.2.2
