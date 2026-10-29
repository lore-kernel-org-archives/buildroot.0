Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C554606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=k6ZrBMuG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A15060B48;
	Fri, 30 Oct 2026 14:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrSKQp2vZ6SY; Fri, 30 Oct 2026 14:06:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 573CC60ADC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369208;
	b=FnvSox/ryIZlrtrQWZBhrntYGDys3M86GXynxqjtSLRucgN3HHbCmCPQM76sQh0Y6D2f
	 IrDTIq7Gvt7kNIiZ2uxBCxtCGqeIadrBBVr6M3PYk5Zlpt2Zrh6QQSHiLmJPyzcR7Egqp
	 HWgROTRLHXFtWJNhvS+616MSiPYBfCbsMaum41OyQ3tEkizSuKonLwbRwhK2rGIbBNzx5
	 VC6OoTEa4yAPKwrvoVHgfb+xkMcqyeztqq0ZuTi4U6xDAciMNNuxweFEopRHIGpviN2l4
	 o/JbfBtkH1nGyGCN9UXIwcpnxqf6P6zivKi8XT4TGM5zGSXJckhtQO4vMCyWYHb+iow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369208;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=XNmRhehHMqCGsQCMfcADK+5vq5wSYWdOkntI99801u4=;
	b=bL4P+XNKJf5fTavWU47hJUgK1g3dz/Jh9hVAn1clP7/tttkbo3SYFu+ePeaAmGwJaGpL
	 mv3cpXpoVh2//oIyJjlWwhM14uWe/3oTxZbVof/P+HXfytl0MI4Gy/3yXUWUjz9AAN1QD
	 wc4ipo5tdgEB14BIqxwW0S9LiI04+AsTP3xQ/gQQu1HUAd0qZ1CqjwGTSQ1l/iUb+Nk5V
	 60MAV9Ax9lAm3KEKIMWDaQft6a50Wuc8Pox8HNHnVYvOTv4k/c/uVKwcm74n2YOnMmEGy
	 AuTu4kMssF5KrPw1lmR01bZyIJpOp/DN/6rRU5cXfsdBCEwghRnkG1K1KyEiT7Yx3PQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369208;
	bh=XNmRhehHMqCGsQCMfcADK+5vq5wSYWdOkntI99801u4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k6ZrBMuGVy9/nUyH7vmDBxrKIykB7ZB0gQUJLmaZ93oY12o+YA7LmlMN2bfppQgP+
	 7Xrt6Vdl+bgWzQT0znU5dnPgulruf9m6MKAprmAVOplYDif/clMNshoPi204SbXb8H
	 /9qg2RNQ3RszOCdDkwNJ6fKh6rAdCJ+oCWy44Xw1dKajM9zo5ku0erXj2M8CtasvuV
	 JnyR/KLPIv8ndOzO2pa4BzGMiAjxaxgX/0RgDWXGhoktzImMd9gL776TTqitMhjrnJ
	 7bu//inUDH1CaCXQ+ltmXUYLs30uNqyaukE/FphTFLAQ75jcyK0VpjNao+6f20XPTO
	 L07Eknog8d2GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 573CC60ADC;
	Fri, 30 Oct 2026 14:06:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55CEBD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3474D607A0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cCcEPKSlg11 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 368D760AEC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369159;
 b=k1/jicA2lRtaKgkWhZiWqhhCE2ylRqhYg7k2cOEcFzS7V+Ubc21ZIo9jnzW853mdA6Bh
 cvPKmOrgAvKL1l7o7Tn00wWU0QWyvVKUoV+eZvvNB6brF7Sf8tElbzYAYmKpjORG7+peR
 gzayizstD5E3xmbyNGDYfIAX+gSmFqywy8fyntsp61M6RxzlGT6zFEB5nnpwm6BcjxwNm
 wgx0SbAlCP7HL/FUjRjMpXWwIxhjzFo2AxVwjrreC3MPZ//UXVhiaRB5aT9/EkKGtIfyk
 I+oGqL33KxG73tSol5he2chUvRWKwm8vieGlxSIaEUTe9Ooe6VjR+o/1cEu10hpP11g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369159;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DXLH9ON//fGT2GdK3k5SP8wJEDxpdP+pO/dWVJJpOvU=;
 b=GKqWjYEHRvk4poPYh4OKdsv+BZKi1eVJqcOsGP8ODqmFSeMCuDg5ri0M/b6sf/9y2YpJ
 aMrK0CsVpkUjYMsCWBnfMmD0gC9QgVYNTE1CzNrRAhz4v7vzgICmefzbyUkWAQpw4tBbT
 9tDTKSPZhYXvVduuB7fx41kayemVRdpJpo7ZBNT72U5SfB66xoRJZw+/0xqhIufQfzdDa
 wBc8dGQBrLkg5TwG7IXjktu4wKQ420Y7gbYgOyIwgsnVwdz8Leto38idwpuKzzeoWeYpp
 qXAAIqm/qBegiVBDf75cQv4Zli4MU0rzMYpX0XgQdzDWvsM79luimkpUOUYK6bP3AIg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 368D760AEC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55EE69D388; Fri, 30 Oct 2026 14:04:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:55 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8a3c5a3afb3be53c95331cbdaa4ed5ef11007803
X-Git-Newrev: cab7d2a5ba49265707441fa83d665f344ce3b60e
X-Patchwork-Hint: ignore
Message-Id: <20261030140431.55EE69D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/nodejs: security
 bump to v22.23.4
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
Content-Type: multipart/mixed; boundary="===============8036462874442362058=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8036462874442362058==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cab7d2a5ba49265707441fa83d665f344ce3b60e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This is a security release with multiple fixes, notably updated
certificate following the eMudhra intermediate CA compromise, brotli
remote code execution. For more information see:

- https://nodejs.org/en/blog/vulnerability/october-2026-security-releases

See the release logs:
 - https://github.com/nodejs/node/releases/tag/v22.23.4
 - https://github.com/nodejs/node/releases/tag/v22.23.3

This fixes the following vulnerabilities:

- CVE-2026-105481: http: ensure agent data guard works without I/O
- CVE-2026-105482: dns: validate resolve inputs for null bytes
- CVE-2026-106069: tls: reject non-canonical IP addresses
- CVE-2026-106073: permission: check permission model in realpathSync
- CVE-2026-106074: crypto: reset random caches across snapshots
- CVE-2026-111497: src: expose BROTLI_DECODER_ERROR_FORMAT_BLOCK_SWITCH
- CVE-2026-111497: deps: brotli: cherry-pick 0ed4268a4401abcb44720963

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d51abccf376d6273acb681e7d561f24e98b60ea1)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/nodejs/nodejs.hash | 12 ++++++------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index bf7a8358ba..5a9240d4e8 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,9 +1,9 @@
-# From https://nodejs.org/dist/v22.23.2/SHASUMS256.txt.asc
-sha256  fff4078c5def658577f92c88db7db3bc0072924bfb93fe52c1e744a54e94abb8  node-v22.23.2-linux-arm64.tar.xz
-sha256  ef8f26a3de19acd8c23548e6c3cfc2052610b0e67abb5fd64dbd92c8b1c1245b  node-v22.23.2-linux-armv7l.tar.xz
-sha256  e2ba10110ad34096c051fe47134fcd12175ecc48e7e879d7d4c78b70cf66442c  node-v22.23.2-linux-ppc64le.tar.xz
-sha256  d60acfe00a2932254bb0ad20e01b0d74397a0875595de719654b214f4b03f307  node-v22.23.2-linux-x64.tar.xz
-sha256  bbe768df8d5815d7fa76124052985332452e0a4742d39f32027550d1aab8f6fb  node-v22.23.2.tar.xz
+# From https://nodejs.org/dist/v22.23.4/SHASUMS256.txt.asc
+sha256  6287aa46b6c375d816e63ae66d024fbbfd70404825aabdfdf898a970871d2f4b  node-v22.23.4-linux-arm64.tar.xz
+sha256  c9057c6a3b8fbb9651ed115c1e96d4a7281b7b9c9ca89fa05865c98ed7ffd437  node-v22.23.4-linux-armv7l.tar.xz
+sha256  e4732f45e0cad787d6ba70c4eb6db45dbdb3f286f67dee429dbc6b4ff36eac43  node-v22.23.4-linux-ppc64le.tar.xz
+sha256  1805bcd35e6815559bd2eb97db438d3fdb0eb3a5e6a977b7c1badca76337e9ce  node-v22.23.4-linux-x64.tar.xz
+sha256  7b9adc82d612d0a2a863d96c46de2292552e250cee51956ebbe0146c42aacae9  node-v22.23.4.tar.xz
 
 # Locally calculated
 sha256  c738ae413cf561f174e34f6961f8ca458aae2369a73640dda6234c629b98bcc4  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 1147245504..d8ec70af43 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 22.23.2
+NODEJS_COMMON_VERSION = 22.23.4
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = https://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 

--===============8036462874442362058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8036462874442362058==--
