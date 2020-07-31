From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Fri, 31 Jul 2020 12:10:34 +0200
Subject: [Buildroot] [PATCH 09/15] package/e2fsprogs: select SELinux module
In-Reply-To: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
Message-ID: <20200731101040.1723047-10-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Select the fstools SELinux module when e2fsprogs binaries are compiled
and installed in the target filesystem, so that they'll be supported by
the SELinux policy.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/e2fsprogs/e2fsprogs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index f6642d8de164..eb82a55ce79d 100644
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
-- 
2.26.2
