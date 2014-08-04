From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 10:20:29 -0300
Subject: [Buildroot] [PATCH 06/17] libgail: add comment mmu depends
In-Reply-To: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1407158440-26783-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgail/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgail/Config.in b/package/libgail/Config.in
index e997532..512f228 100644
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -23,3 +23,4 @@ config BR2_PACKAGE_LIBGAIL
 comment "libgail needs a toolchain w/ wchar, threads"
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
-- 
1.8.5.5
