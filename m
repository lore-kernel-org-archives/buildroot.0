From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 22:33:55 +0200
Subject: [Buildroot] [git commit] package/domoticz: drop boost date-time
 dependency
Message-ID: <20210419200724.167A77FDD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b4d98e2c5165c3121e670192970fc909cae6d8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

boost date-time is not a dependency since version 4.9700 and
https://github.com/domoticz/domoticz/commit/a3eacbc987b59dd4aa73ada24a0a6e9a0d27b740

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/domoticz/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 88de232642..4d1a7f9289 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_JSONCPP
