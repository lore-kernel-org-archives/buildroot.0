From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 23:56:46 +0100
Subject: [Buildroot] [PATCH 1/2] package/monkey: fix musl build
Message-ID: <1453589807-4373-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/f69/f690cb1efece8a47fccdf3e782bbde4d1b2cd6b3/
http://autobuild.buildroot.net/results/21b/21b6fa8b2586f318ff071085f2b204bd555b425b/
http://autobuild.buildroot.net/results/0bf/0bf7a83a4ccbbcb3ff181ac962e6fdd0099a19f1/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/monkey/monkey.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 67c8f35..02c26c9 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -30,7 +30,7 @@ MONKEY_CONF_OPTS += --uclib-mode --no-backtrace
 endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-MONKEY_CONF_OPTS += --musl-mode
+MONKEY_CONF_OPTS += --musl-mode --no-backtrace
 endif
 
 ifeq ($(BR2_PACKAGE_MONKEY_SHARED),y)
-- 
2.7.0.rc3
