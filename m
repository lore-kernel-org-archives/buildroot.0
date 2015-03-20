From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 21:32:15 +0100
Subject: [Buildroot] [git commit] numactl: install to the staging directory
	as well
Message-ID: <20150320203253.E741D81890@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e3e251b6f0ee8d34bfba7d310a92773b5aede6d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In addition to building programs, numactl also builds a library and
its corresponding header files, which can be used by other programs
such as hwloc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/numactl/numactl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index 18da047..c9ea945 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -8,6 +8,7 @@ NUMACTL_VERSION = 2.0.10
 NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download
 NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPLv2 (programs)
 NUMACTL_LICENSE_FILES = README
+NUMACTL_INSTALL_STAGING = YES
 
 # numactl tarball doesn't contain a pregenerated configure script.
 NUMACTL_AUTORECONF = YES
