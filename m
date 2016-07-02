From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  2 Jul 2016 16:32:29 +0200
Subject: [Buildroot] [PATCH 1/2] package/boost: boost-local needs NTPL
	threads
Message-ID: <1467469950-11984-1-git-send-email-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since Boost 1.61.0 boost-local require a toolchain with NTPL threads
support.

Fixes:
http://autobuild.buildroot.net/results/52c/52c198457c6a7a0a73766e8b8bed8d70997b80c0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/boost/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 0cc9a58..d47bb40 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -98,8 +98,12 @@ config BR2_PACKAGE_BOOST_IOSTREAMS
 
 config BR2_PACKAGE_BOOST_LOCALE
 	bool "boost-locale"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 
+comment "boost-locale needs a toolchain w/ NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.5.5
