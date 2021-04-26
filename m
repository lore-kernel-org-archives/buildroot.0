From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:06:01 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] Revert "package/domoticz:
 drop boost date-time dependency"
Message-ID: <20210426205011.A7B3F864E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=312818c6d0a3744b78426034d10711f9d348c7f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This reverts commit 4b4d98e2c5165c3121e670192970fc909cae6d8a as
Boost::date_time is still used by domoticz (in pmain/Scheduler.cpp and
push/BasePush.cpp)

Fixes:
 - http://autobuild.buildroot.org/results/493a2e93fe6121f118293a268f986ee51009b7e8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 49b6578f8857340b38cefd14d77fbe621557a57b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/domoticz/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 4d1a7f9289..88de232642 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_JSONCPP
