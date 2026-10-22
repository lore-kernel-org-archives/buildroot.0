Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0F7606A31E
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gmDXWgcP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E110081358;
	Fri, 23 Oct 2026 12:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypoepdevXia0; Fri, 23 Oct 2026 12:24:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AE5FB814D4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758281;
	b=P2cID1OSyJ3RaUWvlI16Z9ZUXx6ac1Gn2i3aLcNMmiUIkVJXyaREy7LtFmcQwL0/FTLm
	 A8EfeSl5V8RVBeKIwgDb16L8bs1wuUBwM33h95sJ8cGr/FYTf2AshUFcOkkstIsrMqbLh
	 HTG2+VPnyv/2Rma/ZgQaOjzzMN6IkpbDAgC1q1ZHMsuv7UUTFK+sJi6ZMVL4NXGJQvzQz
	 jq6/x141F29Y0ehdUKL4riBrMVn/zUU8riPlczg7lxVonfLKIdETNv3HtGei2iVtf0Qti
	 vj9I2W5nRUFS7bXMP+xTMw0Rz3EX2BVhkzZP+3d2IdTCpL1BCIt0NXlKeapaFBHDLKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=x8koudQJsDOpMcF0NBJO//lKh51UtKYPZnc52sxrM2o=;
	b=p2sUe04Cu4jjK3ZktBES8ukJwdoxc4Dlhb6POWBsh+iZY+t5h4jHUZwFnEeA5++IDVHu
	 kC28YmUUx06HVf5dCr6mhSKqgqFnfFlw8tXFDNnWNzrtl/T8wq68PEOf1c63nCNfaC4yv
	 6a4BNixKjdRX1Lul27SJkgvLnt+71d3cGtfWRNwzdlR0XzG6m/zk8+af/e6pQt5CafQ/p
	 wyJDNlLIuEjMMF+qToXKtPZy2LHCIeT+ZXCpVeaV9AL0OeZj8Ofj1VVlgp/UBuWojajci
	 UWLPTYlN1j2V2kUZjWPCp8QuL5GkVd0vels3MDhuAA3LSg0oF5JOU8dVzaPdxwOXTxQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758281;
	bh=x8koudQJsDOpMcF0NBJO//lKh51UtKYPZnc52sxrM2o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gmDXWgcPaKdJdxAkPwX/Sn3g2bNYcSn9m2V5BoUGa0NLFjsZgBZWh6H9nWgE0zTFS
	 NvW/hOYpPTvPj0bdkyUKd/XG343k3UBO3Sv949+ARosNxQxjv9rt7CKmdRdxTDyuIM
	 bGKmYFBAyzgkTTqh4k6dCHrzxYyxWKOiU0qEhinUD2zwYyj2hvEc2vyNh36tKNMWVM
	 eFp9u9EoigXk3JWAwSEqtxNNilwbjUNh00QH+11hXphLusTmoVSiRtdNSaEogwydqC
	 vdWyr0z2XQIwkMmhq/ySzNkfqfc92sTVwn7lwxErXfaAKVTerhzXt+6pQpS3LYWyGt
	 VxWywXrfoEs+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE5FB814D4;
	Fri, 23 Oct 2026 12:24:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CEBCB2739
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EED7260633
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rv11uiU3URXw for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 111D860618
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758264;
 b=B90x79uICiP5TrRecMCld+dDHgOSG5NLkkynGIJGtl2oa1qF2UDeAftKYG94AsXotIwf
 N382fdO2JyoGI8fFqmXXAiLChqZbZazwMkN+UHgezTZQN4I72jJD4q9IdiQ+w779S64vP
 Xei5wOdI3P5RMqI8OViARFPXaROXC/chDTtezH9ykeBuyBO6D0/d4U3Oy1XNGFdsUeAWY
 gAm2YjG8p9cMz5rjrzbvK/5QrcUdWAzw4/QiwdmQLAT6crhy685ObkhY4cl2zJEGxccc9
 1DvPn5U2oC3k+u86fEf5Kjh9pz0dEK1Q/PPRSedaiqogx1Cm1SUdMca3jmBFBkBQ13A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758264;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MZ3qpTliBYsVS6RsqQaEw/J8r3nLrl9rl25C7bMtSfE=;
 b=rYYnjhqegT5kWJbKYlURvgFGg39egJ3YAzmy1WOfs5jokZlnYqMZ5Soeb4tTah9xSzaI
 qDivzEtrPLFBZtQdThCZzr9NTvqiV/LtCbQm24RijE0ohl6loP74cOjA1K42R+smsj8io
 MDmR658XdOeVzNJze+bBVsKr+N2oAczqlAR8amgWzoESwYJMSU/OfIHSrCRhYohHp46W2
 x7H24LopDpxxpPxCk4i+Yozjq2qY6AqiLhqVSrMAPOC5XdI4IPGkuN/GkjKSkHp6TkChI
 TfbqdGPvdrcndHdTcH0tfA/GV9l+2eETKYi/g0EbViUZwSo2Iy3IFAHVnrMkwu/tPQA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 111D860618
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97E929B9AA; Fri, 23 Oct 2026 12:22:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dd33fed5e1bdcda6959f52c5f6a1184a8367ffb1
X-Git-Newrev: 89a1dcbe463b15d55d0561b8df2dbb75ec1de667
X-Patchwork-Hint: ignore
Message-Id: <20261023122259.97E929B9AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcurl: security
 bump version to 8.23.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7387743996893429815=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7387743996893429815==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89a1dcbe463b15d55d0561b8df2dbb75ec1de667
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerabilities:

- CVE-2026-86410: redirect to SFTP or SCP bypasses host verification
  https://curl.se/docs/CVE-2026-86410.html

- CVE-2026-86412: server-set cookie erases cookie jar
  https://curl.se/docs/CVE-2026-86412.html

- CVE-2026-86413: Negotiate credentials sent to redirected origin
  https://curl.se/docs/CVE-2026-86413.html

- CVE-2026-86414: leaking host credentials to HTTP proxy
  https://curl.se/docs/CVE-2026-86414.html

- CVE-2026-86415: auto client cert connection reuse mixup
  https://curl.se/docs/CVE-2026-86415.html

- CVE-2026-87861: cross-origin reuse of a Negotiate connection
  https://curl.se/docs/CVE-2026-87861.html

- CVE-2026-87862: HSTS cache import drops longer-lived child
  https://curl.se/docs/CVE-2026-87862.html

- CVE-2026-87863: HSTS response erases persisted entries
  https://curl.se/docs/CVE-2026-87863.html

- CVE-2026-87865: knownhost callback mismatches key as missing
  https://curl.se/docs/CVE-2026-87865.html

- CVE-2026-87866: wolfSSL public-key pinning bypass
  https://curl.se/docs/CVE-2026-87866.html

- CVE-2026-92386: server-set cookie aborts cookie jar load
  https://curl.se/docs/CVE-2026-92386.html

- CVE-2026-92387: never-ending loop via server response omission
  https://curl.se/docs/CVE-2026-92387.html

- CVE-2026-92388: FTP wildcard write callback mixup
  https://curl.se/docs/CVE-2026-92388.html

- CVE-2026-92389: TFTP direction confusion
  https://curl.se/docs/CVE-2026-92389.html

- CVE-2026-92390: -J no-clobber guarantee bypassed with 103 early hints
  https://curl.se/docs/CVE-2026-92390.html

- CVE-2026-92391: curl_mime_free stack overflow by recursion
  https://curl.se/docs/CVE-2026-92391.html

- CVE-2026-92392: HTTP/2 upload Use-After-Free
  https://curl.se/docs/CVE-2026-92392.html

- CVE-2026-94265: Authorization: Negotiate sent to foreign origin
  https://curl.se/docs/CVE-2026-94265.html

- CVE-2026-94266: password leak in CURLINFO_EFFECTIVE_URL
  https://curl.se/docs/CVE-2026-94266.html

- CVE-2026-107928: info leak uploading over WebSockets with GnuTLS
  https://curl.se/docs/CVE-2026-107928.html

- CVE-2026-107929: local interface connection reuse mixup
  https://curl.se/docs/CVE-2026-107929.html

- bump to version 8.23.0 (for details see [1], [2])
- drop '--enable-smb'/'--disable-smb' as smb support is gone (see [1])

[1] https://curl.se/changes.html
[2] https://daniel.haxx.se/blog/2026/10/14/curl-8-23-0/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Peter: add CVE info]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 57f40e5f6e9838d1da8882d0f18996e83ac856e9)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 4 +---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 0a7b9e0169..086f3d8978 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,7 +1,7 @@
-# From https://github.com/curl/curl/releases/tag/curl-8_22_0
+# From https://github.com/curl/curl/releases/tag/curl-8_23_0
 # after checking pgp signature:
-# https://curl.se/download/curl-8.22.0.tar.xz.asc
+# https://curl.se/download/curl-8.23.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  f7ef3ae8a22e521f289803fe93543eb64c329b58aa73a9e224dfd915a2a5f4f7  curl-8.22.0.tar.xz
+sha256  8dadd7d2536a314f982ad05a651b713f426bf7d02cc2c76cffb9796f2218e6c5  curl-8.23.0.tar.xz
 # Locally computed
 sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index aeff50d341..1bca1fef54 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.22.0
+LIBCURL_VERSION = 8.23.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -161,7 +161,6 @@ LIBCURL_CONF_OPTS += \
 	--enable-imap \
 	--enable-pop3 \
 	--enable-rtsp \
-	--enable-smb \
 	--enable-smtp \
 	--enable-telnet \
 	--enable-tftp
@@ -172,7 +171,6 @@ LIBCURL_CONF_OPTS += \
 	--disable-imap \
 	--disable-pop3 \
 	--disable-rtsp \
-	--disable-smb \
 	--disable-smtp \
 	--disable-telnet \
 	--disable-tftp

--===============7387743996893429815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7387743996893429815==--
