From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 25 Jan 2014 21:49:11 +0200
Subject: [Buildroot] [PATCH] poco: fix nios2 fenv build failure
Message-ID: <586913635fccc46b2eecfb9af23e6a8007f6d94f.1390679351.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable FP environment on nios2.

Fixes:
http://autobuild.buildroot.net/results/3ce/3ce9d6dc5c4e8fceebaa461e5085da7f33fda8a1/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/poco/poco.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 3516c04455b3..b6acfe280a51 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -34,8 +34,8 @@ ifeq ($(LIBC),uclibc)
 POCO_CONF_OPT += --no-fpenvironment --no-wstring
 endif
 
-# sh4a is missing FE_DOWNWARD and FE_UPWARD in its fenv.h
-ifeq ($(BR2_sh4a),y)
+# architectures missing some FE_* in their fenv.h
+ifeq ($(BR2_sh4a)$(BR2_nios2),y)
 POCO_CONF_OPT += --no-fpenvironment
 endif
 
-- 
1.8.5.2
