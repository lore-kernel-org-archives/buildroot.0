From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Apr 2013 14:29:47 -0300
Subject: [Buildroot] [PATCH 3/4] speex: adjust ARM optimizations
In-Reply-To: <1365096588-1932-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365096588-1932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365096588-1932-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We no longer support ARM less than v4 so drop the generic asm option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/speex/Config.in | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/speex/Config.in b/package/speex/Config.in
index 424a830..7e87566 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -8,18 +8,13 @@ config BR2_PACKAGE_SPEEX
 
 	  http://www.speex.org/
 
-config BR2_PACKAGE_SPEEX_ARM_GENERIC
-       bool
-       default y
-       depends on BR2_PACKAGE_SPEEX && (BR2_generic_arm || BR2_arm610 || BR2_arm710)
-
 config BR2_PACKAGE_SPEEX_ARM4
        bool
        default y
-       depends on BR2_PACKAGE_SPEEX && (BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_sa110 || BR2_sa1100)
+       depends on BR2_PACKAGE_SPEEX && (BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_strongarm || BR2_fa526)
 
 config BR2_PACKAGE_SPEEX_ARM5E
 	default y
 	bool
-	depends on BR2_PACKAGE_SPEEX && BR2_arm && !(BR2_PACKAGE_SPEEX_ARM_GENERIC || BR2_PACKAGE_SPEEX_ARM4)
+	depends on BR2_PACKAGE_SPEEX && BR2_arm && !BR2_PACKAGE_SPEEX_ARM4
 
-- 
1.8.1.5
