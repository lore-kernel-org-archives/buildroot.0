From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Aug 2015 10:56:06 -0000
Subject: [Buildroot] [git commit branch/next] package/scons: reduce output
	when being silent
Message-ID: <20150808105604.6B2207FF82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=803596c37d3cb1b2d8a03a2e7afdac3700a41ff3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use the "-s" option to reduce scons output when it is a silent build.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/scons/scons.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index e418530..39fb258 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -18,4 +18,4 @@ HOST_SCONS_INSTALL_OPTS = \
 $(eval $(host-python-package))
 
 # variables used by other packages
-SCONS = $(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/scons
+SCONS = $(HOST_DIR)/usr/bin/python2 $(HOST_DIR)/usr/bin/scons $(if $(QUIET),-s)
