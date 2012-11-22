From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 Nov 2012 06:46:35 -0300
Subject: [Buildroot] [PATCH] arptables: needs mmu
Message-ID: <1353577595-23602-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

arptables uses fork() and breaks on !mmu.
Fixes
http://autobuild.buildroot.net/results/fe18dd4a0b0d17404560abf3e4a332b58751f5cb/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/arptables/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/arptables/Config.in b/package/arptables/Config.in
index 510eedf..414fabb 100644
--- a/package/arptables/Config.in
+++ b/package/arptables/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_ARPTABLES
 	bool "arptables"
+	# needs fork()
+	depends on BR2_USE_MMU
 	help
 	  Tool to set up, maintain, and inspect the tables of ARP rules.
 
-- 
1.7.8.6
