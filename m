Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F66CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED623606BF;
	Tue,  6 Oct 2026 16:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4nAZsP-tr8R7; Tue,  6 Oct 2026 16:30:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D858660792
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304223;
	b=OJObummtZKQfvSzXPyKZZfjYv3sqLaKF7pT1c3B31egfvVcBN1psXQQEhOQwmg6opwNO
	 n076+Rqsu64CHLB+il8m2ol7wwvs5nVaOOssQGMPatyEM0O6LuoO0heRohKCEc5x+CpMV
	 PiiLeib5WNcJtrsvSV8STb2N2CQbXoGapNAp9DVSseW0cbXXIAJTcdt+VvXvMp1LAodvE
	 vfgsHnPYTmImtpQEiOs9Q1lgeyWZILL0+a5gXg4RvGfBDxvIqGXU+gAlsavmE5X9s6XEz
	 oK3p+8Qolb+vYIcf1Xc7cIOeElBpUvnnh8sILYhj8cCh6wXzyebWOGBblrlvlY/oFDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304223;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=q7D8xBHMi225QSW+hhlVIUl5b3PGH+OOPXfMFF5ZAPM=;
	b=BwWFy0KLxQ2kbV00BMVAYm5dlqpg+G1NfdIqspOCeTFTtR1zU4TLlLXZQlyelaTnl+G1
	 uoX4Zyfm2F0VlaORrNrpLlC2apNl4Y5zSZS1ug2ls817gfSQ9U8fPLjSWmZHf3lKQwUQQ
	 vm+oy1HacxCIkONiFxUtgXERHfNbA/L/QtOA6IKdvg39B0GdttfvqeDfXuqAFmUHku/ie
	 uTuxT2wbHtp+aYfOBOScP31NH1/554GG3frGaJhtYfverRJCJR6FYSIGXfdhCR+xrNis1
	 AYNQrRp25O1fwJSz1xpBcvgHBlhvxkYFVCl17Lt8ouGYvIFusH3VnHtkm02KVIaTgeg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304222;
	bh=q7D8xBHMi225QSW+hhlVIUl5b3PGH+OOPXfMFF5ZAPM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FqXxzBbBK8XTnsei3OIG6j0ppXssgwfJweyWsxPEAh7ImJpbm3jrm4MCHTZihP7TR
	 UAx8GiX3DcKUNtWcmVQdpmt1bS18YVGykGgHfpCkvIH8Clz6l6mPMzERgkAkUEivFb
	 +K3ekkioDiwBBlpyafFXQAY7R3r5uD+IC4sJJSOIj8AT1PJK2BcTCoQ+9nbP0aehtg
	 EAmhsgz+0BuXUnss6TkL/ZYhrBCae2ZbvDJKTa5AWSNslqITWKq8FVb9C6Y5V7jRxF
	 lKScGW4SfHanZYkWnUztu5J8SY/Wwryb3El2nVoLzx7rOFMP+hT6neMc8hRaRYYDx8
	 Q/GbLWXG0eHJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D858660792;
	Tue,  6 Oct 2026 16:30:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 471F4317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44DEF4009F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuGinkVjSFzt for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:25:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3741640274
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303922;
 b=aMf0jxB6cxQThiwxfU+gQU4fyEkZCsNyMSOwRR2QjwVulL+LlfkRszflQNm8qPOZmOpa
 ucs1Wi9+VZPHbfQdD9OKRy5vm3ntpnZJSU2ZQlpeCGk/M2rfEg3LebEN7RWAvaxae4KPc
 qOepXsPWdV8boBTFL9F/nBsbJ+Aa9uNQzy/q9vc2O7WWEOLv3YY8TDe3j0cSc6UFlYq4q
 YkJymawOr+k4g1OJUycYaJWmhZfqiKc8SqJlXfFl5sHgDVfYeFAM/eaQQd0+mRpiY8TBB
 KePyNLUDmT6oL7wdq6NujifSa2NPkzoYiI2NqQdzWqfn9gjMMGZPWmL2lD1dDQDiM+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303922;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=l7vwwQXaiccp4GA/KfShg9LyGXHkwPp25RBE/PWhT+A=;
 b=jC2F2oGv0drmwX480zpEiiz1/rYULPaDcslqnVCGL/ITm8s5psl0RSAkVrTbj+f7sbmi
 3r67+6VU58jvF+e+pLIuIiIw2lmB7OEoLVlo/usfLHZeojuvaq19ndoflZkJhX9Vk5faU
 ZhQLTtolOQCNlRswzGZWbZnr3vLHy8t5+slG0ua9D++nFiTwxbsHZ6dkkfh3IM/AbFvxo
 hqKs7X3dL5I8565wTvMmYNYDCv1Uh6zKJDQ78Rz+cSXs5JDnR85LCCejhbARWDXtVRYZA
 vVAGSS9IJ1hRB8uQ2GZ/EKS0pXtsto8tbl/QXILyTjNpiUW+kop5aN+4NYgf08fC09A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aKsxdhOq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=aKsxdhOq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3741640274
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303704;
 bh=l7vwwQXaiccp4GA/KfShg9LyGXHkwPp25RBE/PWhT+A=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=aKsxdhOq1tHpgeXyiH67iJ7PRx0cJIvriRQQPuKqHDpMDg0KxYT3vG0AbYyuNPZYC
 9YIZ0dU+dAMUBR14Ew5iH6I9rvjb3rYnuzLt8PXqMmbiqwmLRjnpH8XM2On7U8URIa
 dlohVZUII3d8NTdHyFswbLozTqKKl5Q+wtZ3wnVcClLzntSkyckMfyo8moh/9B3XaV
 P8MEYPv8oqKZxuHFSJHr9jvam6+5d+kEre1LQeQ7PRkpWevqpxJR4zafz2oGTSGSdP
 C6yyvbUMjBjCUncSbyfYRPPwpyeQpJtJrsTv3MAdtLoB2y22texFRXNeJZMlCrxC9Y
 rPj1AHS2kIBFA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 U78IuGxhrO7PzZqKSsOTRFPY9CNagyOGNY+19NhXDZ7l1xVFFUUez6m3aNiVAEVPTi28Oza7CiG
 TcMmyTdKH3Q+5vuOLzXxkEMC7u5zDB428cc1BO2n+py+HkRCRop0uKyEyTeJMybHIjjorX5zUXW
 qEQ7HmVEeT9h4C22ltWpkfdKItbUc18LLh+VKjW0LfsNP4uLNLYP+FBQYq37bqO8TffylwymREW
 MQOm1pLcd4SX1kW6cseLiw1a4GWlILlEzp7nSQfRWLEqblW+NbHu0Yjtp+2atqTxztiq/FqIyKN
 pL7jwxscB4Xt/6N0fRKADBgYFQ8ZjzmdXt6hYnzpfw+dnFSEcvmGhOkAlrdnICnhnq2UYgEPY6W
 +zugPmjGeRVo+z4RxZROwAV49/YMT/yjJzfHNne00azosRuPqzn0160bgOtoiA8AQ3inxmg4HtQ
 hO6QKMsmZHZMNTgg7HHiWArjlhN4G2iIDucusUc43ECOPYV3mqJhgQfwUBT7ksWnE+sX1nCDaZI
 gUvxx1C8A7q7Ewt1auhirFde3mJKKKbqX/HiiTyRs+l9GDCZTS/6RbtAs3M7hzedddtzdmiQsXZ
 c+d4817VGokv3gKnrtfj7AJbWmtgtBNVnJAzquZ0K2YGaADzM3WWHTXFKUa5ulHR5I2KeJCBF2F
 ETqoQmU4XHBN+RhU=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 92217A4C51CF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7ur-000000000ir-0H48
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:50 +0200
Message-ID: <20261006162106.3439373-70-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 69/84] package/kodi: bump to 22.0rc1-Piers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch from kodi-texturepacker which is included in this release.

Removed patches 0002-0006 which are included in this release.

Added dependency to exiv2:
https://github.com/xbmc/xbmc/commit/197a3e6d2e80878f5f3f827b3a9073118b59bd51

Replaced dependency rapidjson with nlohmann-json:
https://github.com/xbmc/xbmc/commit/d6d2cac380ea127c2a64a998a31622debe149d3b

The mandatory dependency to libcdio was moved to optional optical drives
support:
https://github.com/xbmc/xbmc/commit/11289a597a88d809f39d3c23aa7eae6325a5263c

Remove -DCMAKE_MODULE_PATH from host-kodi-texturepacker, which was used
to find FindLzo2.cmake, after upstream commit
https://github.com/xbmc/xbmc/commit/3eb5196bf79759682aa0eb20b0b4830c083f81a5
added a version of FindLzo2.cmake specifically for the host build of
texturepacker.

Bumped versions of libdvd libraries following upstream commit:
https://github.com/xbmc/xbmc/commit/8550a0079481de6de1a1e9eb55cc6aec822e3ffe

Upstream commit
https://github.com/xbmc/xbmc/commit/4719e45848e3aeda84f07247fcad03b0744d6833
switched to the generation of Python bindings directly with SWIG and
dropped the usage of Java/Groovy.

Removed configure option PYTHON_EXECUTABLE due to upstream commit
https://github.com/xbmc/xbmc/commit/45c6459b6ea6d2ecb6a1ae7d4056ca4fb96535cf

Removed wayland-scanner options due to upstream commits
https://github.com/xbmc/xbmc/commit/8611aef2a092c0027d7bb22a93721cc11bfcc76b
https://github.com/xbmc/xbmc/commit/34e7dd3d166eaa8d0d57c4552129b05281e27142

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-jsonschemabuilder.mk                 |   2 +-
 ...rePacker-allow-build-with-giflib-6.x.patch |  71 ---
 .../kodi-texturepacker/kodi-texturepacker.mk  |   3 +-
 ...rePacker-allow-build-with-giflib-6.x.patch |  71 ---
 .../0003-RegExp-remove-unused-methods.patch   | 127 -----
 .../0004-Introduce-PCRE2-dependency.patch     | 192 -------
 ...igrate-PCRE-to-PCRE2-and-remove-PCRE.patch | 486 ------------------
 ...006-cmake-Set-ARCH-to-CPU-by-default.patch |  41 --
 package/kodi/Config.in                        |   8 +-
 package/kodi/kodi.hash                        |  15 +-
 package/kodi/kodi.mk                          |  52 +-
 11 files changed, 29 insertions(+), 1039 deletions(-)
 delete mode 100644 package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch
 delete mode 100644 package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch
 delete mode 100644 package/kodi/0003-RegExp-remove-unused-methods.patch
 delete mode 100644 package/kodi/0004-Introduce-PCRE2-dependency.patch
 delete mode 100644 package/kodi/0005-Migrate-PCRE-to-PCRE2-and-remove-PCRE.patch
 delete mode 100644 package/kodi/0006-cmake-Set-ARCH-to-CPU-by-default.patch

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 3e61e1af9f..b8fb336a22 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_JSONSCHEMABUILDER_VERSION = 21.3-Omega
+KODI_JSONSCHEMABUILDER_VERSION = 22.0rc1-Piers
 KODI_JSONSCHEMABUILDER_SITE = $(call github,xbmc,xbmc,$(KODI_JSONSCHEMABUILDER_VERSION))
 KODI_JSONSCHEMABUILDER_SOURCE = kodi-$(KODI_JSONSCHEMABUILDER_VERSION).tar.gz
 KODI_JSONSCHEMABUILDER_DL_SUBDIR = kodi
diff --git a/package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch b/package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch
deleted file mode 100644
index 5a23237375..0000000000
--- a/package/kodi-texturepacker/0001-TexturePacker-allow-build-with-giflib-6.x.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 29492cbd20d4c90a9c00a30ab525d4d0e81a968b Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Sun, 15 Mar 2026 11:38:16 +0000
-Subject: [PATCH] TexturePacker: allow build with giflib 6.x
-
-Current #if clauses are written with a maximum of giflib 5 written in,
-update the to >= to allow for newer versiosn of the giflib api.
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-
-Upstream: https://github.com/xbmc/xbmc/pull/28016
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- .../native/TexturePacker/src/decoder/GifHelper.cpp        | 8 ++++----
- .../depends/native/TexturePacker/src/decoder/GifHelper.h  | 2 +-
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
-index eb513134b3eb8..b216ecbcef7fa 100644
---- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
-+++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
-@@ -52,7 +52,7 @@ GifHelper::~GifHelper()
- bool GifHelper::Open(GifFileType*& gif, void *dataPtr, InputFunc readFunc)
- {
-   int err = 0;
--#if GIFLIB_MAJOR == 5
-+#if GIFLIB_MAJOR >= 5
-   gif = DGifOpen(dataPtr, readFunc, &err);
- #else
-   gif = DGifOpen(dataPtr, readFunc);
-@@ -73,7 +73,7 @@ void GifHelper::Close(GifFileType* gif)
- {
-   int err = 0;
-   int reason = 0;
--#if GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1
-+#if (GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1) || GIFLIB_MAJOR >= 6
-   err = DGifCloseFile(gif, &reason);
- #else
-   err = DGifCloseFile(gif);
-@@ -181,7 +181,7 @@ bool GifHelper::Slurp(GifFileType* gif)
-   if (DGifSlurp(gif) == GIF_ERROR)
-   {
-     int reason = 0;
--#if GIFLIB_MAJOR == 5
-+#if GIFLIB_MAJOR >= 5
-     reason = gif->Error;
- #else
-     reason = GifLastError();
-@@ -246,7 +246,7 @@ bool GifHelper::GcbToFrame(GifFrame &frame, unsigned int imgIdx)
- 
-   if (m_gif->ImageCount > 0)
-   {
--#if GIFLIB_MAJOR == 5
-+#if GIFLIB_MAJOR >= 5
-     GraphicsControlBlock gcb;
-     if (DGifSavedExtensionToGCB(m_gif, imgIdx, &gcb))
-     {
-diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
-index 6124b69e46296..ce5dca3394b41 100644
---- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
-+++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
-@@ -128,7 +128,7 @@ class GifHelper
-   bool PrepareTemplate(GifFrame &frame);
-   void Release();
- 
--#if GIFLIB_MAJOR != 5
-+#if GIFLIB_MAJOR < 5
-   /*
-   taken from giflib 5.1.0
-   */
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index 329a2d47f4..81556bc3be 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -6,7 +6,7 @@
 
 # Not possible to directly refer to kodi variables, because of
 # first/second expansion trickery...
-KODI_TEXTUREPACKER_VERSION = 21.3-Omega
+KODI_TEXTUREPACKER_VERSION = 22.0rc1-Piers
 KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
 KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
 KODI_TEXTUREPACKER_DL_SUBDIR = kodi
@@ -29,7 +29,6 @@ HOST_KODI_TEXTUREPACKER_CXXFLAGS = \
 
 HOST_KODI_TEXTUREPACKER_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="$(HOST_KODI_TEXTUREPACKER_CXXFLAGS)" \
-	-DCMAKE_MODULE_PATH=$(@D)/cmake/modules \
 	-DKODI_SOURCE_DIR=$(@D) \
 	-Wno-dev
 
diff --git a/package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch b/package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch
deleted file mode 100644
index 5a23237375..0000000000
--- a/package/kodi/0002-TexturePacker-allow-build-with-giflib-6.x.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 29492cbd20d4c90a9c00a30ab525d4d0e81a968b Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Sun, 15 Mar 2026 11:38:16 +0000
-Subject: [PATCH] TexturePacker: allow build with giflib 6.x
-
-Current #if clauses are written with a maximum of giflib 5 written in,
-update the to >= to allow for newer versiosn of the giflib api.
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-
-Upstream: https://github.com/xbmc/xbmc/pull/28016
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- .../native/TexturePacker/src/decoder/GifHelper.cpp        | 8 ++++----
- .../depends/native/TexturePacker/src/decoder/GifHelper.h  | 2 +-
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
-index eb513134b3eb8..b216ecbcef7fa 100644
---- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
-+++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.cpp
-@@ -52,7 +52,7 @@ GifHelper::~GifHelper()
- bool GifHelper::Open(GifFileType*& gif, void *dataPtr, InputFunc readFunc)
- {
-   int err = 0;
--#if GIFLIB_MAJOR == 5
-+#if GIFLIB_MAJOR >= 5
-   gif = DGifOpen(dataPtr, readFunc, &err);
- #else
-   gif = DGifOpen(dataPtr, readFunc);
-@@ -73,7 +73,7 @@ void GifHelper::Close(GifFileType* gif)
- {
-   int err = 0;
-   int reason = 0;
--#if GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1
-+#if (GIFLIB_MAJOR == 5 && GIFLIB_MINOR >= 1) || GIFLIB_MAJOR >= 6
-   err = DGifCloseFile(gif, &reason);
- #else
-   err = DGifCloseFile(gif);
-@@ -181,7 +181,7 @@ bool GifHelper::Slurp(GifFileType* gif)
-   if (DGifSlurp(gif) == GIF_ERROR)
-   {
-     int reason = 0;
--#if GIFLIB_MAJOR == 5
-+#if GIFLIB_MAJOR >= 5
-     reason = gif->Error;
- #else
-     reason = GifLastError();
-@@ -246,7 +246,7 @@ bool GifHelper::GcbToFrame(GifFrame &frame, unsigned int imgIdx)
- 
-   if (m_gif->ImageCount > 0)
-   {
--#if GIFLIB_MAJOR == 5
-+#if GIFLIB_MAJOR >= 5
-     GraphicsControlBlock gcb;
-     if (DGifSavedExtensionToGCB(m_gif, imgIdx, &gcb))
-     {
-diff --git a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
-index 6124b69e46296..ce5dca3394b41 100644
---- a/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
-+++ b/tools/depends/native/TexturePacker/src/decoder/GifHelper.h
-@@ -128,7 +128,7 @@ class GifHelper
-   bool PrepareTemplate(GifFrame &frame);
-   void Release();
- 
--#if GIFLIB_MAJOR != 5
-+#if GIFLIB_MAJOR < 5
-   /*
-   taken from giflib 5.1.0
-   */
diff --git a/package/kodi/0003-RegExp-remove-unused-methods.patch b/package/kodi/0003-RegExp-remove-unused-methods.patch
deleted file mode 100644
index 5f8e1af411..0000000000
--- a/package/kodi/0003-RegExp-remove-unused-methods.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 4dd017b2eae39356cda0d96a2f5743dbb8ccf299 Mon Sep 17 00:00:00 2001
-From: fuzzard <fuzzard@kodi.tv>
-Date: Sun, 2 Jun 2024 12:13:01 +1000
-Subject: [PATCH] RegExp remove unused methods
-
-Upstream: https://github.com/xbmc/xbmc/commit/5df2e57368cf5867f588d00a503eb624e5121460
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- xbmc/utils/RegExp.cpp          | 30 ------------------------------
- xbmc/utils/RegExp.h            |  5 -----
- xbmc/utils/test/TestRegExp.cpp | 17 -----------------
- 3 files changed, 52 deletions(-)
-
-diff --git a/xbmc/utils/RegExp.cpp b/xbmc/utils/RegExp.cpp
-index 9667b646a9..40263a28eb 100644
---- a/xbmc/utils/RegExp.cpp
-+++ b/xbmc/utils/RegExp.cpp
-@@ -485,11 +485,6 @@ int CRegExp::GetSubStart(int iSub) const
-   return m_iOvector[iSub*2] + m_offset;
- }
- 
--int CRegExp::GetSubStart(const std::string& subName) const
--{
--  return GetSubStart(GetNamedSubPatternNumber(subName.c_str()));
--}
--
- int CRegExp::GetSubLength(int iSub) const
- {
-   if (!IsValidSubNumber(iSub))
-@@ -498,11 +493,6 @@ int CRegExp::GetSubLength(int iSub) const
-   return m_iOvector[(iSub*2)+1] - m_iOvector[(iSub*2)];
- }
- 
--int CRegExp::GetSubLength(const std::string& subName) const
--{
--  return GetSubLength(GetNamedSubPatternNumber(subName.c_str()));
--}
--
- std::string CRegExp::GetMatch(int iSub /* = 0 */) const
- {
-   if (!IsValidSubNumber(iSub))
-@@ -516,26 +506,6 @@ std::string CRegExp::GetMatch(int iSub /* = 0 */) const
-   return m_subject.substr(pos, len);
- }
- 
--std::string CRegExp::GetMatch(const std::string& subName) const
--{
--  return GetMatch(GetNamedSubPatternNumber(subName.c_str()));
--}
--
--bool CRegExp::GetNamedSubPattern(const char* strName, std::string& strMatch) const
--{
--  strMatch.clear();
--  int iSub = pcre_get_stringnumber(m_re, strName);
--  if (!IsValidSubNumber(iSub))
--    return false;
--  strMatch = GetMatch(iSub);
--  return true;
--}
--
--int CRegExp::GetNamedSubPatternNumber(const char* strName) const
--{
--  return pcre_get_stringnumber(m_re, strName);
--}
--
- void CRegExp::DumpOvector(int iLog /* = LOGDEBUG */)
- {
-   if (iLog < LOGDEBUG || iLog > LOGNONE)
-diff --git a/xbmc/utils/RegExp.h b/xbmc/utils/RegExp.h
-index 53f6019a8f..feea89cd0d 100644
---- a/xbmc/utils/RegExp.h
-+++ b/xbmc/utils/RegExp.h
-@@ -111,15 +111,10 @@ public:
-   };
-   int GetSubCount() const { return m_iMatchCount - 1; } // PCRE returns the number of sub-patterns + 1
-   int GetSubStart(int iSub) const;
--  int GetSubStart(const std::string& subName) const;
-   int GetSubLength(int iSub) const;
--  int GetSubLength(const std::string& subName) const;
-   int GetCaptureTotal() const;
-   std::string GetMatch(int iSub = 0) const;
--  std::string GetMatch(const std::string& subName) const;
-   const std::string& GetPattern() const { return m_pattern; }
--  bool GetNamedSubPattern(const char* strName, std::string& strMatch) const;
--  int GetNamedSubPatternNumber(const char* strName) const;
-   void DumpOvector(int iLog);
-   /**
-    * Check is RegExp object is ready for matching
-diff --git a/xbmc/utils/test/TestRegExp.cpp b/xbmc/utils/test/TestRegExp.cpp
-index d757127417..9435a46aa4 100644
---- a/xbmc/utils/test/TestRegExp.cpp
-+++ b/xbmc/utils/test/TestRegExp.cpp
-@@ -96,19 +96,6 @@ TEST(TestRegExp, GetPattern)
-   EXPECT_STREQ("^(Test)\\s*(.*)\\.", regex.GetPattern().c_str());
- }
- 
--TEST(TestRegExp, GetNamedSubPattern)
--{
--  CRegExp regex;
--  std::string match;
--
--  EXPECT_TRUE(regex.RegComp("^(?<first>Test)\\s*(?<second>.*)\\."));
--  EXPECT_EQ(0, regex.RegFind("Test string."));
--  EXPECT_TRUE(regex.GetNamedSubPattern("first", match));
--  EXPECT_STREQ("Test", match.c_str());
--  EXPECT_TRUE(regex.GetNamedSubPattern("second", match));
--  EXPECT_STREQ("string", match.c_str());
--}
--
- TEST(TestRegExp, operatorEqual)
- {
-   CRegExp regex, regexcopy;
-@@ -117,10 +104,6 @@ TEST(TestRegExp, operatorEqual)
-   EXPECT_TRUE(regex.RegComp("^(?<first>Test)\\s*(?<second>.*)\\."));
-   regexcopy = regex;
-   EXPECT_EQ(0, regexcopy.RegFind("Test string."));
--  EXPECT_TRUE(regexcopy.GetNamedSubPattern("first", match));
--  EXPECT_STREQ("Test", match.c_str());
--  EXPECT_TRUE(regexcopy.GetNamedSubPattern("second", match));
--  EXPECT_STREQ("string", match.c_str());
- }
- 
- class TestRegExpLog : public testing::Test
--- 
-2.47.3
-
diff --git a/package/kodi/0004-Introduce-PCRE2-dependency.patch b/package/kodi/0004-Introduce-PCRE2-dependency.patch
deleted file mode 100644
index d72c9805b6..0000000000
--- a/package/kodi/0004-Introduce-PCRE2-dependency.patch
+++ /dev/null
@@ -1,192 +0,0 @@
-From 4a4642b1d7562b553f80da279255a9755a9e20f7 Mon Sep 17 00:00:00 2001
-From: fuzzard <fuzzard@kodi.tv>
-Date: Sun, 2 Jun 2024 13:24:57 +1000
-Subject: [PATCH] Introduce PCRE2 dependency
-
-create PCRE2 in tools/depends/target
-Create Find module for PCRE2
-
-Upstream: https://github.com/xbmc/xbmc/commit/5c24bf262e5cd75b413fcb4c2c5c144d6971d7cc
-
-[Bernd: backported relevant parts to 21.3-Omega]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- cmake/modules/FindPCRE2.cmake            | 151 +++++++++++++++++++++++
- tools/depends/target/pcre2/PCRE2-VERSION |   7 ++
- 2 files changed, 158 insertions(+)
- create mode 100644 cmake/modules/FindPCRE2.cmake
- create mode 100644 tools/depends/target/pcre2/PCRE2-VERSION
-
-diff --git a/cmake/modules/FindPCRE2.cmake b/cmake/modules/FindPCRE2.cmake
-new file mode 100644
-index 0000000000..7e50d5f2c1
---- /dev/null
-+++ b/cmake/modules/FindPCRE2.cmake
-@@ -0,0 +1,151 @@
-+#.rst:
-+# FindPCRE2
-+# --------
-+# Finds the PCRE2 library
-+#
-+# This will define the following imported target::
-+#
-+#   ${APP_NAME_LC}::PCRE2    - The PCRE2 library
-+
-+if(NOT TARGET ${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME})
-+
-+  macro(buildPCRE2)
-+    set(PCRE2_VERSION ${${MODULE}_VER})
-+    if(WIN32)
-+      set(PCRE_DEBUG_POSTFIX d)
-+    endif()
-+
-+    set(patches "${CORE_SOURCE_DIR}/tools/depends/target/${MODULE_LC}/001-all-enable_docs_pc.patch"
-+                "${CORE_SOURCE_DIR}/tools/depends/target/${MODULE_LC}/002-all-cmake-config-installdir.patch")
-+
-+    generate_patchcommand("${patches}")
-+
-+    set(CMAKE_ARGS -DBUILD_STATIC_LIBS=ON
-+                   -DPCRE2_BUILD_PCRE2_8=ON
-+                   -DPCRE2_BUILD_PCRE2_16=OFF
-+                   -DPCRE2_BUILD_PCRE2_32=OFF
-+                   -DPCRE2_SUPPORT_JIT=ON
-+                   -DPCRE2_SUPPORT_UNICODE=ON
-+                   -DPCRE2_BUILD_PCRE2GREP=OFF
-+                   -DPCRE2_BUILD_TESTS=OFF
-+                   -DENABLE_DOCS=OFF)
-+
-+    if(CORE_SYSTEM_NAME STREQUAL darwin_embedded)
-+      list(APPEND CMAKE_ARGS -DPCRE2_SUPPORT_JIT=OFF)
-+    endif()
-+
-+    set(${CMAKE_FIND_PACKAGE_NAME}_COMPILEDEFINITIONS PCRE2_STATIC)
-+
-+    BUILD_DEP_TARGET()
-+  endmacro()
-+
-+  include(cmake/scripts/common/ModuleHelpers.cmake)
-+
-+  set(MODULE_LC pcre2)
-+
-+  SETUP_BUILD_VARS()
-+
-+  if(KODI_DEPENDSBUILD OR (WIN32 OR WINDOWS_STORE))
-+    set(PCRE2_USE_STATIC_LIBS ON)
-+  endif()
-+
-+  # Check for existing PCRE2. If version >= PCRE2-VERSION file version, dont build
-+  find_package(PCRE2 CONFIG COMPONENTS 8BIT QUIET)
-+
-+  if((PCRE2_VERSION VERSION_LESS ${${MODULE}_VER} AND ENABLE_INTERNAL_PCRE2) OR
-+     ((CORE_SYSTEM_NAME STREQUAL linux OR CORE_SYSTEM_NAME STREQUAL freebsd) AND ENABLE_INTERNAL_PCRE2))
-+    buildPCRE2()
-+  else()
-+      # if PCRE2::8BIT target exists, it meets version requirements
-+      # we only do a pkgconfig search when a suitable cmake config returns nothing
-+      if(TARGET PCRE2::8BIT)
-+        get_target_property(_PCRE2_CONFIGURATIONS PCRE2::8BIT IMPORTED_CONFIGURATIONS)
-+        if(_PCRE2_CONFIGURATIONS)
-+        foreach(_pcre2_config IN LISTS _PCRE2_CONFIGURATIONS)
-+          # Just set to RELEASE var so select_library_configurations can continue to work its magic
-+          string(TOUPPER ${_pcre2_config} _pcre2_config_UPPER)
-+          if((NOT ${_pcre2_config_UPPER} STREQUAL "RELEASE") AND
-+             (NOT ${_pcre2_config_UPPER} STREQUAL "DEBUG"))
-+            get_target_property(PCRE2_LIBRARY_RELEASE PCRE2::8BIT IMPORTED_LOCATION_${_pcre2_config_UPPER})
-+          else()
-+            get_target_property(PCRE2_LIBRARY_${_pcre2_config_UPPER} PCRE2::8BIT IMPORTED_LOCATION_${_pcre2_config_UPPER})
-+          endif()
-+        endforeach()
-+      else()
-+        get_target_property(PCRE2_LIBRARY_RELEASE PCRE2::8BIT IMPORTED_LOCATION)
-+      endif()
-+      get_target_property(PCRE2_INCLUDE_DIR PCRE2::8BIT INTERFACE_INCLUDE_DIRECTORIES)
-+    else()
-+      # ToDo: use pkgconfig data imported and drop manual find_path/find_library
-+      find_package(PkgConfig)
-+      if(PKG_CONFIG_FOUND)
-+        pkg_check_modules(PC_PCRE2 libpcre2-8 QUIET)
-+      endif()
-+  
-+      find_path(PCRE2_INCLUDE_DIR pcre2.h
-+                                  HINTS ${PC_PCRE2_INCLUDEDIR})
-+      find_library(PCRE2_LIBRARY_RELEASE NAMES pcre2-8
-+                                         HINTS ${PC_PCRE2_LIBDIR})
-+      set(PCRE2_VERSION ${PC_PCRE2_VERSION})
-+    endif()
-+  endif()
-+
-+  include(SelectLibraryConfigurations)
-+  select_library_configurations(PCRE2)
-+
-+  include(FindPackageHandleStandardArgs)
-+  find_package_handle_standard_args(PCRE2
-+                                    REQUIRED_VARS PCRE2_LIBRARY PCRE2_INCLUDE_DIR
-+                                    VERSION_VAR PCRE2_VERSION)
-+
-+  if(PCRE2_FOUND)
-+    if(TARGET PCRE2::8BIT AND NOT TARGET pcre2)
-+      add_library(${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} ALIAS PCRE2::8BIT)
-+    else()
-+      add_library(${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} UNKNOWN IMPORTED)
-+      if(PCRE2_LIBRARY_RELEASE)
-+        set_target_properties(${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} PROPERTIES
-+                                                                         IMPORTED_CONFIGURATIONS RELEASE
-+                                                                         IMPORTED_LOCATION_RELEASE "${PCRE2_LIBRARY_RELEASE}")
-+      endif()
-+      if(PCRE2_LIBRARY_DEBUG)
-+        set_target_properties(${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} PROPERTIES
-+                                                                         IMPORTED_LOCATION_DEBUG "${PCRE2_LIBRARY_DEBUG}")
-+        set_property(TARGET ${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} APPEND PROPERTY
-+                                                                              IMPORTED_CONFIGURATIONS DEBUG)
-+      endif()
-+      set_target_properties(${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} PROPERTIES
-+                                                                       INTERFACE_INCLUDE_DIRECTORIES "${PCRE2_INCLUDE_DIR}")
-+
-+      # Add interface compile definitions. This will usually come from an INTERNAL build being required.
-+      if(${CMAKE_FIND_PACKAGE_NAME}_COMPILEDEFINITIONS)
-+        set_property(TARGET ${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} APPEND PROPERTY
-+                                                                              INTERFACE_COMPILE_DEFINITIONS ${${CMAKE_FIND_PACKAGE_NAME}_COMPILEDEFINITIONS})
-+      endif()
-+    endif()
-+    if(TARGET pcre2)
-+      add_dependencies(${APP_NAME_LC}::${CMAKE_FIND_PACKAGE_NAME} pcre2)
-+    endif()
-+
-+    # Add internal build target when a Multi Config Generator is used
-+    # We cant add a dependency based off a generator expression for targeted build types,
-+    # https://gitlab.kitware.com/cmake/cmake/-/issues/19467
-+    # therefore if the find heuristics only find the library, we add the internal build
-+    # target to the project to allow user to manually trigger for any build type they need
-+    # in case only a specific build type is actually available (eg Release found, Debug Required)
-+    # This is mainly targeted for windows who required different runtime libs for different
-+    # types, and they arent compatible
-+    if(_multiconfig_generator)
-+      if(NOT TARGET pcre2)
-+        buildPCRE2()
-+        set_target_properties(pcre2 PROPERTIES EXCLUDE_FROM_ALL TRUE)
-+      endif()
-+      add_dependencies(build_internal_depends pcre2)
-+    endif()
-+
-+  else()
-+    if(PCRE2_FIND_REQUIRED)
-+      message(FATAL_ERROR "PCRE2 not found. Possibly use -DENABLE_INTERNAL_PCRE2=ON to build PCRE2")
-+    endif()
-+  endif()
-+endif()
-diff --git a/tools/depends/target/pcre2/PCRE2-VERSION b/tools/depends/target/pcre2/PCRE2-VERSION
-new file mode 100644
-index 0000000000..800eebf0b9
---- /dev/null
-+++ b/tools/depends/target/pcre2/PCRE2-VERSION
-@@ -0,0 +1,7 @@
-+LIBNAME=pcre2
-+VERSION=10.42
-+ARCHIVE=$(LIBNAME)-$(VERSION).tar.bz2
-+SHA512=72fbde87fecec3aa4b47225dd919ea1d55e97f2cbcf02aba26e5a0d3b1ffb58c25a80a9ef069eb99f9cf4e41ba9604ad06a7ec159870e1e875d86820e12256d3
-+BYPRODUCT=libpcre2-8.a
-+BYPRODUCT_WIN=pcre2-8-static.lib
-+
--- 
-2.47.3
-
diff --git a/package/kodi/0005-Migrate-PCRE-to-PCRE2-and-remove-PCRE.patch b/package/kodi/0005-Migrate-PCRE-to-PCRE2-and-remove-PCRE.patch
deleted file mode 100644
index 8a71a3a0a8..0000000000
--- a/package/kodi/0005-Migrate-PCRE-to-PCRE2-and-remove-PCRE.patch
+++ /dev/null
@@ -1,486 +0,0 @@
-From 250d14b8e3f614147c9465ca6c1b86a3b5a5f7a2 Mon Sep 17 00:00:00 2001
-From: fuzzard <fuzzard@kodi.tv>
-Date: Sun, 2 Jun 2024 13:56:07 +1000
-Subject: [PATCH] Migrate PCRE to PCRE2 and remove PCRE
-
-Upstream: https://github.com/xbmc/xbmc/commit/8e0c4fd22a0b1f9c54b0536960752263f0d5a04f
-
-[Bernd: backported to 21.3-Omega]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt             |   4 +-
- xbmc/utils/RegExp.cpp      | 202 ++++++++++++++++++-------------------
- xbmc/utils/RegExp.h        |  22 ++--
- xbmc/utils/StringUtils.cpp |   6 +-
- 4 files changed, 111 insertions(+), 123 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index eb648e9a27..319b95044f 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -92,7 +92,7 @@ dependent_option(ENABLE_INTERNAL_CEC "Enable internal libcec?")
- dependent_option(ENABLE_INTERNAL_FLATBUFFERS "Enable internal flatbuffers?")
- dependent_option(ENABLE_INTERNAL_FMT "Enable internal fmt?")
- dependent_option(ENABLE_INTERNAL_NFS "Enable internal libnfs?")
--dependent_option(ENABLE_INTERNAL_PCRE "Enable internal pcre?")
-+dependent_option(ENABLE_INTERNAL_PCRE2 "Enable internal pcre2?")
- dependent_option(ENABLE_INTERNAL_RapidJSON "Enable internal rapidjson?")
- 
- # If ENABLE_INTERNAL_FMT is ON, we force ENABLE_INTERNAL_SPDLOG ON as it has a hard
-@@ -215,7 +215,7 @@ set(required_deps ASS>=0.15.0
-                   LibDvd
-                   Lzo2
-                   OpenSSL>=1.1.0
--                  PCRE
-+                  PCRE2
-                   RapidJSON>=1.0.2
-                   Spdlog
-                   Sqlite3
-diff --git a/xbmc/utils/RegExp.cpp b/xbmc/utils/RegExp.cpp
-index 40263a28eb..cb620208dc 100644
---- a/xbmc/utils/RegExp.cpp
-+++ b/xbmc/utils/RegExp.cpp
-@@ -16,27 +16,6 @@
- #include <stdlib.h>
- #include <string.h>
- 
--using namespace PCRE;
--
--#ifndef PCRE_UCP
--#define PCRE_UCP 0
--#endif // PCRE_UCP
--
--#ifdef PCRE_CONFIG_JIT
--#define PCRE_HAS_JIT_CODE 1
--#endif
--
--#ifndef PCRE_STUDY_JIT_COMPILE
--#define PCRE_STUDY_JIT_COMPILE 0
--#endif
--#ifndef PCRE_INFO_JIT
--// some unused number
--#define PCRE_INFO_JIT 2048
--#endif
--#ifndef PCRE_HAS_JIT_CODE
--#define pcre_free_study(x) pcre_free((x))
--#endif
--
- int CRegExp::m_Utf8Supported = -1;
- int CRegExp::m_UcpSupported  = -1;
- int CRegExp::m_JitSupported  = -1;
-@@ -51,25 +30,24 @@ void CRegExp::InitValues(bool caseless /*= false*/, CRegExp::utf8Mode utf8 /*= a
- {
-   m_utf8Mode    = utf8;
-   m_re          = NULL;
--  m_sd          = NULL;
--  m_iOptions    = PCRE_DOTALL | PCRE_NEWLINE_ANY;
-+  m_ctxt = nullptr;
-+  m_iOptions = PCRE2_DOTALL;
-   if(caseless)
--    m_iOptions |= PCRE_CASELESS;
-+    m_iOptions |= PCRE2_CASELESS;
-   if (m_utf8Mode == forceUtf8)
-   {
-     if (IsUtf8Supported())
--      m_iOptions |= PCRE_UTF8;
-+      m_iOptions |= PCRE2_UTF;
-     if (AreUnicodePropertiesSupported())
--      m_iOptions |= PCRE_UCP;
-+      m_iOptions |= PCRE2_UCP;
-   }
- 
-   m_offset      = 0;
-   m_jitCompiled = false;
-   m_bMatched    = false;
-   m_iMatchCount = 0;
--  m_jitStack    = NULL;
--
--  memset(m_iOvector, 0, sizeof(m_iOvector));
-+  m_iOvector = nullptr;
-+  m_jitStack = NULL;
- }
- 
- CRegExp::CRegExp(bool caseless, CRegExp::utf8Mode utf8, const char *re, studyMode study /*= NoStudy*/)
-@@ -225,7 +203,8 @@ bool CRegExp::isCharClassWithUnicode(const std::string& regexp, size_t& pos)
- CRegExp::CRegExp(const CRegExp& re)
- {
-   m_re = NULL;
--  m_sd = NULL;
-+  m_ctxt = nullptr;
-+  m_iOvector = nullptr;
-   m_jitStack = NULL;
-   m_utf8Mode = re.m_utf8Mode;
-   m_iOptions = re.m_iOptions;
-@@ -240,12 +219,13 @@ CRegExp& CRegExp::operator=(const CRegExp& re)
-   m_pattern = re.m_pattern;
-   if (re.m_re)
-   {
--    if (pcre_fullinfo(re.m_re, NULL, PCRE_INFO_SIZE, &size) >= 0)
-+    if (pcre2_pattern_info(re.m_re, PCRE2_INFO_SIZE, &size) >= 0)
-     {
--      if ((m_re = (pcre*)malloc(size)))
-+      if ((m_re = pcre2_code_copy(re.m_re)))
-       {
--        memcpy(m_re, re.m_re, size);
--        memcpy(m_iOvector, re.m_iOvector, OVECCOUNT*sizeof(int));
-+        if (re.m_ctxt)
-+          m_ctxt = pcre2_match_context_copy(re.m_ctxt);
-+        m_iOvector = re.m_iOvector;
-         m_offset = re.m_offset;
-         m_iMatchCount = re.m_iMatchCount;
-         m_bMatched = re.m_bMatched;
-@@ -273,18 +253,27 @@ bool CRegExp::RegComp(const char *re, studyMode study /*= NoStudy*/)
-   m_jitCompiled      = false;
-   m_bMatched         = false;
-   m_iMatchCount      = 0;
--  const char *errMsg = NULL;
--  int errOffset      = 0;
--  int options        = m_iOptions;
-+  pcre2_compile_context* ctxt;
-+  int errCode;
-+  char errMsg[120];
-+  PCRE2_SIZE errOffset;
-+  uint32_t options = m_iOptions;
-   if (m_utf8Mode == autoUtf8 && requireUtf8(re))
--    options |= (IsUtf8Supported() ? PCRE_UTF8 : 0) | (AreUnicodePropertiesSupported() ? PCRE_UCP : 0);
-+    options |=
-+        (IsUtf8Supported() ? PCRE2_UTF : 0) | (AreUnicodePropertiesSupported() ? PCRE2_UCP : 0);
- 
-   Cleanup();
- 
--  m_re = pcre_compile(re, options, &errMsg, &errOffset, NULL);
-+  ctxt = pcre2_compile_context_create(NULL);
-+  pcre2_set_newline(ctxt, PCRE2_NEWLINE_ANY);
-+  m_re = pcre2_compile(reinterpret_cast<PCRE2_SPTR>(re), PCRE2_ZERO_TERMINATED, options, &errCode,
-+                       &errOffset, ctxt);
-+  pcre2_compile_context_free(ctxt);
-+
-   if (!m_re)
-   {
-     m_pattern.clear();
-+    pcre2_get_error_message(errCode, reinterpret_cast<PCRE2_UCHAR*>(errMsg), sizeof(errMsg));
-     CLog::Log(LOGERROR, "PCRE: {}. Compilation failed at offset {} in expression '{}'", errMsg,
-               errOffset, re);
-     return false;
-@@ -295,23 +284,12 @@ bool CRegExp::RegComp(const char *re, studyMode study /*= NoStudy*/)
-   if (study)
-   {
-     const bool jitCompile = (study == StudyWithJitComp) && IsJitSupported();
--    const int studyOptions = jitCompile ? PCRE_STUDY_JIT_COMPILE : 0;
--
--    m_sd = pcre_study(m_re, studyOptions, &errMsg);
--    if (errMsg != NULL)
--    {
--      CLog::Log(LOGWARNING, "{}: PCRE error \"{}\" while studying expression", __FUNCTION__,
--                errMsg);
--      if (m_sd != NULL)
--      {
--        pcre_free_study(m_sd);
--        m_sd = NULL;
--      }
--    }
--    else if (jitCompile)
-+    if (jitCompile)
-     {
--      int jitPresent = 0;
--      m_jitCompiled = (pcre_fullinfo(m_re, m_sd, PCRE_INFO_JIT, &jitPresent) == 0 && jitPresent == 1);
-+      pcre2_jit_compile(m_re, PCRE2_JIT_COMPLETE);
-+      size_t jitPresent = 0;
-+      m_jitCompiled =
-+          (pcre2_pattern_info(m_re, PCRE2_INFO_JITSIZE, &jitPresent) == 0 && jitPresent > 0);
-     }
-   }
- 
-@@ -325,6 +303,9 @@ int CRegExp::RegFind(const char *str, unsigned int startoffset /*= 0*/, int maxN
- 
- int CRegExp::PrivateRegFind(size_t bufferLen, const char *str, unsigned int startoffset /* = 0*/, int maxNumberOfCharsToTest /*= -1*/)
- {
-+  pcre2_match_data* md;
-+  PCRE2_SIZE offset;
-+
-   m_offset      = 0;
-   m_bMatched    = false;
-   m_iMatchCount = 0;
-@@ -347,37 +328,46 @@ int CRegExp::PrivateRegFind(size_t bufferLen, const char *str, unsigned int star
-     return -1;
-   }
- 
--#ifdef PCRE_HAS_JIT_CODE
-+  if (!m_ctxt)
-+    m_ctxt = pcre2_match_context_create(NULL);
-+
-   if (m_jitCompiled && !m_jitStack)
-   {
--    m_jitStack = pcre_jit_stack_alloc(32*1024, 512*1024);
-+    m_jitStack = pcre2_jit_stack_create(32 * 1024, 512 * 1024, NULL);
-     if (m_jitStack == NULL)
-       CLog::Log(LOGWARNING, "{}: can't allocate address space for JIT stack", __FUNCTION__);
- 
--    pcre_assign_jit_stack(m_sd, NULL, m_jitStack);
-+    pcre2_jit_stack_assign(m_ctxt, NULL, m_jitStack);
-   }
--#endif
- 
-   if (maxNumberOfCharsToTest >= 0)
-     bufferLen = std::min<size_t>(bufferLen, startoffset + maxNumberOfCharsToTest);
- 
-   m_subject.assign(str + startoffset, bufferLen - startoffset);
--  int rc = pcre_exec(m_re, NULL, m_subject.c_str(), m_subject.length(), 0, 0, m_iOvector, OVECCOUNT);
-+  md = pcre2_match_data_create(OVECCOUNT, nullptr);
-+  int rc = pcre2_match(m_re, reinterpret_cast<PCRE2_SPTR>(m_subject.c_str()), m_subject.length(), 0,
-+                       0, md, m_ctxt);
-+  m_iOvector = pcre2_get_ovector_pointer(md);
-+  offset = pcre2_get_startchar(md);
-+  pcre2_match_data_free(md);
- 
-   if (rc<1)
-   {
-     static const int fragmentLen = 80; // length of excerpt before erroneous char for log
-     switch(rc)
-     {
--    case PCRE_ERROR_NOMATCH:
--      return -1;
-+      case PCRE2_ERROR_NOMATCH:
-+        return -1;
- 
--    case PCRE_ERROR_MATCHLIMIT:
--      CLog::Log(LOGERROR, "PCRE: Match limit reached");
--      return -1;
-+      case PCRE2_ERROR_MATCHLIMIT:
-+        CLog::Log(LOGERROR, "PCRE: Match limit reached");
-+        return -1;
- 
--#ifdef PCRE_ERROR_SHORTUTF8
--    case PCRE_ERROR_SHORTUTF8:
-+      case PCRE2_ERROR_UTF8_ERR1:
-+      case PCRE2_ERROR_UTF8_ERR2:
-+      case PCRE2_ERROR_UTF8_ERR3:
-+      case PCRE2_ERROR_UTF8_ERR4:
-+      case PCRE2_ERROR_UTF8_ERR5:
-       {
-         const size_t startPos = (m_subject.length() > fragmentLen) ? CUtf8Utils::RFindValidUtf8Char(m_subject, m_subject.length() - fragmentLen) : 0;
-         if (startPos != std::string::npos)
-@@ -389,28 +379,44 @@ int CRegExp::PrivateRegFind(size_t bufferLen, const char *str, unsigned int star
-           CLog::Log(LOGERROR, "PCRE: Bad UTF-8 character at the end of string");
-         return -1;
-       }
--#endif
--    case PCRE_ERROR_BADUTF8:
-+      case PCRE2_ERROR_UTF8_ERR6:
-+      case PCRE2_ERROR_UTF8_ERR7:
-+      case PCRE2_ERROR_UTF8_ERR8:
-+      case PCRE2_ERROR_UTF8_ERR9:
-+      case PCRE2_ERROR_UTF8_ERR10:
-+      case PCRE2_ERROR_UTF8_ERR11:
-+      case PCRE2_ERROR_UTF8_ERR12:
-+      case PCRE2_ERROR_UTF8_ERR13:
-+      case PCRE2_ERROR_UTF8_ERR14:
-+      case PCRE2_ERROR_UTF8_ERR15:
-+      case PCRE2_ERROR_UTF8_ERR16:
-+      case PCRE2_ERROR_UTF8_ERR17:
-+      case PCRE2_ERROR_UTF8_ERR18:
-+      case PCRE2_ERROR_UTF8_ERR19:
-+      case PCRE2_ERROR_UTF8_ERR20:
-+      case PCRE2_ERROR_UTF8_ERR21:
-       {
-+        char errbuf[120];
-+
-+        pcre2_get_error_message(rc, reinterpret_cast<PCRE2_UCHAR*>(errbuf), sizeof(errbuf));
-         const size_t startPos = (m_iOvector[0] > fragmentLen) ? CUtf8Utils::RFindValidUtf8Char(m_subject, m_iOvector[0] - fragmentLen) : 0;
--        if (m_iOvector[0] >= 0 && startPos != std::string::npos)
-+        if ((int)m_iOvector[0] >= 0 && startPos != std::string::npos)
-           CLog::Log(LOGERROR,
-                     "PCRE: Bad UTF-8 character, error code: {}, position: {}. Text before bad "
-                     "char: \"{}\"",
--                    m_iOvector[1], m_iOvector[0],
--                    m_subject.substr(startPos, m_iOvector[0] - startPos + 1));
-+                    errbuf, offset, m_subject.substr(startPos, m_iOvector[0] - startPos + 1));
-         else
--          CLog::Log(LOGERROR, "PCRE: Bad UTF-8 character, error code: {}, position: {}",
--                    m_iOvector[1], m_iOvector[0]);
-+          CLog::Log(LOGERROR, "PCRE: Bad UTF-8 character, error code: {}, position: {}", errbuf,
-+                    offset);
-         return -1;
-       }
--    case PCRE_ERROR_BADUTF8_OFFSET:
--      CLog::Log(LOGERROR, "PCRE: Offset is pointing to the middle of UTF-8 character");
--      return -1;
-+      case PCRE2_ERROR_BADUTFOFFSET:
-+        CLog::Log(LOGERROR, "PCRE: Offset is pointing to the middle of UTF-8 character");
-+        return -1;
- 
--    default:
--      CLog::Log(LOGERROR, "PCRE: Unknown error: {}", rc);
--      return -1;
-+      default:
-+        CLog::Log(LOGERROR, "PCRE: Unknown error: {}", rc);
-+        return -1;
-     }
-   }
-   m_offset = startoffset;
-@@ -423,7 +429,7 @@ int CRegExp::GetCaptureTotal() const
- {
-   int c = -1;
-   if (m_re)
--    pcre_fullinfo(m_re, NULL, PCRE_INFO_CAPTURECOUNT, &c);
-+    pcre2_pattern_info(m_re, PCRE2_INFO_CAPTURECOUNT, &c);
-   return c;
- }
- 
-@@ -528,23 +534,21 @@ void CRegExp::Cleanup()
- {
-   if (m_re)
-   {
--    pcre_free(m_re);
--    m_re = NULL;
-+    pcre2_code_free(m_re);
-+    m_re = nullptr;
-   }
- 
--  if (m_sd)
-+  if (m_ctxt)
-   {
--    pcre_free_study(m_sd);
--    m_sd = NULL;
-+    pcre2_match_context_free(m_ctxt);
-+    m_ctxt = nullptr;
-   }
- 
--#ifdef PCRE_HAS_JIT_CODE
-   if (m_jitStack)
-   {
--    pcre_jit_stack_free(m_jitStack);
-+    pcre2_jit_stack_free(m_jitStack);
-     m_jitStack = NULL;
-   }
--#endif
- }
- 
- inline bool CRegExp::IsValidSubNumber(int iSub) const
-@@ -557,7 +561,7 @@ bool CRegExp::IsUtf8Supported(void)
- {
-   if (m_Utf8Supported == -1)
-   {
--    if (pcre_config(PCRE_CONFIG_UTF8, &m_Utf8Supported) != 0)
-+    if (pcre2_config(PCRE2_CONFIG_UNICODE, &m_Utf8Supported) < 0)
-       m_Utf8Supported = 0;
-   }
- 
-@@ -566,13 +570,11 @@ bool CRegExp::IsUtf8Supported(void)
- 
- bool CRegExp::AreUnicodePropertiesSupported(void)
- {
--#if defined(PCRE_CONFIG_UNICODE_PROPERTIES) && PCRE_UCP != 0
-   if (m_UcpSupported == -1)
-   {
--    if (pcre_config(PCRE_CONFIG_UNICODE_PROPERTIES, &m_UcpSupported) != 0)
-+    if (pcre2_config(PCRE2_CONFIG_UNICODE, &m_UcpSupported) < 0)
-       m_UcpSupported = 0;
-   }
--#endif
- 
-   return m_UcpSupported == 1;
- }
-@@ -595,13 +597,13 @@ bool CRegExp::LogCheckUtf8Support(void)
- 
-   if (!utf8FullSupport)
-   {
-+    char ver[24];
-+
-+    pcre2_config(PCRE2_CONFIG_VERSION, ver);
-     CLog::Log(LOGINFO,
--              "Consider installing PCRE lib version 8.10 or later with enabled Unicode properties "
-+              "Consider installing PCRE lib version 10.10 or later with enabled Unicode properties "
-               "and UTF-8 support. Your PCRE lib version: {}",
--              PCRE::pcre_version());
--#if PCRE_UCP == 0
--    CLog::Log(LOGINFO, "You will need to rebuild XBMC after PCRE lib update.");
--#endif
-+              ver);
-   }
- 
-   return utf8FullSupport;
-@@ -611,9 +613,7 @@ bool CRegExp::IsJitSupported(void)
- {
-   if (m_JitSupported == -1)
-   {
--#ifdef PCRE_HAS_JIT_CODE
--    if (pcre_config(PCRE_CONFIG_JIT, &m_JitSupported) != 0)
--#endif
-+    if (pcre2_config(PCRE2_CONFIG_JIT, &m_JitSupported) < 0)
-       m_JitSupported = 0;
-   }
- 
-diff --git a/xbmc/utils/RegExp.h b/xbmc/utils/RegExp.h
-index feea89cd0d..90d3db541e 100644
---- a/xbmc/utils/RegExp.h
-+++ b/xbmc/utils/RegExp.h
-@@ -13,16 +13,8 @@
- #include <string>
- #include <vector>
- 
--/* make sure stdlib.h is included before including pcre.h inside the
--   namespace; this works around stdlib.h definitions also living in
--   the PCRE namespace */
--#include <stdlib.h>
--
--namespace PCRE {
--struct real_pcre_jit_stack; // forward declaration for PCRE without JIT
--typedef struct real_pcre_jit_stack pcre_jit_stack;
--#include <pcre.h>
--}
-+#define PCRE2_CODE_UNIT_WIDTH 8
-+#include <pcre2.h>
- 
- class CRegExp
- {
-@@ -138,17 +130,17 @@ private:
-   void Cleanup();
-   inline bool IsValidSubNumber(int iSub) const;
- 
--  PCRE::pcre* m_re;
--  PCRE::pcre_extra* m_sd;
-+  pcre2_code* m_re;
-+  pcre2_match_context* m_ctxt;
-   static const int OVECCOUNT=(m_MaxNumOfBackrefrences + 1) * 3;
-   unsigned int m_offset;
--  int         m_iOvector[OVECCOUNT];
-+  PCRE2_SIZE* m_iOvector;
-   utf8Mode    m_utf8Mode;
-   int         m_iMatchCount;
--  int         m_iOptions;
-+  uint32_t m_iOptions;
-   bool        m_jitCompiled;
-   bool        m_bMatched;
--  PCRE::pcre_jit_stack* m_jitStack;
-+  pcre2_jit_stack* m_jitStack;
-   std::string m_subject;
-   std::string m_pattern;
-   static int  m_Utf8Supported;
-diff --git a/xbmc/utils/StringUtils.cpp b/xbmc/utils/StringUtils.cpp
-index 2c77e58ebd..d390113dd7 100644
---- a/xbmc/utils/StringUtils.cpp
-+++ b/xbmc/utils/StringUtils.cpp
-@@ -30,6 +30,7 @@
- #include "LangInfo.h"
- #include "StringUtils.h"
- #include "XBDateTime.h"
-+#include "utils/RegExp.h"
- 
- #include <algorithm>
- #include <array>
-@@ -46,11 +47,6 @@
- #include <fstrcmp.h>
- #include <memory.h>
- 
--// don't move or std functions end up in PCRE namespace
--// clang-format off
--#include "utils/RegExp.h"
--// clang-format on
--
- #define FORMAT_BLOCK_SIZE 512 // # of bytes for initial allocation for printf
- 
- namespace
--- 
-2.47.3
-
diff --git a/package/kodi/0006-cmake-Set-ARCH-to-CPU-by-default.patch b/package/kodi/0006-cmake-Set-ARCH-to-CPU-by-default.patch
deleted file mode 100644
index c5bbbe9636..0000000000
--- a/package/kodi/0006-cmake-Set-ARCH-to-CPU-by-default.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 1695ba12380272056f369f434747839b2ae38d91 Mon Sep 17 00:00:00 2001
-From: fossdd <fossdd@pwned.life>
-Date: Sat, 22 Feb 2025 20:59:28 +0100
-Subject: [PATCH] [cmake] Set ARCH to CPU by default
-
-Reduces complexity of redundant architecture names and allows building
-for other architectures implicitly.
-
-Upstream: https://github.com/xbmc/xbmc/commit/1695ba12380272056f369f434747839b2ae38d91
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- cmake/scripts/linux/ArchSetup.cmake | 11 +----------
- 1 file changed, 1 insertion(+), 10 deletions(-)
-
-diff --git a/cmake/scripts/linux/ArchSetup.cmake b/cmake/scripts/linux/ArchSetup.cmake
-index ab142177c8..f29a870a1e 100644
---- a/cmake/scripts/linux/ArchSetup.cmake
-+++ b/cmake/scripts/linux/ArchSetup.cmake
-@@ -37,17 +37,8 @@ else()
-   elseif(CPU MATCHES aarch64 OR CPU MATCHES arm64)
-     set(ARCH aarch64)
-     set(NEON True)
--  elseif(CPU MATCHES riscv64)
--    set(ARCH riscv64)
--    set(NEON False)
--  elseif(CPU MATCHES ppc64le)
--    set(ARCH ppc64le)
--    set(NEON False)
--  elseif(CPU MATCHES loongarch64)
--    set(ARCH loongarch64)
--    set(NEON False)
-   else()
--    message(SEND_ERROR "Unknown CPU: ${CPU}")
-+    set(ARCH ${CPU})
-   endif()
- endif()
- 
--- 
-2.47.3
-
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 16b86f3fe5..110aa91a49 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	# i386: needs sse (see upstream PR 10351)
 	depends on !(BR2_i386 && !BR2_X86_CPU_HAS_SSE)
 	# m68k not supported upstream
@@ -71,9 +70,10 @@ menuconfig BR2_PACKAGE_KODI
 	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_PACKAGE_PYTHON3_PYC_ONLY
 	select BR2_HOST_CMAKE_AT_LEAST_3_24
+	select BR2_PACKAGE_EXIV2
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_GPL
-	select BR2_PACKAGE_FFMPEG_POSTPROC
+	select BR2_PACKAGE_FFMPEG_POSTPROC if BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_FLATBUFFERS
 	select BR2_PACKAGE_FMT
@@ -82,8 +82,8 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_FSTRCMP
 	select BR2_PACKAGE_GIFLIB
 	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_LIBASS
-	select BR2_PACKAGE_LIBCDIO
 	select BR2_PACKAGE_LIBCROSSGUID
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBDRM
@@ -100,7 +100,6 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_PYTHON3_SSL
 	select BR2_PACKAGE_PYTHON3_UNICODEDATA
 	select BR2_PACKAGE_PYTHON3_ZLIB
-	select BR2_PACKAGE_RAPIDJSON
 	select BR2_PACKAGE_SPDLOG
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_TAGLIB
@@ -282,6 +281,7 @@ config BR2_PACKAGE_KODI_UPNP
 
 config BR2_PACKAGE_KODI_OPTICALDRIVE
 	bool "optical drives"
+	select BR2_PACKAGE_LIBCDIO
 	help
 	  Add support for optical drives, to read e.g. DVDs...
 
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index aa962b15fc..50669883dc 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,10 +1,9 @@
-# From https://github.com/xbmc/xbmc/blob/Omega/xbmc/interfaces/swig/CMakeLists.txt
-sha512  60d1aea85008a438a9498178dc2137385653f1ea294e7e257959e9e0f94382e160e217e1090047c2a944e328cf46e8ebcfc4b015f7d0cb9f2fcf9d880c6c1344  apache-groovy-binary-4.0.26.zip
-sha512  8927a406a1bd084b548f89cf15fe4bc7567dcaa50ae8abae54e9c883c1574c648fcc8ad6c3abaa381dfbdf1801727ac5e6c4572063203a1dfac293d122282f05  commons-lang3-3.17.0-bin.tar.gz
-sha512  a51667463e88b2d017c3baebb9bbe42c4e50cba96ffe19c89680e82002a4db8b9007daff75f8dbf8bf3725be13a3f03f3c2bc4e1f11e8e02dcab4408abdb44a1  commons-text-1.13.0-bin.tar.gz
+# From https://github.com/xbmc/xbmc/blob/master/tools/depends/target/libdvdcss/LIBDVDCSS-VERSION
+sha512  439fbd9dae60b9a114d3429a19703478c734e8525ac6852da6f05f72d9ca44ca0ac5e874ab6a10017e7f31869fcd29f01d1bc156c4f0331b4e4abd98ec2f95cd  libdvdcss-1.5.0.tar.bz2
+# From https://github.com/xbmc/xbmc/blob/master/tools/depends/target/libdvdnav/LIBDVDNAV-VERSION
+sha512  8d12d476e352def9716ecbd7ba184a70dd9bae87dcde669b8647a0ef9ac1991f617c9918c043e159eb353302c4cc50fb71bc591ceaeba1d3b9d47af77fa72c71  libdvdnav-7.0.0.tar.bz2
+# From https://github.com/xbmc/xbmc/blob/master/tools/depends/target/libdvdread/LIBDVDREAD-VERSION
+sha512  b5390a1acb8fdf6e24188f9259199eb0fef2dd4b332447ba2bfa571f9fc0c3bfad00c1d27a8b8806180a853c04a818b7802d3075ff787142c1a175ad798c6a3d  libdvdread-7.0.1.tar.bz2
 # Locally computed
-sha256  a60afcb556e4a00cb19fc35b7e77758107c9a8096c6ce9b66af5f92396be31aa  kodi-21.3-Omega.tar.gz
-sha256  f38c4a4e7a4f4da6d8e83b8852489aa3bb6588a915dc41f5ee89d9aad305a06e  kodi-libdvdcss-1.4.3-Next-Nexus-Alpha2-2.tar.gz
-sha256  584f62a3896794408d46368e2ecf2c6217ab9c676ce85921b2d68b8961f49dfc  kodi-libdvdnav-6.1.1-Next-Nexus-Alpha2-2.tar.gz
-sha256  719130091e3adc9725ba72df808f24a14737a009dca5a4c38c601c0c76449b62  kodi-libdvdread-6.1.3-Next-Nexus-Alpha2-2.tar.gz
+sha256  21daa839b978ff3fc6a7a058717fe9232f1ae4087d492b31c288eeffb2a7a447  kodi-22.0rc1-Piers.tar.gz
 sha256  9d2396ef3e091d3b82bc84143e070700412984e8589513570f54e0675d1e8851  LICENSE.md
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 32dd9a3ada..fd4659da99 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -6,8 +6,8 @@
 
 # When updating the version, please also update kodi-jsonschemabuilder
 # and kodi-texturepacker
-KODI_VERSION_MAJOR = 21.3
-KODI_VERSION_NAME = Omega
+KODI_VERSION_MAJOR = 22.0rc1
+KODI_VERSION_NAME = Piers
 KODI_VERSION = $(KODI_VERSION_MAJOR)-$(KODI_VERSION_NAME)
 KODI_SITE = $(call github,xbmc,xbmc,$(KODI_VERSION))
 KODI_LICENSE = GPL-2.0
@@ -19,6 +19,7 @@ KODI_INSTALL_STAGING = YES
 # kodi recommends building out-of-source
 KODI_SUPPORTS_IN_SOURCE_BUILD = NO
 KODI_DEPENDENCIES = \
+	exiv2 \
 	ffmpeg \
 	flatbuffers \
 	fmt \
@@ -33,12 +34,11 @@ KODI_DEPENDENCIES = \
 	host-kodi-jsonschemabuilder \
 	host-kodi-texturepacker \
 	host-nasm \
-	host-openjdk-bin \
 	host-swig \
 	host-xmlstarlet \
 	jpeg \
+	json-for-modern-cpp \
 	libass \
-	libcdio \
 	libcrossguid \
 	libcurl \
 	libdrm \
@@ -50,7 +50,6 @@ KODI_DEPENDENCIES = \
 	openssl \
 	pcre2 \
 	python3 \
-	rapidjson \
 	spdlog \
 	sqlite \
 	taglib \
@@ -59,27 +58,13 @@ KODI_DEPENDENCIES = \
 	zlib
 
 # taken from tools/depends/target/*/*-VERSION
-KODI_APACHE_GROOVY_VERSION = 4.0.26
-KODI_COMMONS_LANG3_VERSION = 3.17.0
-KODI_COMMONS_TEXT_VERSION = 1.13.0
-KODI_LIBDVDCSS_VERSION = 1.4.3-Next-Nexus-Alpha2-2
-KODI_LIBDVDNAV_VERSION = 6.1.1-Next-Nexus-Alpha2-2
-KODI_LIBDVDREAD_VERSION = 6.1.3-Next-Nexus-Alpha2-2
+KODI_LIBDVDCSS_VERSION = 1.5.0
+KODI_LIBDVDNAV_VERSION = 7.0.0
+KODI_LIBDVDREAD_VERSION = 7.0.1
 KODI_EXTRA_DOWNLOADS += \
-	https://groovy.jfrog.io/artifactory/dist-release-local/groovy-zips/apache-groovy-binary-$(KODI_APACHE_GROOVY_VERSION).zip \
-	https://archive.apache.org/dist/commons/lang/binaries/commons-lang3-$(KODI_COMMONS_LANG3_VERSION)-bin.tar.gz \
-	https://archive.apache.org/dist/commons/text/binaries/commons-text-$(KODI_COMMONS_TEXT_VERSION)-bin.tar.gz \
-	$(call github,xbmc,libdvdcss,$(KODI_LIBDVDCSS_VERSION))/kodi-libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.gz \
-	$(call github,xbmc,libdvdnav,$(KODI_LIBDVDNAV_VERSION))/kodi-libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.gz \
-	$(call github,xbmc,libdvdread,$(KODI_LIBDVDREAD_VERSION))/kodi-libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.gz
-
-define KODI_PROVIDE_JAVA_TARBALLS
-	mkdir -p $(@D)/buildroot-build/build/download
-	cp $(KODI_DL_DIR)/apache-groovy-binary-$(KODI_APACHE_GROOVY_VERSION).zip $(@D)/buildroot-build/build/download
-	cp $(KODI_DL_DIR)/commons-lang3-$(KODI_COMMONS_LANG3_VERSION)-bin.tar.gz $(@D)/buildroot-build/build/download
-	cp $(KODI_DL_DIR)/commons-text-$(KODI_COMMONS_TEXT_VERSION)-bin.tar.gz $(@D)/buildroot-build/build/download
-endef
-KODI_POST_EXTRACT_HOOKS = KODI_PROVIDE_JAVA_TARBALLS
+	https://mirrors.kodi.tv/build-deps/sources/libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.bz2 \
+	https://mirrors.kodi.tv/build-deps/sources/libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.bz2 \
+	https://mirrors.kodi.tv/build-deps/sources/libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.bz2
 
 KODI_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(KODI_C_FLAGS)" \
@@ -88,10 +73,9 @@ KODI_CONF_OPTS += \
 	-DENABLE_CCACHE=OFF \
 	-DENABLE_DVDCSS=ON \
 	-DENABLE_INTERNAL_CROSSGUID=OFF \
-	-DWITH_FFMPEG=$(STAGING_DIR)/usr \
+	-DFFMPEG_PATH=$(STAGING_DIR)/usr \
 	-DENABLE_INTERNAL_FLATBUFFERS=OFF \
 	-DFLATBUFFERS_FLATC_EXECUTABLE=$(HOST_DIR)/bin/flatc \
-	-DENABLE_INTERNAL_RapidJSON=OFF \
 	-DENABLE_INTERNAL_SPDLOG=OFF \
 	-DKODI_DEPENDSBUILD=OFF \
 	-DENABLE_GOLD=OFF \
@@ -100,17 +84,14 @@ KODI_CONF_OPTS += \
 	-DNATIVEPREFIX=$(HOST_DIR) \
 	-DDEPENDS_PATH=$(STAGING_DIR)/usr \
 	-DENABLE_TESTING=OFF \
-	-DENABLE_DEBUGFISSION=OFF \
-	-DJAVA_HOME=$(HOST_OPENJDK_BIN_ROOT_DIR) \
-	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python \
-	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	-DPYTHON_PATH=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
 	-DPYTHON_VER=$(PYTHON3_VERSION_MAJOR) \
+	-DVERBOSE_FIND=ON \
 	-DWITH_JSONSCHEMABUILDER=$(HOST_DIR)/bin/ \
 	-DWITH_TEXTUREPACKER=$(HOST_DIR)/bin/ \
-	-DLIBDVDCSS_URL=$(KODI_DL_DIR)/kodi-libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.gz \
-	-DLIBDVDNAV_URL=$(KODI_DL_DIR)/kodi-libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.gz \
-	-DLIBDVDREAD_URL=$(KODI_DL_DIR)/kodi-libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.gz
+	-DLIBDVDCSS_URL=$(KODI_DL_DIR)/libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.bz2 \
+	-DLIBDVDNAV_URL=$(KODI_DL_DIR)/libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.bz2 \
+	-DLIBDVDREAD_URL=$(KODI_DL_DIR)/libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.bz2
 
 ifeq ($(BR2_PACKAGE_KODI_RENDER_SYSTEM_GL),y)
 KODI_CONF_OPTS += -DAPP_RENDER_SYSTEM=gl
@@ -127,8 +108,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND),y)
 KODI_CONF_OPTS += \
-	-DPC_WAYLANDPP_SCANNER=$(HOST_DIR)/bin/wayland-scanner \
-	-DPC_WAYLANDPP_SCANNER_FOUND=ON \
 	-DWAYLANDPP_PROTOCOLS_DIR=$(STAGING_DIR)/usr/share/waylandpp/protocols
 KODI_CORE_PLATFORM_NAME += wayland
 KODI_DEPENDENCIES += libxkbcommon waylandpp
@@ -371,6 +350,7 @@ KODI_CONF_OPTS += -DENABLE_UPNP=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_KODI_OPTICALDRIVE),y)
+KODI_DEPENDENCIES += libcdio
 KODI_CONF_OPTS += -DENABLE_OPTICAL=ON
 else
 KODI_CONF_OPTS += -DENABLE_OPTICAL=OFF
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
