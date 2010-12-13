From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Dec 2010 17:27:49 +0100
Subject: [Buildroot] [PATCH 13/14] toolchain: more verbose in crosstool-ng
	backend
In-Reply-To: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7b20c8407580bff3fa1809440eaa6b1ea25ad91e.1292257643.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, Crosstool-NG hides all the details of the toolchain build
process. However, this is inconsistent with the typical Buildroot
build, and the rotating progress thing makes log file resulting from
redirecting the Buildroot output a bit unusable. Therefore, switch the
Crosstool-NG configuration to a more verbose default.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.0.4
