From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  4 Aug 2014 10:20:37 -0300
Subject: [Buildroot] [PATCH 14/17] squashfs: add comment mmu depends
In-Reply-To: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1407158440-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1407158440-26783-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/squashfs/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
index 79ebf57..6dd65e3 100644
--- a/package/squashfs/Config.in
+++ b/package/squashfs/Config.in
@@ -46,3 +46,4 @@ endif
 
 comment "squashfs needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
-- 
1.8.5.5
