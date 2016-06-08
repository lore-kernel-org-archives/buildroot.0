From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 07:56:35 +0200
Subject: [Buildroot] [git commit] package/boost: Add Kconfig option for new
	module metaparse
Message-ID: <20160608055647.A08E3801DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f223c19f930d0f7998b41e30fa2ee3035fcfdc4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The module description can be found in the release notes of v1.61.0:
http://www.boost.org/users/history/version_1_61_0.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
