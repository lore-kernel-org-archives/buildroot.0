From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Sep 2012 21:27:42 +0200
Subject: [Buildroot] [PATCH v4] external-toolchain:
	BR2_TOOLCHAIN_EXTERNAL_GLIBC includes eglibc
Message-ID: <1348774062-23946-1-git-send-email-baruch@tkos.co.il>
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
v4: now actually commit the rephrased text.

v3: rephrase the help text to make it clear that the eglibc build is given,
    address the comment of Thomas Petazzoni.

v2: mention in the help text that eglibc may lack some features as suggested
    by Yann E. MORIN.

 toolchain/toolchain-external/Config.in |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f86ed74..cd56443 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -664,8 +664,13 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
-	bool "glibc"
+	bool "glibc/eglibc"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	help
+	  Note: eglibc is a variant of glibc that (among other things) can be
+	  configured to exclude some of its features. Using a toolchain with
+	  eglibc configured to exclude key features may cause build failures to
+	  some packages.
 
 endchoice
 
-- 
1.7.10.4
