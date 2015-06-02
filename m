From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Jun 2015 14:52:13 -0300
Subject: [Buildroot] [PATCH 2/3] build: remove deprecated sstrip option
In-Reply-To: <1433267534-12710-1-git-send-email-gustavo@zacarias.com.ar>
References: <1433267534-12710-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1433267534-12710-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's been deprecated since the 2014.05 release (a year).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Config.in b/Config.in
index bdff7df..eaf47dd 100644
--- a/Config.in
+++ b/Config.in
@@ -372,19 +372,6 @@ config BR2_STRIP_strip
 	  symbols on the target are needed for native debugging, but
 	  not when remote debugging is used.
 
-config BR2_STRIP_sstrip
-	bool "sstrip"
-	select BR2_PACKAGE_SSTRIP_HOST
-	depends on !BR2_PACKAGE_HOST_ELF2FLT
-	depends on BR2_DEPRECATED_SINCE_2014_05
-	help
-	  Binaries and libraries in the target filesystem will be
-	  stripped using the 'sstrip' command, which strips a little
-	  bit more than the traditional 'strip' command. This allows to
-	  save space, mainly by removing debugging symbols. Debugging
-	  symbols on the target are needed for native debugging, but
-	  not when remote debugging is used.
-
 config BR2_STRIP_none
 	bool "none"
 	help
-- 
2.3.6
