From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  1 Oct 2020 19:14:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/sentry-cli: needs host-zlib
Message-ID: <20201001171441.529114-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/bca6f0ef30bc8fdfa98f48c96de368dc4644a1f5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sentry-cli/sentry-cli.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
index 56b787c31f..c4dbc5ebfd 100644
--- a/package/sentry-cli/sentry-cli.mk
+++ b/package/sentry-cli/sentry-cli.mk
@@ -9,7 +9,7 @@ SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
 SENTRY_CLI_LICENSE = BSD-3-clause
 SENTRY_CLI_LICENSE_FILES = LICENSE
 
-HOST_SENTRY_CLI_DEPENDENCIES = host-rustc
+HOST_SENTRY_CLI_DEPENDENCIES = host-rustc host-zlib
 
 HOST_SENTRY_CLI_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
 
-- 
2.28.0
