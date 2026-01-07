Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC86D0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7D4640A80;
	Wed,  7 Jan 2026 17:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8Jouhp2P51m; Wed,  7 Jan 2026 17:58:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C67DA40ACC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808704;
	bh=gOAoP0gZMrL1gHeUaJToNPLT2/zqt/wI53tTNVz4F0k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jf8UtF4i+J1G0v8HoHja9n/IXTduJS7kr4CNPYiWKrdSgB2TUfDX0C7295SnJ1wk9
	 AJoAcaEUnV1KpV50O9LEiRATz640L6pCtQ0n7BRTfEPtbRWf+jk1bwUZRiesppYH/z
	 Edc1+RPdKWkS5pdVGfLXcjw6GEifzjJV8/o8q+vRFE1/lR86uKfwQmReU9bSgx3S8+
	 WmwdxwOUCkc3CuPN5Mib8tfLw1XP300KR0ckh91PEOTFrEIkrAfRjfguDxNKFAF5/k
	 gXVm77j4DwYj7cbX0D6ML8dIahVb5O/ocSOTPiFDy+b7N0HUWhGpoRQ5fogtBUtqi3
	 St06amJk9Y3Ig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C67DA40ACC;
	Wed,  7 Jan 2026 17:58:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26D9E9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 246E9607FC
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:58:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qntE2vXRDnhX for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:58:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1DBEC60643
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DBEC60643
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DBEC60643
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:58:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F3A1BB97A192; Wed,  7 Jan 2026 18:58:20 +0100 (CET)
Message-ID: <22071456-2c78-4405-8eef-aa75ca51e8f9@rnout.be>
Date: Wed, 7 Jan 2026 18:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20251029210230.1841049-1-bernd@kuhls.net>
 <20251029210230.1841049-2-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251029210230.1841049-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=xB7+xdtxYZ7Ob7u6VtDk0CsQ+jJLaH1/VOHPap1BPnM=;
 b=BMZz1/z8xZsdfJvTU0yzWuWsfCcn3digZ8aU8/eP1jllTuIj321ecDx3g4zbI4gEKyQ7fo
 ztQTNYbTGq5o2yd5fRF82AnJYwTbqmX8nwPaJPOwmJU3Kqg0zL5p+Fmp+ACS4/94N8xE1q
 6ix53scpxfa0c6dZudgGlUipRFBAofHDX70QXmlE4Aptm5kzP1fkha5rJdQ4Xq7uuaNCV7
 Sj2gJ7r0GNChHIo5l5OjDXeAl0n2zqKm7a70kwhhyWODvurTBSMiB0vvs5cE1EZ/UT6Epx
 qqiajUEoLCOXy1RWVsISIFvUsmPSCS7G9QnaNDzkET6acZrkPfWdGW4pZAEtiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=BMZz1/z8
Subject: Re: [Buildroot] [PATCH 2/2] package/libxml2: bump version to 2.15.1
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



On 29/10/2025 22:02, Bernd Kuhls wrote:
> Release notes:
> https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.1.news
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>   package/libxml2/libxml2.hash | 4 ++--
>   package/libxml2/libxml2.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
> index 59f1ef2ac0..637ba52bb8 100644
> --- a/package/libxml2/libxml2.hash
> +++ b/package/libxml2/libxml2.hash
> @@ -1,4 +1,4 @@
> -# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.sha256sum
> -sha256  5abc766497c5b1d6d99231f662e30c99402a90d03b06c67b62d6c1179dedd561  libxml2-2.15.0.tar.xz
> +# From https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.1.sha256sum
> +sha256  c008bac08fd5c7b4a87f7b8a71f283fa581d80d80ff8d2efd3b26224c39bc54c  libxml2-2.15.1.tar.xz
>   # License files, locally calculated
>   sha256  5d4873884a890122a4b9b20ad56ac6f7da1d796a5bfcf04a427970ac96217626  Copyright
> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
> index de0ec42eca..35d373e130 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   LIBXML2_VERSION_MAJOR = 2.15
> -LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).0
> +LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).1
>   LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
>   LIBXML2_SITE = \
>   	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
