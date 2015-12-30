From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 10:12:56 +0100
Subject: [Buildroot] [git commit] collectd: fix incorrect select of libmodbus
Message-ID: <20151230091340.DC19D82714@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e5f17e8edc4e377f747893979c0a154c7e76117
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_MODBUS does not exist, we meant to select
BR2_PACKAGE_LIBMODBUS.

Fixes:

  http://autobuild.buildroot.org/results/661/6617ea58424bf55640a70bee8fc3a6a8d098e3b2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/collectd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 5cdb24e..ec7e942 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -284,7 +284,7 @@ config BR2_PACKAGE_COLLECTD_MEMORY
 
 config BR2_PACKAGE_COLLECTD_MODBUS
 	bool "modbus"
-	select BR2_PACKAGE_MODBUS
+	select BR2_PACKAGE_LIBMODBUS
 	help
 	  Reads register values from a modbus "slave" via Modbus/TCP.
 
