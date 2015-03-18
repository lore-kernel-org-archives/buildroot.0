From: Sonic Zhang <sonic.adi@gmail.com>
Date: Wed, 18 Mar 2015 16:59:15 +0800
Subject: [Buildroot] [PATCH 1/2] bfin: remove the dependency of flat shared
	mode to shared library
Message-ID: <1426669156-24250-1-git-send-email-sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Blackfin flat shared library isn't generated and linked in the same way
as the ELF shared library. So, don't mark it depend on the static library
only.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 arch/Config.in |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index 16ad8be..6179960 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -295,7 +295,6 @@ config BR2_BINFMT_FLAT_SEP_DATA
 
 config BR2_BINFMT_FLAT_SHARED
 	bool "Shared binary"
-	select BR2_BINFMT_SUPPORTS_SHARED
 	help
 	  Allow to load and link indiviual FLAT binaries at run time.
 
-- 
1.7.9.5
