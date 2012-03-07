From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed,  7 Mar 2012 23:38:18 +0100
Subject: [Buildroot] [PATCH 2/2] mrouted: select
	BR2_TOOLCHAIN_BUILDROOT_INET_ADDRCONFIG
In-Reply-To: <1331159898-25350-1-git-send-email-s.neumann@raumfeld.com>
References: <1331159898-25350-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1331159898-25350-3-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the comment that explains that UCLIBC_SUPPORT_AI_ADDRCONFIG
needs to be selected and select it automatically by means of the
new BR2_TOOLCHAIN_BUILDROOT_INET_ADDRCONFIG option.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/mrouted/Config.in |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/mrouted/Config.in b/package/mrouted/Config.in
index 1503cc6..ba68fbb 100644
--- a/package/mrouted/Config.in
+++ b/package/mrouted/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_MROUTED
 	bool "mrouted"
+	select BR2_TOOLCHAIN_BUILDROOT_INET_ADDRCONFIG
 	help
 	  An implementation of the DVMRP multicast routing protocol.
 
-	  If built with uClibc, then UCLIBC_SUPPORT_AI_ADDRCONFIG is
-	  needed in uClibc configuration.
-
 	  http://github.com/troglobit/mrouted
-- 
1.7.5.4
