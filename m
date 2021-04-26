From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 26 Apr 2021 21:00:37 +0200
Subject: [Buildroot] [PATCH 1/2] Revert "package/domoticz: drop boost
 date-time dependency"
Message-ID: <20210426190038.512101-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 4b4d98e2c5165c3121e670192970fc909cae6d8a as
Boost::date_time is still used by domoticz (in pmain/Scheduler.cpp and
push/BasePush.cpp)

Fixes:
 - http://autobuild.buildroot.org/results/493a2e93fe6121f118293a268f986ee51009b7e8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index f9672056ee..83ae2035b2 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_CEREAL
-- 
2.30.2
