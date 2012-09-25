From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 25 Sep 2012 05:49:53 +0200
Subject: [Buildroot] [PATCH] external-toolchain:
	BR2_TOOLCHAIN_EXTERNAL_GLIBC includes eglibc
Message-ID: <1348544993-5682-1-git-send-email-baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN says:

    "Although eglibc can be configured to include/exclude parts of the
    features, it seems to not be in wide use, if at all."

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 toolchain/toolchain-external/Config.in |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f86ed74..f7a84b2 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -664,8 +664,12 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
-	bool "glibc"
+	bool "glibc/eglibc"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Note: eglibc is a variant of glibc that (among other things) can be
+	  configured to exclude parts of its features. This capability is 
+	  currently not supported.
 
 endchoice
 
-- 
1.7.10.4
