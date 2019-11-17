From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Nov 2019 19:59:36 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/rng-tools: needs autoreconf
Message-ID: <20191117185936.8945-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit b6606937d861cc4de60e40baec1cb6cdb61b2aab wrongly removed
RNG_TOOLS_AUTORECONF=YES

Fixes:
 - http://autobuild.buildroot.org/results/a0a4631cc0252579b675a0c401a99239d0b97392

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rng-tools/rng-tools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index ce3f19753b..c5f3051aea 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -9,6 +9,8 @@ RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
 RNG_TOOLS_LICENSE = GPL-2.0
 RNG_TOOLS_LICENSE_FILES = COPYING
 RNG_TOOLS_DEPENDENCIES = libsysfs jitterentropy-library host-pkgconf
+# From git
+RNG_TOOLS_AUTORECONF = YES
 
 RNG_TOOLS_CONF_OPTS = \
 	--without-nistbeacon \
-- 
2.24.0
