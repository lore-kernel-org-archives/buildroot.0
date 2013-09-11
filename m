From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 11 Sep 2013 14:15:15 +0200
Subject: [Buildroot] [git commit] Makefile: also unexport PKG_CONFIG_LIBDIR
Message-ID: <20130911121620.BF7109B6F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bdf472d5bf9b90322c38886814e29bdf8921c5af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to how we do it for _PATH / _SYSROOT_DIR. Buildroot gets fairly
confused if the user has set up a custom PKG_CONFIG_LIBDIR, so ensure
it gets unset.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 3ca7313..8610592 100644
--- a/Makefile
+++ b/Makefile
@@ -175,6 +175,7 @@ export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
 # Make sure pkg-config doesn't look outside the buildroot tree
 unexport PKG_CONFIG_PATH
 unexport PKG_CONFIG_SYSROOT_DIR
+unexport PKG_CONFIG_LIBDIR
 
 # Having DESTDIR set in the environment confuses the installation
 # steps of some packages.
