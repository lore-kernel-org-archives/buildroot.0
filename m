From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 07:59:01 -0300
Subject: [Buildroot] [PATCH 2/2] vsftpd: needs mmu
In-Reply-To: <1356692341-26066-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356692341-26066-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356692341-26066-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/067cfbab9fa26e9e5f321f661e8f4ac0e19249e1

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vsftpd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/vsftpd/Config.in b/package/vsftpd/Config.in
index 8414c88..3d4cff1 100644
--- a/package/vsftpd/Config.in
+++ b/package/vsftpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_VSFTPD
 	bool "vsftpd"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # fork()
 	help
 	  vsftpd is an ftp daemon written with security in mind.
 	  http://vsftpd.beasts.org/
-- 
1.7.8.6
