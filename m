From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 May 2015 20:03:42 +0200
Subject: [Buildroot] [git commit] hwloc: fix condition to display comment
	message in menuconfig
Message-ID: <20150519200603.8F45681DC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08532f66b1adf471da5a49118214dd6b1b7ebc5d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comment message shows up if the toolchain has threads instead
of not having threads.

Signed-off-by: Florent Valette <florent.valette@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hwloc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/hwloc/Config.in b/package/hwloc/Config.in
index 51aef4a..1fb2302 100644
--- a/package/hwloc/Config.in
+++ b/package/hwloc/Config.in
@@ -12,4 +12,4 @@ config BR2_PACKAGE_HWLOC
 	  http://www.open-mpi.org/projects/hwloc/
 
 comment "hwloc needs a toolchain w/ threads"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
