From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 10:20:24 -0300
Subject: [Buildroot] [PATCH 01/17] argus: add comment mmu depends
Message-ID: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/argus/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/argus/Config.in b/package/argus/Config.in
index fe28c77..6d47734 100644
--- a/package/argus/Config.in
+++ b/package/argus/Config.in
@@ -12,3 +12,4 @@ config BR2_PACKAGE_ARGUS
 
 comment "argus needs a toolchain w/ threads, IPv6"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS && BR2_INET_IPV6)
+	depends on BR2_USE_MMU
-- 
1.8.5.5
