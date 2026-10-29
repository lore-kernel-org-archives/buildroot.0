Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4B9606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=o3lDShmX
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E068D60BA2;
	Fri, 30 Oct 2026 14:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suYPzScwUp3x; Fri, 30 Oct 2026 14:18:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E88BD60C06
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369926;
	b=aR7Zvfy6315NomYuR1VeETwW7H4RpWh9HP0+hMQ1mh48M3sreRt5arkCB0fh92PMbChi
	 R5ll3PwpYjIe6WrUv1cPHxPssuhn71qBBEzNtXZHTvEW4hmU22hL9EAKza4Z1A+32ns7o
	 F3fY3C0IxxtUh/QX9QqErfiGhv8YOJkr0dz5mntcuPaE6UidtoaQFS6zRuSgyRP/pBmdU
	 fKC50usFuFeR1q6ePTAZTlR9TInl8ompo7PaOAgbAEnIHLWOdrUqwSHy7ePjnBCfS7Q0J
	 P4REk/qrC+qOSnjaK9GbsTJT2Tzd5AhfuaSpgxDYueKqLY56pebZ7AFbOmASSZcF42g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369926;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=7/+IcVL8i2eSQ4o/sDb9oEgdbI76zuyfZioB0DoyK9s=;
	b=lQXjm8CilejxXrRFJmIviZbOMD7w984elpBr/2ToNAVhY9PVBEOFmimfgIoghJrErKq7
	 TCYmv+w1D/qA0frIhg+/HNHUgsweajmTcv1RSSaIW+p+SUPvgpVZhG//0aHGXrMxCP14D
	 eeSgOLlbhuzdcAIYyKPksJDDn2/l4g/Z6xcPr8anpr9TFBSX6NXFVK5G9Jm9f7hcIf+4O
	 dysurw6BEJBeAZU2BvBU55tcggzEcKw5nwqYMCcXILQpo2vbJ3GBnxs34Q5vaKpG3Tqg9
	 JqLQWF9Rfxc/JghawHgramn3b0k3gLdlE7m59IwDaH2jhbG3zAYOAx2Y2Fi0HbgyILw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369926;
	bh=7/+IcVL8i2eSQ4o/sDb9oEgdbI76zuyfZioB0DoyK9s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o3lDShmXb+ywrXmBYyR4jtWUOByrPeNdVeKVflQej/Nk5MCwSDaJWXOXnssXVWHGM
	 1UPBHPc57XQXaazStm5xKRsG23ez/5ljv4xus2OD6HpxcriFCyWY0ibQ56id/BJGCi
	 468BCE9CD9sfaRN5MiwaW4R1sX0dSzQiKjU70SOIUhGLPLYXED75tngSyV44rMnmm5
	 VtT9dqspDoyonyYMU6EQE4WU/j9+EatOTZZb5YK6srJVdwpPcpF/ZQs+RQcrs3Juah
	 /M2a/qHFreorQqRTnrjmujfC+8gfXICZm/+ag6S9Gh+W1UfgqaEOfITs8Oks3v67le
	 TPud9KXl3offg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E88BD60C06;
	Fri, 30 Oct 2026 14:18:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21672D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03E1C812B1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQffohq64RLL for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 12186812C8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369885;
 b=mlzHv176BJGpGiXoMLBsjEHYglI7HYmQFgqXlJYs6XCkQ71Oh0N02qZB8PrRiAJFghSU
 vJbo3S17Ai3JaGkUXQH6wvcYnywMEb6vsSbsip5Vl2YBfJKfPT8fe7mjt/5tAzXmANlX/
 odjrh38m2pwe0pSWXYUJBVYSXw1vMdGTILiUFnnS4GksEYCsrmYvKgBbXUKLGNN1wdfry
 nMhUmZl35unzJ2+mq0jZsvwvIyWdlCrEDmae0jJcK5YIi0MoY44KMT3DlGkf6KJW0yp8P
 hpEy3krPn3ZGOEeWoTHZ9xnBDAtoPHNJBS7i+bmGqhxazMDmlVkg1U5GB1F/MnMzC+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369885;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LC58HCoNdIOKut6llDZo0cCIRd0iKcxflO7DTlgMa04=;
 b=PW6xcbl1KFwBbKAZ73k70YPomZJRgBkJlJkgIc81v8SpXZwkIanfggK+uYvCRcyC+i0p
 ZzGbqafa7E072vEP+aq7nyrWL6TiGWTS2cPsK1CsZw8rMTkNKxAhp0pGCUPbsNmo/QOzZ
 vgiMN0EaR8I/T8MLVNXLmEqiaksCv/i0SYCnrOgwXB6sAXhbh/L3pV5bkAQaWsbz/Wk85
 chXTpRz2hwgE+vpGhYY79ig7EiaGk1kpUeR+Fs6fhoqO0ravLcSzCWv/BNx/Xbke7qTDt
 mBw1waEY2CM9hsPyYCf4qbnT2SrYMG2Jlt3OpGk2nGhIIeA/LLnB67xGg+KaLH2bhQA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12186812C8
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F10B9D388; Fri, 30 Oct 2026 14:16:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:06 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 1588df237259574ef7e98154a5a18118c75e3762
X-Git-Newrev: 82ceb5d60b55d93d2b8fe39e88fe9f41a9a9e1ff
X-Patchwork-Hint: ignore
Message-Id: <20261030141637.2F10B9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/pkg-golang.mk:
 make GOPROXY configurable
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
Content-Type: multipart/mixed; boundary="===============4390873182648206414=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4390873182648206414==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/82ceb5d60b55d93d2b8fe39e88fe9f41a9a9e1ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_GOPROXY now configures the Go module proxy URL used to download Go modules
specified in project go.mod and go.sum files. By default, it uses Google's
official Go module mirror at proxy.golang.org, falling back to direct downloads
if the module is not found in the mirror.

The default value from the toolchain can be read with "go env GOPROXY"

We rely on package developers to audit their dependencies in go.mod and go.sum.

The value can be configured to:
- A comma-separated list of proxy URLs
- "off" to disable all downloads
- "direct" to download directly from source repositories

For more details on Go module proxies:
https://go.dev/ref/mod#module-proxy

Discussion:
https://lore.kernel.org/all/CADvTj4pXO2rwJ8oCzzGNY+OxLuo3uJnDT2PAxbyquw0L6dhfiA@mail.gmail.com/T/#t

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f14e138f6f643d208455c500ca3ba7cfa9de30b4)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 Config.in             | 16 ++++++++++++++++
 package/pkg-golang.mk |  2 +-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index ac58c685d1..34e9ec6705 100644
--- a/Config.in
+++ b/Config.in
@@ -334,6 +334,22 @@ config BR2_LUAROCKS_MIRROR
 
 	  See http://luarocks.org
 
+config BR2_GOPROXY
+	string "Go module proxy"
+	default "https://proxy.golang.org,direct"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	help
+	  The Go module proxy URL used to download Go modules. By
+	  default, it uses the official Go module mirror, falling back
+	  to direct downloads if the module is not found in the mirror.
+
+	  The value can be one of:
+	    - Comma-separated list of proxy URLs
+	    - "off" to disable all downloads
+	    - "direct" to download directly from source repositories
+
+	  See https://go.dev/ref/mod#module-proxy
+
 config BR2_CPAN_MIRROR
 	string "CPAN mirror (Perl packages)"
 	default "https://cpan.metacpan.org"
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 26da7be71b..3e388cb257 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY="https://proxy.golang.org,direct" \
+	GOPROXY=$$(call qstrip,$$(BR2_GOPROXY)) \
 	$$($(2)_GO_ENV)
 
 # If building in a sub directory, do the vendoring in there

--===============4390873182648206414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4390873182648206414==--
