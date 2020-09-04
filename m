From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 11:07:50 +0200
Subject: [Buildroot] [git commit] package/e2fsprogs: select SELinux module
Message-ID: <20200904123951.CC7148185A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c0edf765ec0e3f11c836517a2a27735f28adee6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Select the fstools SELinux module when e2fsprogs binaries are compiled
and installed in the target filesystem, so that they'll be supported by
the SELinux policy.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/e2fsprogs/e2fsprogs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index f6642d8de1..eb82a55ce7 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -17,6 +17,8 @@ E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
 HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
 
+E2FSPROGS_SELINUX_MODULES = fstools
+
 # e4defrag doesn't build on older systems like RHEL5.x, and we don't
 # need it on the host anyway.
 # Disable fuse2fs as well to avoid carrying over deps, and it's unused
