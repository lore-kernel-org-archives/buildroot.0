From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu,  6 Jul 2017 23:22:41 -0300
Subject: [Buildroot] [PATCH 6/7] sudo: use
	BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
In-Reply-To: <20170707022242.20128-1-casantos@datacom.ind.br>
References: <20170707022242.20128-1-casantos@datacom.ind.br>
Message-ID: <20170707022242.20128-7-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not repeat linux-pam dependencies.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/sudo/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/sudo/Config.in b/package/sudo/Config.in
index cbef15d..a604848 100644
--- a/package/sudo/Config.in
+++ b/package/sudo/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SUDO
 	bool "sudo"
-	# uses fork()
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
+	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Sudo is a program designed to allow a sysadmin to give
 	  limited root privileges to users and log root activity. The
@@ -9,3 +9,6 @@ config BR2_PACKAGE_SUDO
 	  but still allow people to get their work done.
 
 	  http://www.sudo.ws/sudo/
+
+comment "sudo needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+	depends on !BR2_PACKAGE_LINUX_PAM_ARCH_SUPPORTS
-- 
2.9.4
