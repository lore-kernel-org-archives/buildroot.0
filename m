From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Jul 2016 21:31:45 +0200
Subject: [Buildroot] [git commit] runc: add missing dependency on
	host-pkgconf
Message-ID: <20160706193216.B7AA18211F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8ea5ef41b24d7176541991814a215a4cba5e5e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

runc uses pkg-config to detect libseccomp, so we need to depend on it.

Fixes:

  http://autobuild.buildroot.net/results/72f1cf194843b8519a3ebf213cdbf06873809055/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/runc/runc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 6a0c88c..c4e75dd 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -25,7 +25,7 @@ RUNC_GOTAGS = cgo static_build
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 RUNC_GOTAGS += seccomp
-RUNC_DEPENDENCIES += libseccomp
+RUNC_DEPENDENCIES += libseccomp host-pkgconf
 endif
 
 define RUNC_CONFIGURE_CMDS
