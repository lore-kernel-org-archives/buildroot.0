From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Nov 2013 10:51:08 +0100
Subject: [Buildroot] [git commit] swig: unbreak host-swig build when host
	has octave installed
Message-ID: <20131124113313.54AB29BDAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f133e9b05fa2c511d476397cdcfd00c9ebe1ad60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

But not the octave development package:

checking for octave... octave
checking for mkoctfile... configure: error: mkoctfile is not installed

We don't need octace support, so fix it by explictly disabling it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swig/swig.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 94395ee..79839ea 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -7,7 +7,10 @@
 SWIG_VERSION = 2.0.10
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 SWIG_DEPENDENCIES = host-bison
-HOST_SWIG_CONF_OPT = --without-pcre --disable-ccache
+HOST_SWIG_CONF_OPT = \
+	--without-pcre \
+	--disable-ccache \
+	--without-octave
 SWIG_LICENSE = GPLv3+ BSD-2c BSD-3c
 SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
