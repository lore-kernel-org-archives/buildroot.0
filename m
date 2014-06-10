From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jun 2014 23:01:32 +0200
Subject: [Buildroot] [PATCH 2/2] znc: not available on !MMU systems,
	uses fork()
In-Reply-To: <1402434092-25323-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1402434092-25323-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1402434092-25323-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/znc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/znc/Config.in b/package/znc/Config.in
index c055f9f..274e537 100644
--- a/package/znc/Config.in
+++ b/package/znc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_ZNC
 	bool "znc"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	help
 	  Advanced IRC bouncer
 
@@ -8,3 +9,4 @@ config BR2_PACKAGE_ZNC
 
 comment "znc needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU
-- 
2.0.0
