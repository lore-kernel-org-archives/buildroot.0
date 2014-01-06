From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Jan 2014 14:16:20 +0100
Subject: [Buildroot] [git commit] libxcb: re-disable building documentation
	for the host
Message-ID: <20140106131856.49CA99C25B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=948b92693dd6ee9ea868b9b613a8ffb71baedb47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/98f/98f8dd2d1a9f8fac3024caf5aa0ca54fcf320389/

Commit 862e1221d (Bump xcb-proto & libxcb version to 1.10) accidently
dropped the --disable-build-docs configure arguments for the host variant,
which in the best case slows down the build for no use, and on certain
hosts breaks the build as doxygen runs out of memory.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/libxcb/libxcb.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index ef6b4ce..fa8ed6d 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -17,6 +17,7 @@ LIBXCB_DEPENDENCIES = \
 	host-xcb-proto host-python host-pkgconf
 
 LIBXCB_CONF_OPT = --disable-build-docs
+HOST_LIBXCB_CONF_OPT = --disable-build-docs
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
