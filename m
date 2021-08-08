Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A0DC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:50:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9AB160EB5
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9AB160EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9012240306;
	Sun,  8 Aug 2021 20:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yOqL1zt9Z_e5; Sun,  8 Aug 2021 20:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CDF7402F7;
	Sun,  8 Aug 2021 20:50:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 649541BF422
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53499606D0
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pnLmz-AYPTa1 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 20:49:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4941260607
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 20:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D416B8D302; Sun,  8 Aug 2021 20:49:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 22:49:08 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 1d242d404010d86c2092e543337ac73aea5b1500
X-Git-Newrev: 88f69eafd6cbe5f578b9343baf070fe9e0795669
X-Patchwork-Hint: ignore
Message-Id: <20210808204927.D416B8D302@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/nodejs: security
 bump to version 12.22.4
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=88f69eafd6cbe5f578b9343baf070fe9e0795669
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fixes the following security issues:

- CVE-2021-22930: Use after free on close http2 on stream canceling (High)

  Node.js is vulnerable to a use after free attack where an attacker might
  be able to exploit the memory corruption, to change process behavior.

Drop 0002-Fix-build-with-ICU-68.patch as this is now fixed upstream since
https://github.com/nodejs/node/commit/e459c79b02

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ca92d31cff4281c968e505fc588c5a480e7f5843)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/0002-Fix-build-with-ICU-68.patch | 101 ------------------------
 package/nodejs/nodejs.hash                      |   4 +-
 package/nodejs/nodejs.mk                        |   2 +-
 3 files changed, 3 insertions(+), 104 deletions(-)

diff --git a/package/nodejs/0002-Fix-build-with-ICU-68.patch b/package/nodejs/0002-Fix-build-with-ICU-68.patch
deleted file mode 100644
index 2d6ac010d2..0000000000
--- a/package/nodejs/0002-Fix-build-with-ICU-68.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 1504de672ec44080d08a97c479a23727a9c31d8b Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Mon, 19 Jul 2021 03:35:30 -0600
-Subject: [PATCH] Fix build with ICU >= 68.
-
-Adapted from:
-https://chromium-review.googlesource.com/c/v8/v8/+/2477751
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://github.com/nodejs/node/pull/39440]
----
- deps/v8/src/objects/js-list-format.cc | 32 +++++++++++++++++++++++++++
- 1 file changed, 32 insertions(+)
-
-diff --git a/deps/v8/src/objects/js-list-format.cc b/deps/v8/src/objects/js-list-format.cc
-index 4f303b1874..2101f8e507 100644
---- a/deps/v8/src/objects/js-list-format.cc
-+++ b/deps/v8/src/objects/js-list-format.cc
-@@ -29,6 +29,7 @@ namespace v8 {
- namespace internal {
- 
- namespace {
-+#if U_ICU_VERSION_MAJOR_NUM < 68
- const char* kStandard = "standard";
- const char* kOr = "or";
- const char* kUnit = "unit";
-@@ -41,8 +42,24 @@ const char* kUnitNarrow = "unit-narrow";
- 
- const char* GetIcuStyleString(JSListFormat::Style style,
-                               JSListFormat::Type type) {
-+#else
-+UListFormatterWidth GetIcuWidth(JSListFormat::Style style) {
-+  switch (style) {
-+    case JSListFormat::Style::LONG:
-+      return ULISTFMT_WIDTH_WIDE;
-+    case JSListFormat::Style::SHORT:
-+      return ULISTFMT_WIDTH_SHORT;
-+    case JSListFormat::Style::NARROW:
-+      return ULISTFMT_WIDTH_NARROW;
-+  }
-+  UNREACHABLE();
-+}
-+
-+UListFormatterType GetIcuType(JSListFormat::Type type) {
-+#endif
-   switch (type) {
-     case JSListFormat::Type::CONJUNCTION:
-+#if U_ICU_VERSION_MAJOR_NUM < 68
-       switch (style) {
-         case JSListFormat::Style::LONG:
-           return kStandard;
-@@ -51,7 +68,11 @@ const char* GetIcuStyleString(JSListFormat::Style style,
-         case JSListFormat::Style::NARROW:
-           return kStandardNarrow;
-       }
-+#else
-+      return ULISTFMT_TYPE_AND;
-+#endif
-     case JSListFormat::Type::DISJUNCTION:
-+#if U_ICU_VERSION_MAJOR_NUM < 68
-       switch (style) {
-         case JSListFormat::Style::LONG:
-           return kOr;
-@@ -60,7 +81,11 @@ const char* GetIcuStyleString(JSListFormat::Style style,
-         case JSListFormat::Style::NARROW:
-           return kOrNarrow;
-       }
-+#else
-+      return ULISTFMT_TYPE_OR;
-+#endif
-     case JSListFormat::Type::UNIT:
-+#if U_ICU_VERSION_MAJOR_NUM < 68
-       switch (style) {
-         case JSListFormat::Style::LONG:
-           return kUnit;
-@@ -69,6 +94,9 @@ const char* GetIcuStyleString(JSListFormat::Style style,
-         case JSListFormat::Style::NARROW:
-           return kUnitNarrow;
-       }
-+#else
-+      return ULISTFMT_TYPE_UNITS;
-+#endif
-   }
-   UNREACHABLE();
- }
-@@ -170,7 +198,11 @@ MaybeHandle<JSListFormat> JSListFormat::New(Isolate* isolate, Handle<Map> map,
-   icu::Locale icu_locale = r.icu_locale;
-   UErrorCode status = U_ZERO_ERROR;
-   icu::ListFormatter* formatter = icu::ListFormatter::createInstance(
-+#if U_ICU_VERSION_MAJOR_NUM < 68
-       icu_locale, GetIcuStyleString(style_enum, type_enum), status);
-+#else
-+      icu_locale, GetIcuType(type_enum), GetIcuWidth(style_enum), status);
-+#endif
-   if (U_FAILURE(status)) {
-     delete formatter;
-     FATAL("Failed to create ICU list formatter, are ICU data files missing?");
--- 
-2.25.1
-
diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index d94942e7c0..7d11a8d104 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,5 +1,5 @@
-# From https://nodejs.org/dist/v12.22.3/SHASUMS256.txt
-sha256  350211fae3a688f41889680c8efcf689353a2e36b62b9dc2b408340986857190  node-v12.22.3.tar.xz
+# From https://nodejs.org/dist/v12.22.4/SHASUMS256.txt
+sha256  44cd4eab131e5282fc923e9e720d983a0b44c12e4aa4f6c3598dc97ae1e4cd4c  node-v12.22.4.tar.xz
 
 # Hash for license file
 sha256  221417a7ca275112a5ac54639b36ee3c5184e74631ea1e1b01b701293b655190  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 2731a7c667..08d2f6d7c1 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 12.22.3
+NODEJS_VERSION = 12.22.4
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
