From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Oct 2014 16:01:01 +0100
Subject: [Buildroot] [git commit] mp4v2: fix help2man-related build failure
Message-ID: <20141031150124.3399BB231B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7cb509b53012fefd8f2e192f0e080e9eada8a072
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/62a/62af25aace6b17492135e3567f3fa14cc05fef75/
http://autobuild.buildroot.net/results/043/043e23a8a1575f249d4654e2ce5f4a24e29d080a/
http://autobuild.buildroot.net/results/c6f/c6f1f7eef34025f736e35b5714029f5190bcb648/
http://autobuild.buildroot.net/results/bc4/bc4beb415491fdfb65639c0d51ae75a1789c68dd/

And many others.

Help2man expects to be able to run utilities on the build machine to grab
--help output which doesn't work when cross compiling, so disable it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mp4v2/mp4v2.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index 94b4727..5d38116 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -11,6 +11,11 @@ MP4V2_INSTALL_STAGING = YES
 MP4V2_LICENSE = MPLv1.1
 MP4V2_LICENSE_FILES = COPYING
 
+# help2man expects to be able to run utilities on the build machine to
+# grab --help output which doesn't work when cross compiling, so
+# disable it
+MP4V2_CONF_ENV = ac_cv_prog_FOUND_HELP2MAN=no
+
 # infrastructure passes --disable-debug if !BR2_ENABLE_DEBUG. With
 # mpv42 the only thing this option does is that it tries to strip any
 # -g* options from CFLAGS/CXXFLAGS. The logic to do so is
