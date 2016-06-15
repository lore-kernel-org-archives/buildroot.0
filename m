From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:10:31 +0200
Subject: [Buildroot] [git commit] gdb: do not allow selecting the simulator
	on ARC
Message-ID: <20160615211115.901E380D9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e03b0e1e6f7577c4c7a2310f0034eed9c5203ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Forbid BR2_PACKAGE_HOST_GDB_SIM selection for the ARC architecture,
since the simulator is not supported on ARC.

Fixes:

 http://autobuild.buildroot.net/results/4a1cd9a0beaff34830fd0f0ec47c30eda0a42d54/

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
[Thomas: tweak commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 7b319f5..081073b 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -25,6 +25,7 @@ config BR2_PACKAGE_HOST_GDB_PYTHON
 
 config BR2_PACKAGE_HOST_GDB_SIM
 	bool "Simulator support"
+	depends on !BR2_arc
 	help
 	  This option enables the simulator support in the cross gdb.
 
