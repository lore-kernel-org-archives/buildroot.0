From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  9 Mar 2018 08:18:16 -0500
Subject: [Buildroot] [PATCH 1/1] libcpprestsdk: fix template
 whitespace-syntax
Message-ID: <20180309131816.32466-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

some files don't have a space inbetween the '<' and '::' charachters, which
will cause build failures on older toolchains. Adding a space inbetween these
two characters fixes the issue.

upstream-status: pending
https://github.com/Microsoft/cpprestsdk/pull/715

fixes:
http://autobuild.buildroot.net/results/797a9b5fdf6ab0f16f2249324b48292dfab61d9f
Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 .../0002-fix-template-whitespace-syntax.patch      | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 package/libcpprestsdk/0002-fix-template-whitespace-syntax.patch

diff --git a/package/libcpprestsdk/0002-fix-template-whitespace-syntax.patch b/package/libcpprestsdk/0002-fix-template-whitespace-syntax.patch
new file mode 100644
index 0000000000..81f7ea19ec
--- /dev/null
+++ b/package/libcpprestsdk/0002-fix-template-whitespace-syntax.patch
@@ -0,0 +1,75 @@
+From 546e89a29a82cc4f7de6c99be5a07221aa7443df Mon Sep 17 00:00:00 2001
+From: Adam Duskett <aduskett@gmail.com>
+Date: Fri, 9 Mar 2018 08:09:52 -0500
+Subject: [PATCH] fix template whitespace syntax
+
+Some files don't have a space inbetween the '<' and '::' charachters, which
+will cause build failures on older toolchains. Adding a space inbetween these
+two characters fixes the issue.
+
+upstream-status: pending
+https://github.com/Microsoft/cpprestsdk/pull/715
+
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ Release/include/cpprest/details/web_utilities.h | 2 +-
+ Release/include/cpprest/http_client.h           | 2 +-
+ Release/include/cpprest/json.h                  | 2 +-
+ Release/include/cpprest/ws_client.h             | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Release/include/cpprest/details/web_utilities.h b/Release/include/cpprest/details/web_utilities.h
+index ba641654..9855c315 100644
+--- a/Release/include/cpprest/details/web_utilities.h
++++ b/Release/include/cpprest/details/web_utilities.h
+@@ -33,7 +33,7 @@ class zero_memory_deleter
+ public:
+     _ASYNCRTIMP void operator()(::utility::string_t *data) const;
+ };
+-typedef std::unique_ptr<::utility::string_t, zero_memory_deleter> plaintext_string;
++typedef std::unique_ptr< ::utility::string_t, zero_memory_deleter> plaintext_string;
+ 
+ #if defined(_WIN32) && !defined(CPPREST_TARGET_XP)
+ #if defined(__cplusplus_winrt)
+diff --git a/Release/include/cpprest/http_client.h b/Release/include/cpprest/http_client.h
+index a936a23e..f5ad8fac 100644
+--- a/Release/include/cpprest/http_client.h
++++ b/Release/include/cpprest/http_client.h
+@@ -757,7 +757,7 @@ public:
+ 
+ private:
+ 
+-    std::shared_ptr<::web::http::client::http_pipeline> m_pipeline;
++    std::shared_ptr< ::web::http::client::http_pipeline> m_pipeline;
+ };
+ 
+ namespace details {
+diff --git a/Release/include/cpprest/json.h b/Release/include/cpprest/json.h
+index 07c54502..dfdeead4 100644
+--- a/Release/include/cpprest/json.h
++++ b/Release/include/cpprest/json.h
+@@ -301,7 +301,7 @@ public:
+         /// <param name="fields">Field names associated with JSON values</param>
+         /// <param name="keep_order">Whether to preserve the original order of the fields</param>
+         /// <returns>A non-empty JSON object value</returns>
+-        static _ASYNCRTIMP json::value __cdecl object(std::vector<std::pair<::utility::string_t, value>> fields, bool keep_order = false);
++        static _ASYNCRTIMP json::value __cdecl object(std::vector<std::pair< ::utility::string_t, value>> fields, bool keep_order = false);
+ 
+         /// <summary>
+         /// Creates an empty JSON array
+diff --git a/Release/include/cpprest/ws_client.h b/Release/include/cpprest/ws_client.h
+index 9a324cde..98f933e1 100644
+--- a/Release/include/cpprest/ws_client.h
++++ b/Release/include/cpprest/ws_client.h
+@@ -184,7 +184,7 @@ public:
+     /// <returns>Vector of all the subprotocols </returns>
+     /// <remarks>If you want all the subprotocols in a comma separated string
+     /// they can be directly looked up in the headers using 'Sec-WebSocket-Protocol'.</remarks>
+-    _ASYNCRTIMP std::vector<::utility::string_t> subprotocols() const;
++    _ASYNCRTIMP std::vector< ::utility::string_t> subprotocols() const;
+ 	
+     /// <summary>
+     /// Gets the server certificate validation property.
+-- 
+2.14.3
+
-- 
2.14.3
