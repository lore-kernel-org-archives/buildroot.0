From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Jun 2019 22:29:37 +0200
Subject: [Buildroot] [git commit] package/libcamera: bump to version
 caf25dc5cfd11b965316f02610d49ae3d886716b
Message-ID: <20190627203208.5A485815D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1db7890e0a7c7fb1b849300b5805e6be3fd5622f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroots autobuild identified a failure on GCC v6.2 and GCC v6.3,
producing the following warning (reported as error due to -Werror):

  event_dispatcher_poll.cpp:231:13: error: types may not be defined
      in a for-range-declaration [-Werror]

              for (const struct pollfd &pfd : pollfds) {
                         ^~~~~~
              cc1plus: all warnings being treated as errors

A fix has been integrated upstream, bump the package to incorporate it.

Fixes: http://autobuild.buildroot.net/results/f6dd4c60c04892c8b1669e6000fce7edb2b6349e/

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 0616bbdf81..fc0a21670e 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,3 +1,3 @@
-sha256 cc4630139575dc0ea47899b1ea368fdfc5faf150c20cab5bef150de9f84c558e  libcamera-ab0188fc8bbb6f397ac3aa11c9377662b7bd88b0.tar.gz
+sha256 4073ee3429a28b19f65f1df107b87df9ee01e58dc3372fcc0fcafd3350a31c23  libcamera-caf25dc5cfd11b965316f02610d49ae3d886716b.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/gnu-gpl-2.0.txt
 sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  licenses/gnu-lgpl-2.1.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 5e17dd0b93..62c48607d4 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = ab0188fc8bbb6f397ac3aa11c9377662b7bd88b0
+LIBCAMERA_VERSION = caf25dc5cfd11b965316f02610d49ae3d886716b
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = udev
 LIBCAMERA_CONF_OPTS = -Dtests=false -Ddocumentation=false
