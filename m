From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Feb 2014 23:16:49 +0100
Subject: [Buildroot] [git commit] nut: disable parallel builds
Message-ID: <20140213221719.9A80A9C72B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b0a3ad646ee9ab7cd06d3c41c2bc851db9fdb3a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build system has a race condition causing build failure,
so ensure make -j1 is used.

Fixes:
http://autobuild.buildroot.net/results/0dd/0ddd856bcbec2db0500791fd428ba053d6e4fa1b/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nut/nut.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 04fb36d..b318258 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -14,6 +14,9 @@ NUT_DEPENDENCIES = host-pkgconf
 # Our patch changes m4 macros, so we need to autoreconf
 NUT_AUTORECONF = YES
 
+# Disable parallel builds
+NUT_MAKE = $(MAKE1)
+
 # Put the PID files in a read-write place (/var/run is a tmpfs)
 # since the default location (/var/state/ups) maybe readonly.
 NUT_CONF_OPT = \
