From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 10:11:11 +0200
Subject: [Buildroot] [git commit] mpc: autoreconf no longer needed
Message-ID: <20131004125504.D61F19B93F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7abec1b34ef35cdcc8f889b2b11f7b684435212c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 0be0899bfda5 (mpc: bump to version 1.0.1 and license change), we
no longer patch configure.ac, so we can skip the autoreconf step.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpc/mpc.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 84e4ff3..1023665 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -10,8 +10,6 @@ MPC_LICENSE = LGPLv3+
 MPC_LICENSE_FILES = COPYING.LESSER
 MPC_INSTALL_STAGING = YES
 MPC_DEPENDENCIES = gmp mpfr
-MPC_AUTORECONF = YES
-HOST_MPC_AUTORECONF = YES
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
