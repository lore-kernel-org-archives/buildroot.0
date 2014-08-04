From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 10:20:26 -0300
Subject: [Buildroot] [PATCH 03/17] fio: add comment mmu depends
In-Reply-To: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1407158440-26783-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fio/Config.in b/package/fio/Config.in
index 6c1b6cb..8cbbf6c 100644
--- a/package/fio/Config.in
+++ b/package/fio/Config.in
@@ -23,3 +23,4 @@ config BR2_PACKAGE_FIO
 comment "fio needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_nios2
+	depends on BR2_USE_MMU
-- 
1.8.5.5
