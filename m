From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 10:58:41 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/slirp: switch
 official tarball
Message-ID: <20201114101641.43DED8367A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=062f732520c5fd6a8ba6cefeadd66a6f409ed9e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Other "official" tarballs don't ship .tarball-version resulting in a build
failure: https://gitlab.freedesktop.org/slirp/libslirp/-/issues/24

Fixes:
 - http://autobuild.buildroot.org/results/0b9cff1bc650876a6fff6102b2cb31dcdf4c5e8f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 47ffaa992ca8a179b7cacf5f0c30ea0398eb2fe0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/slirp/slirp.hash | 2 +-
 package/slirp/slirp.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/slirp/slirp.hash b/package/slirp/slirp.hash
index 3051179df9..fe295b3bfb 100644
--- a/package/slirp/slirp.hash
+++ b/package/slirp/slirp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6b1641f04d41bc45f94018ac8d42d3c9f3ba0e463cbeacf5f26fe83fc050161e  libslirp-v4.3.1.tar.bz2
+sha256  388b4b08a8cc0996cc5155cb027a097dc1a7f2cfe84b1121496608ab5366cc48  libslirp-4.3.1.tar.xz
 sha256  b28aecf4796a6a22054167f0a976de13d9db335669d37afd2dc7ea4c335e1e13  COPYRIGHT
diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 4351818952..d046e0cf75 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -5,9 +5,10 @@
 ################################################################################
 
 SLIRP_VERSION = 4.3.1
-SLIRP_SOURCE = libslirp-v$(SLIRP_VERSION).tar.bz2
-SLIRP_SITE = \
-	https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v$(SLIRP_VERSION)
+SLIRP_SOURCE = libslirp-$(SLIRP_VERSION).tar.xz
+# Other "official" tarballs don't ship .tarball-version resulting in a build
+# failure: https://gitlab.freedesktop.org/slirp/libslirp/-/issues/24
+SLIRP_SITE = https://elmarco.fedorapeople.org
 SLIRP_LICENSE = BSD-3-Clause
 SLIRP_LICENSE_FILES = COPYRIGHT
 SLIRP_INSTALL_STAGING = YES
