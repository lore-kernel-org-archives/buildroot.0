From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Dec 2019 21:04:48 +0100
Subject: [Buildroot] [git commit] package/openpowerlink: drop bogus select
Message-ID: <20191213195656.A5B508A4EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76a6f1285d270b46ee79ce67a5a006cacd53b2ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no option BR2_PACKAGE_OPENPOWERLINK_PCAP_DAEMON, and we never
had any option named like this, so it seems like a leftover from
previous iterations of the openpowerlink patch series. Since the
option does not exist, the select doesn't do anything, and we can
simply drop it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
