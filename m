From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 24 Oct 2017 10:17:09 +0200
Subject: [Buildroot] [PATCH] boost: add stacktrace module
Message-ID: <20171024081709.9445-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The stacktrace module was added in version 1.65.0. Without having a config
option for the module, it is build unconditionally.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/boost/Config.in | 3 +++
 package/boost/boost.mk  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 37a7e7339f..1ee5821ee1 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -158,6 +158,9 @@ config BR2_PACKAGE_BOOST_SERIALIZATION
 config BR2_PACKAGE_BOOST_SIGNALS
 	bool "boost-signals"
 
+config BR2_PACKAGE_BOOST_STACKTRACE
+	bool "boost-stacktrace"
+
 config BR2_PACKAGE_BOOST_SYSTEM
 	bool "boost-system"
 
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 0fd6c4d0de..750b40f7d2 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -42,6 +42,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_REGEX),,regex)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SERIALIZATION),,serialization)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SIGNALS),,signals)
+BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_STACKTRACE),,stacktrace)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SYSTEM),,system)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TEST),,test)
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_THREAD),,thread)
-- 
2.14.2
