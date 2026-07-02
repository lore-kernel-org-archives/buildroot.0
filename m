Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F68EC43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74B1860B70;
	Fri,  3 Jul 2026 14:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0HvD-Bn5_W6; Fri,  3 Jul 2026 14:27:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83B9260D6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088830;
	bh=fzxSz66RkHCz4ofx8bIJhBAKRnwcla+e++WiwJg2c0c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N08YhiMWmoEGcYqQ+VNc1grRqDQa7YNaIA52BJEBdocgVFy90TI1NlvXbRJ8qeXHF
	 VoZT4+r/mmncQW90n2F37iap5xD1R49TWxGIVVyqzD9MOSbJ4fSNuctZ4IxG/XsjjS
	 VgUpLn2HYHMiRw581XR4O0LcB3/u3BJ8na4NV+ELNFDVpJ46aEsY4ZwjP7QG9hy263
	 o5E8bE6fhwKJONlIcvtrdPsRNcjDXDz3Yn20Y5dJX3/UYCK9ADfa9ml6BPfmhnblCX
	 8FL/l9GDZFfxye9HlFHX6pn+pbD74pe0OmGAyh7NDI1sVWdS7EP8I4URIgRpYR6a2w
	 kzVWWueiZp4pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83B9260D6C;
	Fri,  3 Jul 2026 14:27:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E3E9A363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAB6A40E90
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHJW9zYtP6yZ for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CEBB40FE8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CEBB40FE8
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3C0D883A2; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 22:00:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5c906d4a3142020696581f0a1f9a62db55976586
X-Git-Newrev: 0f2bd03f9aaf1d53f09920a3cd8a4886ee5f8e50
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.D3C0D883A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/{glibc,
 localedef}: security bump to version 2.41-143-gfc7a48bc9
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f2bd03f9aaf1d53f09920a3cd8a4886ee5f8e50
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerabilities:

GLIBC-SA-2026-0009:
===================
scanf %mc off-by-one heap buffer overflow

Calling the scanf family of functions with a %mc (malloc'd character
match) in the GNU C Library version 2.7 to version 2.43 with a format
width specifier with an explicit width greater than 1024 could result in
a one byte heap buffer overflow.

The bug is in the buffer growth formula in __vfscanf_internal, which
under-allocates by one byte during realloc expansion, allowing a
controlled single-byte overwrite past the end of the heap buffer.

The impact is limited by the fact that to execute the overwrite you need
both user controlled input data and a specific choice of maximum width
that yields a smaller than needed allocation. The latter point has to
take into account malloc's particular chunk size rounding process.  The
"%[width]mc" format specifier does not appear to have notable use in
major Linux-based OS distributions, due to which the real world impact
may be limited to bespoke use cases.

CVE-Id: CVE-2026-5450

GLIBC-SA-2026-0010:
===================
Potential buffer under-read in ungetwc

Calling the ungetwc function on a FILE stream with wide characters
encoded in a character set that has overlaps between its single byte and
multi-byte character encodings, in the GNU C Library version 2.43 or
earlier, may result in an attempt to read bytes before an allocated
buffer, potentially resulting in unintentional disclosure of neighboring
data in the heap, or a program crash.

A bug in the wide character pushback implementation
(_IO_wdefault_pbackfail in libio/wgenops.c) causes ungetwc() to operate
on the regular character buffer (fp->_IO_read_ptr) instead of the actual
wide-stream read pointer (fp->_wide_data->_IO_read_ptr). The program
crash may happen in cases where fp->_IO_read_ptr is not initialized and
hence points to NULL. The buffer under-read requires a special situation
where the input character encoding is such that there are overlaps
between single byte representations and multibyte representations in
that encoding, resulting in spurious matches.  The spurious match case
is not possible in the standard Unicode character sets.

CVE-Id: CVE-2026-5928

https://inbox.sourceware.org/libc-announce/b11f0003-6ec1-4bd6-b9de-9e38a4efeca3@redhat.com/T/

git shortlog b676adadbc1f5fb2f31bc484a7628cca89ae6f22..
DJ Delorie (1):
      stdio-common: Allow partially-filled %mc buffers [BZ #12701]

Florian Weimer (1):
      iconv: Suppress intermediate errors with //TRANSLIT (bug 34236)

Maciej W. Rozycki (2):
      support: Implement 'xfmemopen' for seamless 'fmemopen' use
      stdio-common: Reject insufficient character data in scanf [BZ #12701]

Rocket Ma (2):
      libio: Fix ungetwc operating on byte stream [BZ #33998]
      stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 8 +++++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 3f1df7058a..03e8722057 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  c5856a16a8576d35adddd92f7e86c58faeedd849633582a7926f9a3e766ffe2d  glibc-2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22-git4.tar.gz
+sha256  130d77e16a08f7e52e14b49d8554997877a4fe82ac6b840a0202716146ac8fb5  glibc-2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 3ce6265a6d..8121968e02 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22
+GLIBC_VERSION = 2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -60,6 +60,12 @@ GLIBC_IGNORE_CVES += CVE-2026-4438
 # Fixed by glibc-2.41-135-g61737f43b1f0d9f64a6f16649625476b70f9f4d3
 GLIBC_IGNORE_CVES += CVE-2026-4046
 
+# Fixed by glibc-2.41-138-g8941538b92a574a24e9308e164869239d2b0d845
+GLIBC_IGNORE_CVES += CVE-2026-5928
+
+# Fixed by glibc-2.41-142-g1a74f82eedaf0987eda1f522121e6a48fac502e7
+GLIBC_IGNORE_CVES += CVE-2026-5450
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index c3a959c5f5..7b16932125 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22
+LOCALEDEF_VERSION = 2.41-143-gfc7a48bc9e999c0f9a1f9fa1b209eac1d6a93363
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
