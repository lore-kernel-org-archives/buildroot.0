From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 22:42:56 +0200
Subject: [Buildroot] [git commit] package/sentry-cli: fix dependency on
 host-rustc
Message-ID: <20200930203246.914998E306@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de1ddbf021728ff2895a3503048919394e6fb20c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace SENTRY_CLI_DEPENDENCIES by HOST_SENTRY_CLI_DEPENDENCIES as
sentry-cli is a host-generic-package

Fixes:
 - http://autobuild.buildroot.org/results/ce566ec91a8f7d69f2525892a7a034c829db9dad

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sentry-cli/sentry-cli.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
index 5f60d27366..56b787c31f 100644
--- a/package/sentry-cli/sentry-cli.mk
+++ b/package/sentry-cli/sentry-cli.mk
@@ -9,7 +9,7 @@ SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
 SENTRY_CLI_LICENSE = BSD-3-clause
 SENTRY_CLI_LICENSE_FILES = LICENSE
 
-SENTRY_CLI_DEPENDENCIES = host-rustc
+HOST_SENTRY_CLI_DEPENDENCIES = host-rustc
 
 HOST_SENTRY_CLI_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
 
