Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F55CC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47FC24F608;
	Fri, 28 Feb 2025 16:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rUNw-pExA_pu; Fri, 28 Feb 2025 16:57:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFB6E50281
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFB6E50281;
	Fri, 28 Feb 2025 16:57:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 134DE68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4677487EA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AiaLNRnGCYtu for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46E114256C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46E114256C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3EDC6818FE; Fri, 28 Feb 2025 16:30:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 20:51:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1da57d0edf91598695c4a7bcdc712661efff826a
X-Git-Newrev: fb032bd34acf57f86f62bd474cbabd4e1e750e67
X-Patchwork-Hint: ignore
Message-Id: <20250228163009.3EDC6818FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zxing-cpp: bump to
 version 2.3.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fb032bd34acf57f86f62bd474cbabd4e1e750e67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit bumps the zxing-cpp version to 2.3.0.
For the release note, see:
https://github.com/zxing-cpp/zxing-cpp/releases/tag/v2.3.0

The compilation of this package has been broken since the bump to v2.2.1
when it is compiled with reader support, due to the added patch.

This patch was not added upstream, but another set of more generic
patches [1] that do not change the API were added instead. The error
that the Buildroot patch was fixing no longer exists in 2.3.0.

[1]:
    - https://github.com/zxing-cpp/zxing-cpp/commit/d0c8f226e22cd978fd42a25a6cff6d65b47ab6e9
    - https://github.com/zxing-cpp/zxing-cpp/commit/d979b765a14423f6d7747827b72193a0da9f3030

Fixes:
    https://autobuild.buildroot.org/results/ba4573a1bcc0110d4d0b45642e07009ec949d66a/build-end.log

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...lding-when-only-writer-support-is-enabled.patch | 164 ---------------------
 package/zxing-cpp/zxing-cpp.hash                   |   2 +-
 package/zxing-cpp/zxing-cpp.mk                     |   2 +-
 3 files changed, 2 insertions(+), 166 deletions(-)

diff --git a/package/zxing-cpp/0001-Fix-building-when-only-writer-support-is-enabled.patch b/package/zxing-cpp/0001-Fix-building-when-only-writer-support-is-enabled.patch
deleted file mode 100644
index 0d2a90f7a5..0000000000
--- a/package/zxing-cpp/0001-Fix-building-when-only-writer-support-is-enabled.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From aef33b66df0ad6f085dc55b50d7847e0b8a2ccd8 Mon Sep 17 00:00:00 2001
-From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Date: Wed, 17 Jul 2024 14:53:35 +0200
-Subject: [PATCH] Fix building when only writer support is enabled
-
-The compilation of the following code, which links the zxing-cpp library
-built with only the writer (encoder) support, raises the following
-linking errors:
-
-using namespace ZXing;
-
-int main(void)
-{
-	std::string str = "01";
-	BitHacks::NumberOfLeadingZeros(0);
-	auto writer = MultiFormatWriter(BarcodeFormat::Code128);
-	writer.setEncoding(CharacterSet::UTF8);
-	writer.setMargin(0);
-	auto matrix = writer.encode(str, 0, 0 /*scaledImageWidth, pixelHeight*/);
-
-	return EXIT_SUCCESS;
-}
-
-arm-buildroot-linux-uclibcgnueabihf/bin/ld:host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libZXing.so:
-undefined reference to `ZXing::TextDecoder::GuessEncoding(unsigned char const*, unsigned int, ZXing::CharacterSet)'
-arm-buildroot-linux-uclibcgnueabihf/bin/ld: host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libZXing.so:
-undefined reference to `ZXing::HRIFromGS1[abi:cxx11](std::basic_string_view<char, std::char_traits<char> >)'
-arm-buildroot-linux-uclibcgnueabihf/bin/ld: host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libZXing.so:
-undefined reference to `ZXing::TextDecoder::Append(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >&, unsigned char const*, unsigned int, ZXing::CharacterSet, bool)'
-arm-buildroot-linux-uclibcgnueabihf/bin/ld: host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/libZXing.so:
-undefined reference to `ZXing::HRIFromISO15434[abi:cxx11](std::basic_string_view<char, std::char_traits<char> >)'
-collect2: error: ld returned 1 exit status
-
-The patch fixes these errors.
-
-Co-Developed-by: Francesco Nicoletta Puzzillo <francesco.nicolettap@amarula>
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: backport from upstream https://github.com/zxing-cpp/zxing-cpp/pull/811
----
- core/src/Content.cpp     | 4 ++++
- core/src/Content.h       | 6 ++++++
- core/src/DecoderResult.h | 2 ++
- core/src/GTIN.cpp        | 2 ++
- core/src/GTIN.h          | 2 ++
- 5 files changed, 16 insertions(+)
-
-diff --git a/core/src/Content.cpp b/core/src/Content.cpp
-index 4d3c44657cf9..569d4e35614a 100644
---- a/core/src/Content.cpp
-+++ b/core/src/Content.cpp
-@@ -93,6 +93,7 @@ bool Content::canProcess() const
- 	return std::all_of(encodings.begin(), encodings.end(), [](Encoding e) { return CanProcess(e.eci); });
- }
- 
-+#ifdef ZXING_READERS
- std::string Content::render(bool withECI) const
- {
- 	if (empty() || !canProcess())
-@@ -165,6 +166,7 @@ std::wstring Content::utfW() const
- {
- 	return FromUtf8(render(false));
- }
-+#endif // ZXING_READERS
- 
- ByteArray Content::bytesECI() const
- {
-@@ -188,6 +190,7 @@ ByteArray Content::bytesECI() const
- 	return ByteArray(res);
- }
- 
-+#ifdef ZXING_READERS
- CharacterSet Content::guessEncoding() const
- {
- 	// assemble all blocks with unknown encoding
-@@ -236,5 +239,6 @@ ContentType Content::type() const
- 
- 	return ContentType::Mixed;
- }
-+#endif // ZXING_READERS
- 
- } // namespace ZXing
-diff --git a/core/src/Content.h b/core/src/Content.h
-index 99e5a01e7140..aa77bda94d54 100644
---- a/core/src/Content.h
-+++ b/core/src/Content.h
-@@ -38,7 +38,9 @@ class Content
- 	void ForEachECIBlock(FUNC f) const;
- 
- 	void switchEncoding(ECI eci, bool isECI);
-+#ifdef ZXING_READERS
- 	std::string render(bool withECI) const;
-+#endif // ZXING_READERS
- 
- public:
- 	struct Encoding
-@@ -75,13 +77,17 @@ public:
- 	bool empty() const { return bytes.empty(); }
- 	bool canProcess() const;
- 
-+#ifdef ZXING_READERS
- 	std::string text(TextMode mode) const;
- 	std::wstring utfW() const; // utf16 or utf32 depending on the platform, i.e. on size_of(wchar_t)
- 	std::string utf8() const { return render(false); }
-+#endif // ZXING_READERS
- 
- 	ByteArray bytesECI() const;
-+#ifdef ZXING_READERS
- 	CharacterSet guessEncoding() const;
- 	ContentType type() const;
-+#endif // ZXING_READERS
- };
- 
- } // ZXing
-diff --git a/core/src/DecoderResult.h b/core/src/DecoderResult.h
-index 02b285084195..3117b03a923a 100644
---- a/core/src/DecoderResult.h
-+++ b/core/src/DecoderResult.h
-@@ -50,7 +50,9 @@ public:
- 	Content&& content() && { return std::move(_content); }
- 
- 	// to keep the unit tests happy for now:
-+#ifdef ZXING_READERS
- 	std::wstring text() const { return _content.utfW(); }
-+#endif // ZXING_READERS
- 	std::string symbologyIdentifier() const { return _content.symbology.toString(false); }
- 
- 	// Simple macro to set up getter/setter methods that save lots of boilerplate.
-diff --git a/core/src/GTIN.cpp b/core/src/GTIN.cpp
-index 256855a03070..690901062301 100644
---- a/core/src/GTIN.cpp
-+++ b/core/src/GTIN.cpp
-@@ -199,6 +199,7 @@ std::string LookupCountryIdentifier(const std::string& GTIN, const BarcodeFormat
- 	return it != std::end(COUNTRIES) && prefix >= it->first && prefix <= it->last ? it->id : std::string();
- }
- 
-+#ifdef ZXING_READERS
- std::string EanAddOn(const Result& result)
- {
- 	if (!(BarcodeFormat::EAN13 | BarcodeFormat::UPCA | BarcodeFormat::UPCE | BarcodeFormat::EAN8)
-@@ -208,6 +209,7 @@ std::string EanAddOn(const Result& result)
- 	auto pos = txt.find(' ');
- 	return pos != std::string::npos ? std::string(txt.substr(pos + 1)) : std::string();
- }
-+#endif // ZXING_READERS
- 
- std::string IssueNr(const std::string& ean2AddOn)
- {
-diff --git a/core/src/GTIN.h b/core/src/GTIN.h
-index d56b604e5f71..9af0b01200ce 100644
---- a/core/src/GTIN.h
-+++ b/core/src/GTIN.h
-@@ -47,7 +47,9 @@ bool IsCheckDigitValid(const std::basic_string<T>& s)
-  */
- std::string LookupCountryIdentifier(const std::string& GTIN, const BarcodeFormat format = BarcodeFormat::None);
- 
-+#ifdef ZXING_READERS
- std::string EanAddOn(const Result& result);
-+#endif // ZXING_READERS
- 
- std::string IssueNr(const std::string& ean2AddOn);
- std::string Price(const std::string& ean5AddOn);
--- 
-2.43.0
-
diff --git a/package/zxing-cpp/zxing-cpp.hash b/package/zxing-cpp/zxing-cpp.hash
index ff11896f4b..c0758579db 100644
--- a/package/zxing-cpp/zxing-cpp.hash
+++ b/package/zxing-cpp/zxing-cpp.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  02078ae15f19f9d423a441f205b1d1bee32349ddda7467e2c84e8f08876f8635  zxing-cpp-2.2.1.tar.gz
+sha256  64e4139103fdbc57752698ee15b5f0b0f7af9a0331ecbdc492047e0772c417ba  zxing-cpp-2.3.0.tar.gz
 
 # License files
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  LICENSE
diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 5f91bf2f71..515daf590f 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZXING_CPP_VERSION = 2.2.1
+ZXING_CPP_VERSION = 2.3.0
 ZXING_CPP_SITE = $(call github,zxing-cpp,zxing-cpp,v$(ZXING_CPP_VERSION))
 ZXING_CPP_LICENSE = Apache-2.0
 ZXING_CPP_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
