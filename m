From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 09:29:25 +0200
Subject: [Buildroot] [git commit] speex: adjust ARM optimizations
Message-ID: <20130411081132.A8B6D9B561@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6a4227bd83e619385ad12c31ae124a55dbe7a61
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer support ARM less than v4 so drop the generic asm option.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/speex/Config.in |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

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
 
