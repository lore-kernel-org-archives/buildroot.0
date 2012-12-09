From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  9 Dec 2012 11:13:27 -0300
Subject: [Buildroot] [PATCH] bmon: needs mmu
Message-ID: <1355062407-19173-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/673b0e9a1ba75123ba2c59df8ad81550170fffef

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
 
-- 
1.7.8.6
