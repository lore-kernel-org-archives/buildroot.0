From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Dec 2019 16:28:47 +0100
Subject: [Buildroot] [PATCH] package/openpowerlink: drop bogus select
Message-ID: <20191213152847.1377137-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no option BR2_PACKAGE_OPENPOWERLINK_PCAP_DAEMON, and we never
had any option named like this, so it seems like a leftover from
previous iterations of the openpowerlink patch series. Since the
option does not exist, the select doesn't do anything, and we can
simply drop it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openpowerlink/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
index 68ea751954..1a3dd62acd 100644
--- a/package/openpowerlink/Config.in
+++ b/package/openpowerlink/Config.in
@@ -50,7 +50,6 @@ config BR2_PACKAGE_OPENPOWERLINK_STACK_MONOLITHIC_USER_STACK_LIB
 config BR2_PACKAGE_OPENPOWERLINK_STACK_USERSPACE_DAEMON_LIB
 	bool "user-space pcap daemon"
 	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_OPENPOWERLINK_PCAP_DAEMON
 	help
 	  Compile openPOWERLINK application library which contains the
 	  interface to a Linux user space driver, and the Linux user
-- 
2.23.0
