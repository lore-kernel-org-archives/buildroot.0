From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 14 Nov 2014 20:25:21 -0300
Subject: [Buildroot] [PATCH] iputils: fix openssl select
Message-ID: <1416007521-10316-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's BR2_PACKAGE_OPENSSL, not BR2_OPENSSL... oops!

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iputils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index 456fddf..e9221ad 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_IPUTILS
 	bool "iputils"
-	select BR2_OPENSSL if BR2_INET_IPV6
+	select BR2_PACKAGE_OPENSSL if BR2_INET_IPV6
 	depends on BR2_USE_MMU # fork()
 	# requires dn_comp (only available in since uclibc 0.9.33)
 	depends on !BR2_avr32
-- 
2.0.4
