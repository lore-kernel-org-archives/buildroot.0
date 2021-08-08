Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CD4C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:50:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BED160F42
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 20:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3BED160F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01E73402C1;
	Sun,  8 Aug 2021 20:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id la1ohHMr1LRY; Sun,  8 Aug 2021 20:50:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BC9D40222;
	Sun,  8 Aug 2021 20:50:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 231481BF422
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1291440197
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 20:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipsYnaqjbUw9 for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 20:49:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38F2740196
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 20:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BEB5F8D2FF; Sun,  8 Aug 2021 20:49:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 22:49:05 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 992f4aa9713bb378e1142d5367dbd1ecaa4e52bd
X-Git-Newrev: 1d242d404010d86c2092e543337ac73aea5b1500
X-Patchwork-Hint: ignore
Message-Id: <20210808204927.BEB5F8D2FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/nodejs: fix build
 with ICU 69
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
Content-Type: multipart/mixed; boundary="===============5426777358764655732=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============5426777358764655732==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1d242d404010d86c2092e543337ac73aea5b1500
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fixes:
../deps/v8/src/objects/js-list-format.cc: In static member function ‘static v8::internal::MaybeHandle<v8::internal::JSListFormat> v8::internal::JSListFormat::New(v8::internal::Isolate*, v8::internal::Handle<v8::internal::Map>, v8::internal::Handle<v8::internal::Object>, v8::internal::Handle<v8::internal::Object>)’:
../deps/v8/src/objects/js-list-format.cc:173:67: error: ‘static icu::ListFormatter* icu::ListFormatter::createInstance(const icu::Locale&, const char*, UErrorCode&)’ is private within this context
  173 |       icu_locale, GetIcuStyleString(style_enum, type_enum), status);
      |                                                                   ^
In file included from ../deps/v8/src/objects/js-list-format.cc:25:
/home/buildroot/buildroot/output/per-package/host-icu/host/include/unicode/listformatter.h:267:27: note: declared private here
  267 |     static ListFormatter* createInstance(const Locale& locale, const char* style, UErrorCode& errorCode);
      |                           ^~~~~~~~~~~~~~

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6507ac846cf82bb061ab1ca4575d62e2c9b5048e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/0002-Fix-build-with-ICU-68.patch | 101 ++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/package/nodejs/0002-Fix-build-with-ICU-68.patch b/package/nodejs/0002-Fix-build-with-ICU-68.patch
new file mode 100644
index 0000000000..2d6ac010d2
--- /dev/null
+++ b/package/nodejs/0002-Fix-build-with-ICU-68.patch
@@ -0,0 +1,101 @@
+From 1504de672ec44080d08a97c479a23727a9c31d8b Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Mon, 19 Jul 2021 03:35:30 -0600
+Subject: [PATCH] Fix build with ICU >= 68.
+
+Adapted from:
+https://chromium-review.googlesource.com/c/v8/v8/+/2477751
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/nodejs/node/pull/39440]
+---
+ deps/v8/src/objects/js-list-format.cc | 32 +++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/deps/v8/src/objects/js-list-format.cc b/deps/v8/src/objects/js-list-format.cc
+index 4f303b1874..2101f8e507 100644
+--- a/deps/v8/src/objects/js-list-format.cc
++++ b/deps/v8/src/objects/js-list-format.cc
+@@ -29,6 +29,7 @@ namespace v8 {
+ namespace internal {
+ 
+ namespace {
++#if U_ICU_VERSION_MAJOR_NUM < 68
+ const char* kStandard = "standard";
+ const char* kOr = "or";
+ const char* kUnit = "unit";
+@@ -41,8 +42,24 @@ const char* kUnitNarrow = "unit-narrow";
+ 
+ const char* GetIcuStyleString(JSListFormat::Style style,
+                               JSListFormat::Type type) {
++#else
++UListFormatterWidth GetIcuWidth(JSListFormat::Style style) {
++  switch (style) {
++    case JSListFormat::Style::LONG:
++      return ULISTFMT_WIDTH_WIDE;
++    case JSListFormat::Style::SHORT:
++      return ULISTFMT_WIDTH_SHORT;
++    case JSListFormat::Style::NARROW:
++      return ULISTFMT_WIDTH_NARROW;
++  }
++  UNREACHABLE();
++}
++
++UListFormatterType GetIcuType(JSListFormat::Type type) {
++#endif
+   switch (type) {
+     case JSListFormat::Type::CONJUNCTION:
++#if U_ICU_VERSION_MAJOR_NUM < 68
+       switch (style) {
+         case JSListFormat::Style::LONG:
+           return kStandard;
+@@ -51,7 +68,11 @@ const char* GetIcuStyleString(JSListFormat::Style style,
+         case JSListFormat::Style::NARROW:
+           return kStandardNarrow;
+       }
++#else
++      return ULISTFMT_TYPE_AND;
++#endif
+     case JSListFormat::Type::DISJUNCTION:
++#if U_ICU_VERSION_MAJOR_NUM < 68
+       switch (style) {
+         case JSListFormat::Style::LONG:
+           return kOr;
+@@ -60,7 +81,11 @@ const char* GetIcuStyleString(JSListFormat::Style style,
+         case JSListFormat::Style::NARROW:
+           return kOrNarrow;
+       }
++#else
++      return ULISTFMT_TYPE_OR;
++#endif
+     case JSListFormat::Type::UNIT:
++#if U_ICU_VERSION_MAJOR_NUM < 68
+       switch (style) {
+         case JSListFormat::Style::LONG:
+           return kUnit;
+@@ -69,6 +94,9 @@ const char* GetIcuStyleString(JSListFormat::Style style,
+         case JSListFormat::Style::NARROW:
+           return kUnitNarrow;
+       }
++#else
++      return ULISTFMT_TYPE_UNITS;
++#endif
+   }
+   UNREACHABLE();
+ }
+@@ -170,7 +198,11 @@ MaybeHandle<JSListFormat> JSListFormat::New(Isolate* isolate, Handle<Map> map,
+   icu::Locale icu_locale = r.icu_locale;
+   UErrorCode status = U_ZERO_ERROR;
+   icu::ListFormatter* formatter = icu::ListFormatter::createInstance(
++#if U_ICU_VERSION_MAJOR_NUM < 68
+       icu_locale, GetIcuStyleString(style_enum, type_enum), status);
++#else
++      icu_locale, GetIcuType(type_enum), GetIcuWidth(style_enum), status);
++#endif
+   if (U_FAILURE(status)) {
+     delete formatter;
+     FATAL("Failed to create ICU list formatter, are ICU data files missing?");
+-- 
+2.25.1
+

--===============5426777358764655732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============5426777358764655732==--
