From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Dec 2012 16:32:28 -0800
Subject: [Buildroot] [git commit] unexport PKG_CONFIG_SYSROOT_DIR
Message-ID: <20121203010304.934AD996F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f607edffda4835884f1f013f5d0ae0cb2eadeb7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If this is not done then pkg-config can get confused.

Thomas and Arnout really deserve the credit for this - I just did
the testing.

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index b394fd5..87943b8 100644
--- a/Makefile
+++ b/Makefile
@@ -172,6 +172,7 @@ export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
 
 # Make sure pkg-config doesn't look outside the buildroot tree
 unexport PKG_CONFIG_PATH
+unexport PKG_CONFIG_SYSROOT_DIR
 
 # Having DESTDIR set in the environment confuses the installation
 # steps of some packages.
