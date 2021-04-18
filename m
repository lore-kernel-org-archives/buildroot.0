From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Apr 2021 22:07:30 +0200
Subject: [Buildroot] [PATCH 2/2] package/domoticz: drop boost date-time
 dependency
In-Reply-To: <20210418200730.3474374-1-fontaine.fabrice@gmail.com>
References: <20210418200730.3474374-1-fontaine.fabrice@gmail.com>
Message-ID: <20210418200730.3474374-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

boost date-time is not a dependency since version 4.9700 and
https://github.com/domoticz/domoticz/commit/a3eacbc987b59dd4aa73ada24a0a6e9a0d27b740

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.30.2
