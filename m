From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 21:18:38 +0100
Subject: [Buildroot] [git commit] package/rng-tools: needs autoreconf
Message-ID: <20191202083933.9F510812EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d685f5375f1d59a7548eae23ea1832b10b2be9da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b6606937d861cc4de60e40baec1cb6cdb61b2aab wrongly removed
RNG_TOOLS_AUTORECONF=YES

Fixes:
 - http://autobuild.buildroot.org/results/a0a4631cc0252579b675a0c401a99239d0b97392

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Matt Weber <matt@thewebers.ws>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
