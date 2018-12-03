From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 22:45:44 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package/dante: needs
 autoreconf
Message-ID: <20181203215204.29B0581E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=094ffdfdb598785296d50a37e07493d406db1c62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

We have a patch that touches a .m4 file, so we need to regenerate the
configure script. Otherwise, this is done during the build step, and
some environment variables are thus missing and the build may fail when
the host machine does not have the expected autostuff tools.

Fixes:
    http://autobuild.buildroot.org/results/e37/e37e61bae1d81a7956e2843be70fea84b0bbb64b/
    http://autobuild.buildroot.org/results/f96/f969718402cae71446d6280ec1f66d357a155293/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 83d19028126ffcad91913dd62d862809f743fd64)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dante/dante.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index a147aa36dc..9471acc692 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -9,8 +9,8 @@ DANTE_SITE = http://www.inet.no/dante/files
 DANTE_LICENSE = BSD-3-Clause
 DANTE_LICENSE_FILES = LICENSE
 
-# Dante uses a *VERY* old configure.ac
-DANTE_LIBTOOL_PATCH = NO
+# 0002-compiler.m4-do-not-remove-g-flag.patch touches a m4 file
+DANTE_AUTORECONF = YES
 
 DANTE_CONF_OPTS += --disable-client --disable-preload --without-pam
 
