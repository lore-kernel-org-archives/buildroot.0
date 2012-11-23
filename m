From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 23 Nov 2012 09:55:58 +0100
Subject: [Buildroot] [git commit] arptables: needs mmu
Message-ID: <20121123091455.E6C7181E9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8fd455921296751f142c655b013f602a6522fa8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

arptables uses fork() and breaks on !mmu.
Fixes
http://autobuild.buildroot.net/results/fe18dd4a0b0d17404560abf3e4a332b58751f5cb/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
