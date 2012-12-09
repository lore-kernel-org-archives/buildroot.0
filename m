From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Dec 2012 21:35:49 +0100
Subject: [Buildroot] [git commit] bmon: needs mmu
Message-ID: <20121209203934.117F199B0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=941963d258cac48f06c1be49169d81645c5e505c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/673b0e9a1ba75123ba2c59df8ad81550170fffef

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bmon/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/bmon/Config.in b/package/bmon/Config.in
index 9692118..61d72f0 100644
--- a/package/bmon/Config.in
+++ b/package/bmon/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_BMON
 	bool "bmon"
 	depends on BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
 	help
 	  Linux bandwidth monitor
 
