From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 10:20:31 -0300
Subject: [Buildroot] [PATCH 08/17] linux-zigbee: add comment mmu depends
In-Reply-To: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1407158440-26783-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-zigbee/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-zigbee/Config.in b/package/linux-zigbee/Config.in
index 555e859..fc21faa 100644
--- a/package/linux-zigbee/Config.in
+++ b/package/linux-zigbee/Config.in
@@ -1,5 +1,6 @@
 comment "linux-zigbee needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_LINUX_ZIGBEE
 	bool "linux-zigbee"
-- 
1.8.5.5
