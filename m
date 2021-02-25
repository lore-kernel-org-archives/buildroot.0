From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2021 20:30:20 +0100
Subject: [Buildroot] [git commit] package/ply: build needs flex and bison
Message-ID: <20210225190849.9E98D86485@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81e042128533154695b822e2d4750ee7f051c5df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building needs flex and bison installed on the host system.

Fixes:
http://autobuild.buildroot.net/results/7cfe75725f4746367f2870ee9545f31ba56f6ec1

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ply/ply.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ply/ply.mk b/package/ply/ply.mk
index 0e4141f650..b72b29f315 100644
--- a/package/ply/ply.mk
+++ b/package/ply/ply.mk
@@ -10,5 +10,6 @@ PLY_AUTORECONF = YES
 PLY_LICENSE = GPL-2.0
 PLY_LICENSE_FILES = COPYING
 PLY_INSTALL_STAGING = YES
+PLY_DEPENDENCIES = host-flex host-bison
 
 $(eval $(autotools-package))
