From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Feb 2015 21:27:29 +0100
Subject: [Buildroot] [git commit] odhcp6c: uses fork(), needs mmu
Message-ID: <20150203202754.4B0E7800B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ffcc859ae72f074aeb0c514a5ad37fe92e663c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/odhcp6c/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/odhcp6c/Config.in b/package/odhcp6c/Config.in
index 92de0e5..9e5f3ef 100644
--- a/package/odhcp6c/Config.in
+++ b/package/odhcp6c/Config.in
@@ -1,9 +1,11 @@
 comment "odhcp6c needs a toolchain w/ IPv6"
 	depends on !BR2_INET_IPV6
+	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_ODHCP6C
 	bool "odhcp6c"
 	depends on BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
 	help
 	  odhcp6c is a minimal DHCPv6 and RA-client for use in embedded Linux
 	  systems, especially routers.
