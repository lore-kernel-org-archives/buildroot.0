From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 09:06:25 +0100
Subject: [Buildroot] [git commit] mtools: needs mmu
Message-ID: <20140329080633.DB73B9C41F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56e404bb883b0005ee834b2b252245051ea863a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/915/91531e06646b7453248be5c7ca22101edd42d641/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mtools/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/mtools/Config.in b/package/mtools/Config.in
index c471d77..5865223 100644
--- a/package/mtools/Config.in
+++ b/package/mtools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MTOOLS
 	bool "mtools"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	help
 	  Mtools is a collection of utilities to access MS-DOS disks from
 	  Unix without mounting them. It supports Win'95 style long file
