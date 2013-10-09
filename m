From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 17:25:48 -0300
Subject: [Buildroot] [PATCH 7/7] ngircd: needs mmu
In-Reply-To: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381350348-25751-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ngircd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ngircd/Config.in b/package/ngircd/Config.in
index e8fc3d0..f1d8bea 100644
--- a/package/ngircd/Config.in
+++ b/package/ngircd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NGIRCD
 	bool "ngircd"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
 	help
 	  Next Generation IRC server deamon.
-- 
1.8.1.5
