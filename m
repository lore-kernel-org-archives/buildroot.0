From: Charles Manning <cdhmanning@gmail.com>
Date: Mon,  3 Dec 2012 10:13:04 +1300
Subject: [Buildroot] [PATCH] unexport PKG_CONFIG_SYSROOT_DIR
Message-ID: <1354482784-31167-1-git-send-email-cdhmanning@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If this is not done then pkg-config can get confused.

Thomas and Arnout really deserve the credit for this - I just did
the testing.

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 21aa054..758453a 100644
--- a/Makefile
+++ b/Makefile
@@ -172,6 +172,7 @@ export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
 
 # Make sure pkg-config doesn't look outside the buildroot tree
 unexport PKG_CONFIG_PATH
+unexport PKG_CONFIG_SYSROOT_DIR
 
 # Having DESTDIR set in the environment confuses the installation
 # steps of some packages.
-- 
1.7.1
