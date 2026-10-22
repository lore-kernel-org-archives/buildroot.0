Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA7A606A326
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YuGtdWku
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5ADA381661;
	Fri, 23 Oct 2026 12:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29IbeCeOKFzD; Fri, 23 Oct 2026 12:32:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1822681628
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758739;
	b=THXFADif9ztdIRXB5eiQUxTW4B5vp8cp/emYSfuR5M6spO2UoOXLoRRZUy8doOSegusj
	 +FRs/FXFASvSHkRVDoQGFLbRLp2HsEPTKhqaEiwwDKahsTRShQ7vF9ksVF9y3PYRbKO+M
	 nNIHdTikQ8dipuRgVe11w5SkPbd+reaPJZ/RhmX7ObZRwaizUJwVuuwM7HsSdFSPyQ6gR
	 BxuFMMbs4LydPXzhswikWG9jJS49okgyzI0d2lCe4ZPY5Or7z2GPp3AelzbIV/gvZ/2zn
	 fHm5XHuii/nY63qFfq1niE4JknomLetVGOIgRb3GVDUO8NLuPrINKtI5/nfeDbpbbIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758739;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=L0uNkodizZU5Xtih0jhZHTmxLyYA2TKRCIrpYcnf0hw=;
	b=hTYte46ZezTIkEop2lL7F43pUU6QI8CGbbidwQ0T+4yl8K0gZa7x+ct+qXcImxMk76ms
	 QLd0JX0Uf8kd2s0Fbg8e+Rpe2WFRsDSwOO5TpVGuj+lEH3kbp5TkKakTvnClRgLkXKu+t
	 UqaZ2N5QDgHVd4W//5g6HsOixhgv786vttvNra0PGyH0nfJohS8GXRQV5FW2sNpvYhowp
	 7MStD65afrCSwfDHMMKbzhjr9YH1lClP7nUH0K3xtoySSxy6z6j5K4xjR87i/Ksmomi4C
	 D36tHbJ0B7QAfOqNBhfc0eUviWIo0BADIvlKVyEHJQTgVs86gKcy9ZylnhdyEdF8Otw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758739;
	bh=L0uNkodizZU5Xtih0jhZHTmxLyYA2TKRCIrpYcnf0hw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YuGtdWkujrm9+iMYWmlG1xjkcj5SNXChYwbzm5n7Xc6e3XyvhXYviRu1K2OHqd1R3
	 BXxtjUQye7J2ZaHTFsTe599CuEufMf3rQjfMjL5sWBFAT9v4RRoAvpdHJm2OlD+IsA
	 bs3A+xE8fq5+ph+AUEsY/tR1X83O2tqRqN45v7ltYHsCSH4MaMKqG5tSffrK2fCo5V
	 +mc0u0rj4zp3J+U8PVaJj6taOuwSGFMdKBhswrVUmAurFD0tYaRqXWCAVGdc8VLBWw
	 X5RK/5S/wKihMXPhSceFcR/Kb041INxQiABxEV1z5lzm77hHPqc2S6LDKCqrGqOtDH
	 oHGb8JHzMwjMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1822681628;
	Fri, 23 Oct 2026 12:32:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E75A212C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D94FA401D6
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfM53p_APsQQ for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 15040400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758726;
 b=QRwrS+NG7oG+I5Olaj4BXlzGlzbnY1/yprcj4/zVqyXVanqsdFKarSVTgvBBPQ7u5n7X
 z6qxnfUCYI3swlskusNN99jRYN7PcBflX4vuli9evNYGI38U8ySqB8pfbJF6IyUWkJmP9
 4Qj8iERnDRbc0q6Q750gMGENOdEFEYm4b1cpRQIpIv5gixTPrF0uja8nJZkND7/T4CcTD
 /BT9mirkAHj9rDFF5p/mxcjvLGMifUNWfNsgL7y3nSl8JpO2EDaDzpVMK+hVmv1lRLElT
 Yf8pGOsFVKwBaTnfXV+zvfL5FLHEvwzEFj/PADq84KoosFVXCE6x3xxpF9qDP9+fbwQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758726;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=d2TsN9j1nzq1z+HHxBeHHHsm4tkJGfIWLR0BW0Wc9Y0=;
 b=AUy1b6psj0zSigM97XTVlx28xy8qzOMr+bq96FvB9Jh1WcOlKDHQVE4f+uYlY0dWbLyx
 XA942mmyJUgvjy6GX5RzIh/KNBonrF+z53aXj6yUefOK7rBDop14hXf1djYgGsHfw5QYe
 pM4cXRfW9sIZ4T2GOi8OGDLsqjsFTAUBjNM79pA4swGMPNN6aYw3PcpeNFrHb0qgUxNxM
 8910rRg0+X/gZSl8CkYZlKK71Dt9gLcNLSyzB7URPfMs8bixRBhckLKa58H6d650hJG3k
 awdtSf0TuA7/7xetTG5hZBrGWhUQmBgOmaea7Jplr+q+96K//pO1MKnals6AhQD1p2Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15040400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 999319C669; Fri, 23 Oct 2026 12:30:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:24 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 42684bae0780c8e1db53961cb89ca76c78c19f4b
X-Git-Newrev: 1380aa119bc92e7f91f1528860b04fef4c7dc093
X-Patchwork-Hint: ignore
Message-Id: <20261023123041.999319C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libcurl: security
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
Content-Type: multipart/mixed; boundary="===============4645395842469138715=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4645395842469138715==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1380aa119bc92e7f91f1528860b04fef4c7dc093
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
index c3590a8a9e..00f718fbec 100644
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

--===============4645395842469138715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4645395842469138715==--
