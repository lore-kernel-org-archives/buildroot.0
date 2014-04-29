From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Apr 2014 09:40:38 -0300
Subject: [Buildroot] [PATCH] samba4: disable for avr32
Message-ID: <1398775238-9054-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The toolchain is not up to the task, fixes:
http://autobuild.buildroot.net/results/21f/21f5fd1fc8415abff1d1178843586956ef1fd1e3/
Also AVR32s are low on resources (RAM, no proper storage port, most of
them short of flash) to handle it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index c9a4712..77a46cd 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_SAMBA4
 	depends on BR2_USE_WCHAR # e2fsprogs
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # talloc python threads
+	depends on !BR2_avr32 # bad toolchain
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_PYTHON
-- 
1.8.3.2
