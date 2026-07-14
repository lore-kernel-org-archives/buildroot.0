Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1413EC43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 10:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B79C7811B2;
	Tue, 14 Jul 2026 10:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3JCXyjWcHXwu; Tue, 14 Jul 2026 10:37:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D219811C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784025465;
	bh=T+Vo3GF81qN5aXMgIrSOuDfA/pFc38ijY/JDAS2/StA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lMcxB5b47lm7oCBuJJIhBIfYDU29/YRpL+n/JGJCrh8noJwGG2knpYS7sZdA71Lk2
	 CVAUchINRENBNlte3lw3tF5bnguEmujIVvmz7PQmAk8VVjYec9kwh5vNyPYm1LeBlK
	 FQ1WjS36zLVzri7TLj81ZtXc02QdmewpjxaBrA6rNoDQbVFLXxzQWLftDiCswv1/qC
	 FzJelnp0vRMhdT7KT75e/y0We0EEkQ0bDMrcjDZKnQZncnshOGYKrSuX0g2aKZXF1F
	 sSl1SJlSRJ17G+Ppp/4ZsoGM9/A8y7WpNA+ILSZCURowRVEAtjL9svoSUuRvW9yS8j
	 IDoNSNCFX9huA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D219811C0;
	Tue, 14 Jul 2026 10:37:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EABA2128
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:37:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC8514068A
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:37:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qnthh4ZJv8el for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 10:37:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE206406A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE206406A8
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 10:37:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F84E88883; Tue, 14 Jul 2026 10:37:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 12:25:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 500961bebacf0b631de223ceb412abcfe5e446dc
X-Git-Newrev: f25d7056cb13af64133eccd4a6aa3d808d770492
X-Patchwork-Hint: ignore
Message-Id: <20260714103708.2F84E88883@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jsoncpp: bump version to 1.9.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f25d7056cb13af64133eccd4a6aa3d808d770492
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.8

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ABI-breakage-when-compiled-with-C-17-1668.patch | 192 ---------------------
 package/jsoncpp/jsoncpp.hash                       |   2 +-
 package/jsoncpp/jsoncpp.mk                         |   2 +-
 3 files changed, 2 insertions(+), 194 deletions(-)

diff --git a/package/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668.patch b/package/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668.patch
deleted file mode 100644
index 938c332185..0000000000
--- a/package/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-From e9e752beacba6ee0fcb7819109229541c8b5a1e2 Mon Sep 17 00:00:00 2001
-From: Jordan Bayles <jophba@chromium.org>
-Date: Tue, 7 Apr 2026 21:58:40 -0700
-Subject: [PATCH] Fix C++11 ABI breakage when compiled with C++17 (#1668)
-
-When JSONCPP_HAS_STRING_VIEW was defined, the library dropped the
-`const char*` and `const String&` overloads for `operator[]`, `get`,
-`removeMember`, and `isMember`, breaking ABI compatibility for projects
-consuming the library with C++11.
-
-This change unconditionally declares and defines the legacy overloads
-so they are always exported, restoring compatibility.
-
-Upstream: https://github.com/open-source-parsers/jsoncpp/pull/1675
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- include/json/value.h        | 15 +++++----------
- src/lib_json/json_value.cpp | 15 +++++----------
- 2 files changed, 10 insertions(+), 20 deletions(-)
-
-diff --git a/include/json/value.h b/include/json/value.h
-index f32f456..1369f92 100644
---- a/include/json/value.h
-+++ b/include/json/value.h
-@@ -501,7 +501,7 @@ public:
-   /// that name.
-   /// \param key may contain embedded nulls.
-   const Value& operator[](std::string_view key) const;
--#else
-+#endif
-   /// Access an object value by name, create a null member if it does not exist.
-   /// \note Because of our implementation, keys are limited to 2^30 -1 chars.
-   /// Exceeding that will cause an exception.
-@@ -516,7 +516,6 @@ public:
-   /// that name.
-   /// \param key may contain embedded nulls.
-   const Value& operator[](const String& key) const;
--#endif
-   /** \brief Access an object value by name, create a null member if it does not
-    * exist.
-    *
-@@ -534,7 +533,7 @@ public:
-   /// Return the member named key if it exist, defaultValue otherwise.
-   /// \note deep copy
-   Value get(std::string_view key, const Value& defaultValue) const;
--#else
-+#endif
-   /// Return the member named key if it exist, defaultValue otherwise.
-   /// \note deep copy
-   Value get(const char* key, const Value& defaultValue) const;
-@@ -542,7 +541,6 @@ public:
-   /// \note deep copy
-   /// \param key may contain embedded nulls.
-   Value get(const String& key, const Value& defaultValue) const;
--#endif
-   /// Return the member named key if it exist, defaultValue otherwise.
-   /// \note deep copy
-   /// \note key may contain embedded nulls.
-@@ -589,12 +587,11 @@ public:
-   /// \post type() is unchanged
- #if JSONCPP_HAS_STRING_VIEW
-   void removeMember(std::string_view key);
--#else
-+#endif
-   void removeMember(const char* key);
-   /// Same as removeMember(const char*)
-   /// \param key may contain embedded nulls.
-   void removeMember(const String& key);
--#endif
-   /** \brief Remove the named map member.
-    *
-    *  Update 'removed' iff removed.
-@@ -603,12 +600,11 @@ public:
-    */
- #if JSONCPP_HAS_STRING_VIEW
-   bool removeMember(std::string_view key, Value* removed);
--#else
-+#endif
-   bool removeMember(String const& key, Value* removed);
-   /// Same as removeMember(const char* begin, const char* end, Value* removed),
-   /// but 'key' is null-terminated.
-   bool removeMember(const char* key, Value* removed);
--#endif
-   /// Same as removeMember(String const& key, Value* removed)
-   bool removeMember(const char* begin, const char* end, Value* removed);
-   /** \brief Remove the indexed array element.
-@@ -623,14 +619,13 @@ public:
-   /// Return true if the object has a member named key.
-   /// \param key may contain embedded nulls.
-   bool isMember(std::string_view key) const;
--#else
-+#endif
-   /// Return true if the object has a member named key.
-   /// \note 'key' must be null-terminated.
-   bool isMember(const char* key) const;
-   /// Return true if the object has a member named key.
-   /// \param key may contain embedded nulls.
-   bool isMember(const String& key) const;
--#endif
-   /// Same as isMember(String const& key)const
-   bool isMember(const char* begin, const char* end) const;
- 
-diff --git a/src/lib_json/json_value.cpp b/src/lib_json/json_value.cpp
-index 74f7789..953d58e 100644
---- a/src/lib_json/json_value.cpp
-+++ b/src/lib_json/json_value.cpp
-@@ -1200,7 +1200,7 @@ const Value& Value::operator[](std::string_view key) const {
- Value& Value::operator[](std::string_view key) {
-   return resolveReference(key.data(), key.data() + key.length());
- }
--#else
-+#endif
- const Value& Value::operator[](const char* key) const {
-   Value const* found = find(key, key + strlen(key));
-   if (!found)
-@@ -1221,7 +1221,6 @@ Value& Value::operator[](const char* key) {
- Value& Value::operator[](const String& key) {
-   return resolveReference(key.data(), key.data() + key.length());
- }
--#endif
- 
- Value& Value::operator[](const StaticString& key) {
-   return resolveReference(key.c_str());
-@@ -1265,14 +1264,13 @@ Value Value::get(char const* begin, char const* end,
- Value Value::get(std::string_view key, const Value& defaultValue) const {
-   return get(key.data(), key.data() + key.length(), defaultValue);
- }
--#else
-+#endif
- Value Value::get(char const* key, Value const& defaultValue) const {
-   return get(key, key + strlen(key), defaultValue);
- }
- Value Value::get(String const& key, Value const& defaultValue) const {
-   return get(key.data(), key.data() + key.length(), defaultValue);
- }
--#endif
- 
- bool Value::removeMember(const char* begin, const char* end, Value* removed) {
-   if (type() != objectValue) {
-@@ -1292,14 +1290,13 @@ bool Value::removeMember(const char* begin, const char* end, Value* removed) {
- bool Value::removeMember(std::string_view key, Value* removed) {
-   return removeMember(key.data(), key.data() + key.length(), removed);
- }
--#else
-+#endif
- bool Value::removeMember(const char* key, Value* removed) {
-   return removeMember(key, key + strlen(key), removed);
- }
- bool Value::removeMember(String const& key, Value* removed) {
-   return removeMember(key.data(), key.data() + key.length(), removed);
- }
--#endif
- 
- #ifdef JSONCPP_HAS_STRING_VIEW
- void Value::removeMember(std::string_view key) {
-@@ -1312,7 +1309,7 @@ void Value::removeMember(std::string_view key) {
-                      CZString::noDuplication);
-   value_.map_->erase(actualKey);
- }
--#else
-+#endif
- void Value::removeMember(const char* key) {
-   JSON_ASSERT_MESSAGE(type() == nullValue || type() == objectValue,
-                       "in Json::Value::removeMember(): requires objectValue");
-@@ -1323,7 +1320,6 @@ void Value::removeMember(const char* key) {
-   value_.map_->erase(actualKey);
- }
- void Value::removeMember(const String& key) { removeMember(key.c_str()); }
--#endif
- 
- bool Value::removeIndex(ArrayIndex index, Value* removed) {
-   if (type() != arrayValue) {
-@@ -1357,14 +1353,13 @@ bool Value::isMember(char const* begin, char const* end) const {
- bool Value::isMember(std::string_view key) const {
-   return isMember(key.data(), key.data() + key.length());
- }
--#else
-+#endif
- bool Value::isMember(char const* key) const {
-   return isMember(key, key + strlen(key));
- }
- bool Value::isMember(String const& key) const {
-   return isMember(key.data(), key.data() + key.length());
- }
--#endif
- 
- Value::Members Value::getMemberNames() const {
-   JSON_ASSERT_MESSAGE(
--- 
-2.47.3
-
diff --git a/package/jsoncpp/jsoncpp.hash b/package/jsoncpp/jsoncpp.hash
index 50344665a4..dcd1605996 100644
--- a/package/jsoncpp/jsoncpp.hash
+++ b/package/jsoncpp/jsoncpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  830bf352d822d8558e9d0eb19d640d2e38536b4b6699c30a4488da09d5b1df18  jsoncpp-1.9.7.tar.gz
+sha256  51828cf3574281d2b79ec2a1c56a9e4c20cc1103711321ea96384cffb8d2d904  jsoncpp-1.9.8.tar.gz
 sha256  cec0db5f6d7ed6b3a72647bd50aed02e13c3377fd44382b96dc2915534c042ad  LICENSE
diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 3984903640..7a47277590 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSONCPP_VERSION = 1.9.7
+JSONCPP_VERSION = 1.9.8
 JSONCPP_SITE = $(call github,open-source-parsers,jsoncpp,$(JSONCPP_VERSION))
 JSONCPP_LICENSE = Public Domain or MIT
 JSONCPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
