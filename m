From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:44 -0000
Subject: [Buildroot] [git commit] package/libcpprestsdk: bump version to
 2.10.5
Message-ID: <20180907111542.2150D7FCAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7ab217dc5ee45d574ef89301aa79403e244f7b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-fix-template-whitespace-syntax.patch      | 75 ----------------------
 package/libcpprestsdk/libcpprestsdk.hash           |  2 +-
 package/libcpprestsdk/libcpprestsdk.mk             |  2 +-
 3 files changed, 2 insertions(+), 77 deletions(-)

diff --git a/package/libcpprestsdk/0002-fix-template-whitespace-syntax.patch b/package/libcpprestsdk/0002-fix-template-whitespace-syntax.patch
deleted file mode 100644
index 81f7ea19ec..0000000000
--- a/package/libcpprestsdk/0002-fix-template-whitespace-syntax.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 546e89a29a82cc4f7de6c99be5a07221aa7443df Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Fri, 9 Mar 2018 08:09:52 -0500
-Subject: [PATCH] fix template whitespace syntax
-
-Some files don't have a space inbetween the '<' and '::' charachters, which
-will cause build failures on older toolchains. Adding a space inbetween these
-two characters fixes the issue.
-
-upstream-status: pending
-https://github.com/Microsoft/cpprestsdk/pull/715
-
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- Release/include/cpprest/details/web_utilities.h | 2 +-
- Release/include/cpprest/http_client.h           | 2 +-
- Release/include/cpprest/json.h                  | 2 +-
- Release/include/cpprest/ws_client.h             | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Release/include/cpprest/details/web_utilities.h b/Release/include/cpprest/details/web_utilities.h
-index ba641654..9855c315 100644
---- a/Release/include/cpprest/details/web_utilities.h
-+++ b/Release/include/cpprest/details/web_utilities.h
-@@ -33,7 +33,7 @@ class zero_memory_deleter
- public:
-     _ASYNCRTIMP void operator()(::utility::string_t *data) const;
- };
--typedef std::unique_ptr<::utility::string_t, zero_memory_deleter> plaintext_string;
-+typedef std::unique_ptr< ::utility::string_t, zero_memory_deleter> plaintext_string;
- 
- #if defined(_WIN32) && !defined(CPPREST_TARGET_XP)
- #if defined(__cplusplus_winrt)
-diff --git a/Release/include/cpprest/http_client.h b/Release/include/cpprest/http_client.h
-index a936a23e..f5ad8fac 100644
---- a/Release/include/cpprest/http_client.h
-+++ b/Release/include/cpprest/http_client.h
-@@ -757,7 +757,7 @@ public:
- 
- private:
- 
--    std::shared_ptr<::web::http::client::http_pipeline> m_pipeline;
-+    std::shared_ptr< ::web::http::client::http_pipeline> m_pipeline;
- };
- 
- namespace details {
-diff --git a/Release/include/cpprest/json.h b/Release/include/cpprest/json.h
-index 07c54502..dfdeead4 100644
---- a/Release/include/cpprest/json.h
-+++ b/Release/include/cpprest/json.h
-@@ -301,7 +301,7 @@ public:
-         /// <param name="fields">Field names associated with JSON values</param>
-         /// <param name="keep_order">Whether to preserve the original order of the fields</param>
-         /// <returns>A non-empty JSON object value</returns>
--        static _ASYNCRTIMP json::value __cdecl object(std::vector<std::pair<::utility::string_t, value>> fields, bool keep_order = false);
-+        static _ASYNCRTIMP json::value __cdecl object(std::vector<std::pair< ::utility::string_t, value>> fields, bool keep_order = false);
- 
-         /// <summary>
-         /// Creates an empty JSON array
-diff --git a/Release/include/cpprest/ws_client.h b/Release/include/cpprest/ws_client.h
-index 9a324cde..98f933e1 100644
---- a/Release/include/cpprest/ws_client.h
-+++ b/Release/include/cpprest/ws_client.h
-@@ -184,7 +184,7 @@ public:
-     /// <returns>Vector of all the subprotocols </returns>
-     /// <remarks>If you want all the subprotocols in a comma separated string
-     /// they can be directly looked up in the headers using 'Sec-WebSocket-Protocol'.</remarks>
--    _ASYNCRTIMP std::vector<::utility::string_t> subprotocols() const;
-+    _ASYNCRTIMP std::vector< ::utility::string_t> subprotocols() const;
- 	
-     /// <summary>
-     /// Gets the server certificate validation property.
--- 
-2.14.3
-
diff --git a/package/libcpprestsdk/libcpprestsdk.hash b/package/libcpprestsdk/libcpprestsdk.hash
index 20a9395329..b8c5d5430e 100644
--- a/package/libcpprestsdk/libcpprestsdk.hash
+++ b/package/libcpprestsdk/libcpprestsdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 fb0b611007732d8de9528bc37bd67468e7ef371672f89c88f225f73cdc4ffcf1	libcpprestsdk-v2.10.2.tar.gz
+sha256 cf4d57bdcc1ce53f1d228156620dd87af95cbff109d85c81e8be01d0bb58fd25	libcpprestsdk-v2.10.5.tar.gz
 sha256 5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97	license.txt
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index 20700ae2b2..14526e7de4 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCPPRESTSDK_VERSION = v2.10.2
+LIBCPPRESTSDK_VERSION = v2.10.5
 LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,$(LIBCPPRESTSDK_VERSION))
 LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
