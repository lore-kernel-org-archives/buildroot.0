Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09437C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFD5D4178E;
	Fri, 16 May 2025 10:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYgWjFLMynwb; Fri, 16 May 2025 10:52:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6B384175E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6B384175E;
	Fri, 16 May 2025 10:52:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA9FA1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA6AA60B6D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:52:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQsRGo13kikj for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:52:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB144607A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB144607A0
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB144607A0
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:52:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C14271C0DFB; Fri, 16 May 2025 12:52:40 +0200 (CEST)
Message-ID: <aaabe7cf-4d9b-41d2-9967-1c0f2aaf7351@rnout.be>
Date: Fri, 16 May 2025 12:52:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: =?UTF-8?Q?Adrien_Gallou=C3=ABt?= <adrien@gallouet.fr>
References: <20250430204137.1071918-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250430204137.1071918-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=veZjEPiVmlGz7jb3VIjGLsmi4/78+e5ZuWHgbn0pug8=;
 b=jX4ydHvXvW8mOeZXunOAb2MTKYidKvNzClOeR2aXhe4uqgY06c4QHnCwLbXCPOLLKHhRxl
 BXR0tlqcf3Pe8EbSepTpf9nULyxPGaymv3nDQaYHtiB832Esn9LeCzGoaEfpSRcCvQrTii
 +Rt47rsbvGeLHwgfggaSqfPv5mlr39Ffccd/u3yu5DvBEx8deX+ZWNMWxCzHAA9H8Lsxn4
 LogPfOTCsxGdpJjX8+EYMO9s1sJOTSvYIDSM2ntB4MEpaRIXLPH9Xcnzi/u11XWDnclFsQ
 gs0BXXKqbDaWC/30yJdVU9cli045BA2iJStPKhDBt/WfzEVSzvjOGhrfJa+2Og==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=jX4ydHvX
Subject: Re: [Buildroot] [PATCH 1/1] package/bird: fix build failure with bfd
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/04/2025 22:41, Thomas Perale via buildroot wrote:
> The 'bird' package with only the `BR2_PACKAGE_BIRD_BFD=y` protocol
> enabled fails to build with the following error
> 
> ```
> bison  -Dparse.lac=full -Dparse.error=verbose -dv -pcf_ -b obj/conf/cf-parse obj/conf/cf-parse.y
> proto/bfd/config.Y:204.27-33: error: symbol 'ADDRESS' is used, but is not defined as a token and has no rules
>    204 |  | bfd_show_sessions_args ADDRESS net_or_ipa { net_copy(&($$->address...
>        |                           ^~~~~~~
> ```
> 
> The `ADDRESS` token is defined only when certain protocols (e.g. OSPF,
> RIP, RPKI, or BGP) are enabled. As a result, builds including any of
> these protocols do not encounter the issue.
> 
> This patch backports upstream commits that define the `ADDRESS` token
> for the BFD protocol.
> 
> Fixes: https://autobuild.buildroot.org/results/68c/68c5dd84585a7018ad57ea3e7134748c08858ef7/
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...BFD-Fix-missing-keyword-declarations.patch | 31 +++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 package/bird/0002-BFD-Fix-missing-keyword-declarations.patch
> 
> diff --git a/package/bird/0002-BFD-Fix-missing-keyword-declarations.patch b/package/bird/0002-BFD-Fix-missing-keyword-declarations.patch
> new file mode 100644
> index 0000000000..29ec8abf7b
> --- /dev/null
> +++ b/package/bird/0002-BFD-Fix-missing-keyword-declarations.patch
> @@ -0,0 +1,31 @@
> +From e5b582868c5fa7e185a12023784adc8df7b8c7a2 Mon Sep 17 00:00:00 2001
> +From: Ondrej Zajicek <santiago@crfreenet.org>
> +Date: Thu, 9 Jan 2025 00:30:37 +0100
> +Subject: [PATCH] BFD: Fix missing keyword declarations
> +
> +Some keywords were missing for BFD-only build.
> +
> +Upstream: https://gitlab.nic.cz/labs/bird/-/commit/c386369645e584facaad88ec292f2fe0bc70d974
> +[tperale: backport v2.15.1]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + proto/bfd/config.Y | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/proto/bfd/config.Y b/proto/bfd/config.Y
> +index 1a7474b0..70b09ad8 100644
> +--- a/proto/bfd/config.Y
> ++++ b/proto/bfd/config.Y
> +@@ -21,8 +21,8 @@ extern struct bfd_config *bfd_cf;
> +
> + CF_DECLS
> +
> +-CF_KEYWORDS(BFD, MIN, IDLE, RX, TX, INTERVAL, MULTIPLIER, PASSIVE,
> +-	INTERFACE, MULTIHOP, NEIGHBOR, DEV, LOCAL, AUTHENTICATION,
> ++CF_KEYWORDS(BFD, MIN, IDLE, RX, TX, INTERVAL, MULTIPLIER, PASSIVE, ADDRESS,
> ++	INTERFACE, MULTIHOP, NEIGHBOR, DEV, ALL, LOCAL, AUTHENTICATION,
> + 	NONE, SIMPLE, METICULOUS, KEYED, MD5, SHA1, IPV4, IPV6, DIRECT,
> + 	STRICT, BIND)
> +
> +--
> +2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
