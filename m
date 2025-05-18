Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E783C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17EE981EB8;
	Sun, 18 May 2025 14:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id up-FPAiVCIYx; Sun, 18 May 2025 14:39:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47DB681EB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47DB681EB2;
	Sun, 18 May 2025 14:39:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 001551BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E594981EB2
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amfsAlvvcWTN for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:39:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F137A81EAD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F137A81EAD
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F137A81EAD
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:39:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7E32B1C0FF6; Sun, 18 May 2025 16:39:08 +0200 (CEST)
Message-ID: <8216517c-98ea-4c81-a650-737b208061f0@rnout.be>
Date: Sun, 18 May 2025 16:39:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
References: <20250509041939.11656-1-kadambini.nema@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250509041939.11656-1-kadambini.nema@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579148; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5MMMBYF0x7Ezeq0cvRH4KGK20RjWpDWJUH4UczjRZXo=;
 b=fdyj3FxxT7+M9D8g19VqkaTXTXv4HLVOOb5IFZ0ksRqSvLJqTSJUHtlodm2Yw2MX7QDFyd
 oQLI/r1hRNh/qnPojOOpYIAUMBkqVpBH4tNeKP8Z5dgyPXILXLIydGD32qVb9enaAgRtiN
 UOT8L87pFkI0zlGOpwl3e5kYzk2WTA6OQsfdKgHqvb8iFx1e5hcIOtE13DlZWH6DfhCLzq
 RhHSmAXzHofCjqE5OEqZNeEf8BUbPr2/F+JebOxgMq2fkK7oq1Q4okHjM+txo67/OacGyo
 WGECoI/oNJTo2mnCXuc/lt59rcoXQDpcjEJAQQlgC5UuMw9mAYZvWcuzu1XCBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fdyj3Fxx
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: security bump to
 version 2025.88
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



On 09/05/2025 06:19, Kadambini Nema wrote:
> Fixes CVE-2025-47203.
> https://security-tracker.debian.org/tracker/CVE-2025-47203
> 
> Release notes:
> https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2025.88
> https://github.com/mkj/dropbear/releases/tag/DROPBEAR_2025.87
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/dropbear/dropbear.hash | 2 +-
>   package/dropbear/dropbear.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
> index cf2dd18d61..b18aca3aab 100644
> --- a/package/dropbear/dropbear.hash
> +++ b/package/dropbear/dropbear.hash
> @@ -1,5 +1,5 @@
>   # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
> -sha256  e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e  dropbear-2024.86.tar.bz2
> +sha256  783f50ea27b17c16da89578fafdb6decfa44bb8f6590e5698a4e4d3672dc53d4  dropbear-2025.88.tar.bz2
>   
>   # License file, locally computed
>   sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index e043893aa1..c383212e76 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DROPBEAR_VERSION = 2024.86
> +DROPBEAR_VERSION = 2025.88
>   DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>   DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>   DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
