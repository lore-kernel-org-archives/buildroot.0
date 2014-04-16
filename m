From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:56:14 +0200
Subject: [Buildroot] [git commit] liblogging: enable systemd compatibility
	libs
Message-ID: <20140416175620.9A03E9C80F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77d6e6ac2a74bc591cdfcadcb1d2f3e79a4469a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If systemd is chosen as init system, liblogging will enable the
installation of compatibility libraries in systemd.

When liblogging will be updated to depend on libsystemd.so, this
selection will have to be removed.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liblogging/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/liblogging/Config.in b/package/liblogging/Config.in
index 23c3c1a..12ee950 100644
--- a/package/liblogging/Config.in
+++ b/package/liblogging/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBLOGGING
 	bool "liblogging"
+	select BR2_PACKAGE_SYSTEMD_COMPAT if BR2_INIT_SYSTEMD
 	help
 	  Liblogging is an easy to use library for
 	  logging. It offers an enhanced replacement
