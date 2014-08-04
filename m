From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 10:20:32 -0300
Subject: [Buildroot] [PATCH 09/17] modem-manager: add comment mmu depends
In-Reply-To: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1407158440-26783-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/modem-manager/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/modem-manager/Config.in b/package/modem-manager/Config.in
index fe60850..7768f1f 100644
--- a/package/modem-manager/Config.in
+++ b/package/modem-manager/Config.in
@@ -32,3 +32,4 @@ endif
 comment "modemmanager needs udev /dev management and a toolchain w/ largefile, wchar, threads, IPv6"
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_HAS_UDEV
+	depends on BR2_USE_MMU
-- 
1.8.5.5
