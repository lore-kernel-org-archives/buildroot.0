From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 20:08:47 +0200
Subject: [Buildroot] [git commit] dhcp: needs MMU
Message-ID: <20120506180941.7639F8F738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87657aaabc9d67f642ac668dcd08a20ee3e826f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dhcp/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index 2245839..38cf007 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_DHCP
 	bool "isc dhcp"
+	# fork()
+	depends on BR2_USE_MMU
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
 
