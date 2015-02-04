From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  4 Feb 2015 01:34:10 +0100
Subject: [Buildroot] [PATCH 12/21] util-linux: add missing indirect
	dependency on !avr32 for setpriv
In-Reply-To: <1423010059-23446-1-git-send-email-arnout@mind.be>
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
Message-ID: <1423010059-23446-13-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/util-linux/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 78648c1..a6719f3 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -215,6 +215,7 @@ config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 
 config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 	bool "setpriv"
+	depends on !BR2_avr32 # libcap-ng
 	select BR2_PACKAGE_LIBCAP_NG
 	help
 	  Run a program with different Linux privilege settings
-- 
2.1.4
