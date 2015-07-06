From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Jul 2015 11:01:51 -0300
Subject: [Buildroot] [PATCH] libsigsegv: unavailable for powerpc with uclibc
Message-ID: <1436191311-23939-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/c5f/c5fef9a89f99e13de9cabe52c2ac1602d85974fe/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsigsegv/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index 2ca9a28..35f6d67 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -3,7 +3,12 @@ config BR2_PACKAGE_LIBSIGSEGV
 	depends on !BR2_xtensa
 	depends on !BR2_arc # no ucontext_i.sym file
 	depends on !BR2_microblaze
+	# No ucontext support in uclibc for powerpc
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC)
 	help
 	  Library for handling page faults in user mode.
 
 	  http://libsigsegv.sourceforge.net/
+
+comment "libsigsegv needs an (e)glibc toolchain"
+	depends on BR2_powerpc && BR2_TOOLCHAIN_USES_UCLIBC
-- 
2.3.6
