From: Romain Naour <romain.naour@openwide.fr>
Date: Thu,  9 Apr 2015 23:54:53 +0200
Subject: [Buildroot] [PATCH v2] package/boost: boost-log needs NPTL threads
Message-ID: <1428616493-18162-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
[xtensa]
http://autobuild.buildroot.net/results/664/6642dc9c569b2820a9d0e273fc2fb1d5a635ba0a
[arc]
http://autobuild.buildroot.net/results/ba5/ba5836e9a77e1b48e24ace46ca1611c22524261d
[bfin]
http://autobuild.buildroot.net/results/8cd/8cdac9cc67394aaae09ee816a9adddec762e3bd0

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: add comment when !BR2_TOOLCHAIN_HAS_THREADS_NPTL
    fix the typo "depends on"
---
 package/boost/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 65bf605..5444c42 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -89,6 +89,10 @@ comment "boost-locale needs a toolchain w/ wchar"
 
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
+comment "boost-log needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
-- 
1.9.3
