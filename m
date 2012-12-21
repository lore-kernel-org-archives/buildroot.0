From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 21 Dec 2012 09:48:32 -0300
Subject: [Buildroot] [PATCH] dstat: needs mmu
Message-ID: <1356094112-1545-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Because python needs MMU, fixes:
http://autobuild.buildroot.net/results/7bb46ed3ffb46741b7cb7e3edd33f4729409b2ef/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dstat/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/dstat/Config.in b/package/dstat/Config.in
index 1439c8b..5b8df23 100644
--- a/package/dstat/Config.in
+++ b/package/dstat/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DSTAT
 	bool "dstat"
 	depends on BR2_USE_WCHAR # python
+	depends on BR2_USE_MMU # python
 	select BR2_PACKAGE_PYTHON
 	help
 	  Dstat, written in Python, is a versatile replacement for vmstat,
-- 
1.7.8.6
