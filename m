From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Oct 2013 18:30:42 -0300
Subject: [Buildroot] [PATCH 4/8] oprofile: needs mmu
In-Reply-To: <1381354246-29140-1-git-send-email-gustavo@zacarias.com.ar>
References: <1381354246-29140-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1381354246-29140-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/oprofile/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 0fbc87c..0d43782 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPROFILE
 	bool "oprofile"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_BINUTILS
 	select BR2_PACKAGE_LIBPFM4 if BR2_powerpc
-- 
1.8.1.5
