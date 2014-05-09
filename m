From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 May 2014 16:23:38 +0200
Subject: [Buildroot] [git commit] qdecoder: autoreconf and fix c99 detection
Message-ID: <20140509142353.7FBB09CB4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b2342950dab87314268623c4bec737c8f77b5d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/da8/da8ce760cdabeb9d4cda00dcc801817e4b4eb12c/

As we're patching configure.ac we need to autoreconf the package.
After reconf, the c99 check fails, so force it like we do elsewhere.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qdecoder/qdecoder.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/qdecoder/qdecoder.mk b/package/qdecoder/qdecoder.mk
index 506d975..bbbf42a 100644
--- a/package/qdecoder/qdecoder.mk
+++ b/package/qdecoder/qdecoder.mk
@@ -8,6 +8,9 @@ QDECODER_VERSION = r12.0.5
 QDECODER_SITE = $(call github,wolkykim,qdecoder,$(QDECODER_VERSION))
 QDECODER_LICENSE = BSD-2
 QDECODER_LICENSE_FILES = COPYING
+# we patch configure.ac
+QDECODER_AUTORECONF = YES
+QDECODER_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 
 QDECODER_INSTALL_STAGING = YES
 
