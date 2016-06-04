From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jun 2016 15:17:37 +0200
Subject: [Buildroot] [PATCH 2/2] package/boost: Add Kconfig option for new
	module metaparse
In-Reply-To: <1465046257-16270-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465046257-16270-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465046257-16270-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The module description can be found in the release notes of v1.61.0:
http://www.boost.org/users/history/version_1_61_0.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/boost/Config.in | 3 +++
 package/boost/boost.mk  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 4cfd44e..fae4b5f 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -114,6 +114,9 @@ comment "boost-log needs a toolchain w/ NPTL"
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
 
+config BR2_PACKAGE_BOOST_METAPARSE
+	bool "boost-metaparse"
+
 config BR2_PACKAGE_BOOST_MPI
 	bool "boost-mpi"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index e6459b9..fc89265 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -35,6 +35,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_IOSTREAMS),,iostreams)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOCALE),,locale)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_METAPARSE),,metaparse)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
-- 
2.8.1
