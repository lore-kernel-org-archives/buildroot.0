From: root <thiago.correa@gmail.com>
Date: Wed, 13 May 2009 18:43:26 -0300
Subject: [Buildroot] [PATCH] CUPS requires stack protection support
In-Reply-To: <1242251013-25228-3-git-send-email-thiago.correa@gmail.com>
References: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-3-git-send-email-thiago.correa@gmail.com>
Message-ID: <1242251013-25228-4-git-send-email-thiago.correa@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
---
 package/cups/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/cups/Config.in b/package/cups/Config.in
index 8b1f8a5..27611e1 100644
--- a/package/cups/Config.in
+++ b/package/cups/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_CUPS
 	bool "cups"
+	depends on BR2_USE_SSP
 	help
 	  The Common Unix Printing System
 
 	  http://www.cups.org
+
+comment "cups requires a toolchain with Stack Protection support"
+	depends on !BR2_USE_SSP
-- 
1.6.0.6
