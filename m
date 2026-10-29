Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEF260A2601
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=N79C2eUl
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E610960B09;
	Fri, 30 Oct 2026 14:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LoWNsKdVSFEN; Fri, 30 Oct 2026 14:06:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EAEF060AF4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369176;
	b=ZnYYd3BBVctH4H6w3obSahk1WnSsfX+8tALXynGB+shRZDuFTtB9eOhUUVnZ1wEc4+jE
	 1ZGiWf8l1Mnf4bFsFphqxNZzfKvLPhfMRbmMHjRud33lqXK1gdATBbK+SWGinUa8/FLO5
	 voh7s+KU8z0XuouTmaCii8CRAfWs7OEiUAswAyhLgFOpNhYAlUQn5V3QEK3u20ndCpYW3
	 WgkH81kqPVBFwBhlxLLhumro3w1W+KA4KVGJjUq6VAmkN8EB9BKB852ffmtghO+PutVmF
	 fIcsI2Q9WMQwczDiAzKEpTP46cXKLiGZWwc/pwK/TC26qFYaDZL+yVH3GHD1YLrWWPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369176;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=SlQN/W1pJ1xBuGzbbGhGXs7UmCaxBUehjpoAiXk1tYg=;
	b=cGaOSbVVAK/0Lw1IFKjnm/gIolBG3w0Sezii1irb6h6hXTH0Eqx5sUKRgPJO859Wt4rC
	 Vd0T5aKibYRlmb1pKEuVZIj3Kca8Kh7NYYFi4JiV3YYg2j2ADavbh0eBjuBbbdvbaKakX
	 bvQ0g1eguluZF8J7QHmX9sGS1/VmKlpOQecSAYxrVOxuWwRte4Oe0KTRvBKdB0vspZJpF
	 m7CraKjRHci2kJSfNanIxfjXvv99MN0mEUGxIE2EKjFlPeOpdsk++nvu2anJIKgGkAYHA
	 r3wBXT4NU2nbk3gcUhaV5rlDdHRSuv/uElF9QrCMiWBQLzqo4jqQByt+mOJ0v77nQSA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369176;
	bh=SlQN/W1pJ1xBuGzbbGhGXs7UmCaxBUehjpoAiXk1tYg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N79C2eUlMgms2L60uWwNpvjDsHSpNwkfHWX50PyxNuCIhNMxb3AkDd/xO7AOfW+4/
	 //J+k5c1KeFcAGdbHBlC6lIAGCxKdQ+X/xXXvSFiPPU9WqTiusnLqpwkhfCKQX/RqR
	 cW80c1VA6FyeyDzhICWKyWZ4qFg2DrLalpDFR69u4EpYkEE0d2NWrbadnCwd2+0jRi
	 CLOEETQHHHA+jhIUtdUFPpP4IGxJrxiie64uDEjIowvf/wt0RyW/WAIwASWHIIWM1i
	 UDv0sNk6WHiu2SZSUq1h9fiLXDHznGqOjaLEvdFsE7N0OGp168UBIjypHNmZQ3lVHl
	 xbslLM6PvSJ+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAEF060AF4;
	Fri, 30 Oct 2026 14:06:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69968D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C280400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cDD5roDP05Mx for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 683804052F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369157;
 b=SiVAKN9vOtdtNY9bsdKNABSHn2uelk20JSixuYB05k91peavqn1Y2428d6rtywwwFOsx
 ZconnPP833KW7ftWrheUiNhK5m0S3S2HQiHaZwhge9bu58oqFKoqzLL55FU46g51BCEgX
 9NgQJMsNts4D7OOfQQOVu18OaHXrv3XNrGhAv1aNUlXXTx1Dde+PeBNPGLoGj29YI7RsL
 b5MbYp++5J7NHMaALPvyeYiSKV7IEO0AQk7HEgXIwJ6tu9/3nz0plKLrW3/z88+3s2Qik
 T2ZwLblyMqZjb4ONEmLQ3YbAlZf9nWIll7emykuH6ir5zpLheDdELZSb0iiQPgVI2VA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369157;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FimZUGYJ7kNVh0QCQdcCiY19eyg3GdXtOShnlADKDPg=;
 b=WGK95jk0N6oNhThQ83eE5v2ybpwcKnUvRZN9fuuitpA1VVdq9/H/Nxlzw+jzCCbO8wFX
 i40iILlL48lH3AGsbdyCdtAQSzVvDMz1XZK8MLZYfqmMLLt9QbetS1DmnqaUkRRqIqZ5l
 T5QcA6dPPkqvQyIxNTmyiIrNlSboU5oDXkXWucMgS38bNgMZ+lpusKWZ8uAqVU77fQrt9
 W3NyxCNR8eheRj6NDBCjIuJ0DhLMWybiMoBQiXm2u/9emq9ZS8J0By4hYWgJFvmkpHuHW
 NE5tblzHEvFvzMV/16QpRZg4KEB42jFudy7DNQgVmqVSAAsZd1YZkmq2F3BDIQkYwLw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 683804052F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 876029D388; Fri, 30 Oct 2026 14:04:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2a86b6463fe9adf2ad20a7da4c4fe1035214df1d
X-Git-Newrev: 7fb8c76c155caa489f39ab5e7154512a4406579c
X-Patchwork-Hint: ignore
Message-Id: <20261030140429.876029D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libheif: security
 bump version to 1.23.6
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
Content-Type: multipart/mixed; boundary="===============4505377357914622752=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4505377357914622752==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7fb8c76c155caa489f39ab5e7154512a4406579c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/strukturag/libheif/releases/tag/v1.23.6

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-h4h8-qgvc-m7r2)
CVE-2026-XXXXX (GHSA-fcmw-5764-7rq8)
CVE-2026-XXXXX (GHSA-6fqc-p7r8-2g36)
CVE-2026-XXXXX (GHSA-q7mw-2fmm-5q94)
CVE-2026-XXXXX (GHSA-vv35-6hxg-95x8)
CVE-2026-XXXXX (GHSA-8p2c-9wv4-rx4p)
CVE-2026-XXXXX (GHSA-86ch-j429-fpr2)
CVE-2026-XXXXX (GHSA-3gwx-cjv4-jr74)
GHSA-hqpw-h8p6-22q9
GHSA-hvwh-xpj6-ph5x
GHSA-v5rj-g4wv-j5w3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5b5fc8431bfc234a80653db5772eb47d65305aae)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 30265f4aab..44e9c54781 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.5
-sha256  fd9036064c4432f0550d15072ddf34956a248279ee9aeaff0fba3fa0f77d8f1a  libheif-1.23.5.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.6
+sha256  4484346dc5995319dbc11e3a1c35d0a2ec46511ce370900869337fd2c7033125  libheif-1.23.6.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index cd171b9637..179c952566 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.5
+LIBHEIF_VERSION = 1.23.6
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING

--===============4505377357914622752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4505377357914622752==--
