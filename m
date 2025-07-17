Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74584C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 462F84169E;
	Thu, 17 Jul 2025 20:04:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAOOPIa-47-d; Thu, 17 Jul 2025 20:04:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CF3B41131
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CF3B41131;
	Thu, 17 Jul 2025 20:04:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28636226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A38C41131
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:04:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cqmykzdyEKL6 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:04:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3AA7840E20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AA7840E20
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AA7840E20
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:04:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D368DB977AA6; Thu, 17 Jul 2025 22:04:50 +0200 (CEST)
Message-ID: <ce1f75be-e89c-4585-8d03-6f0502b2ba08@rnout.be>
Date: Thu, 17 Jul 2025 22:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250710200521.3666109-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250710200521.3666109-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782690; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=xX2z3KNGi1NZ6sCRjsFMLENbOaTMnoMpwgJjQpyOhRc=;
 b=Tk+Xly+Y8UfkpfHYwy8Re0pEmPJGp3c/49XAafJnqyJFTkciKsw7tKfTnnKUPE/3t+Ip6l
 EVllKyc50zC0Og1xsNqSYnKIvvevn2fBPAfoQJucjogH8dWN7XePig0yc35DSbtUrE//JH
 sshgI/Mgxo1siH1E5LrM/vRekvuC9aqaIlcu6IIMQHCjQIGfmbUc7+FZtlDmTj1Ek+R4eq
 lklU46QC7WlbOIta7nGmstCCtz1hZ6H+Y7eU5grNy+a1lcmqESKP4tqp8mBtBcHlhWfg2O
 3/Xamu8QzTKzrqtHLmTCDHZsjRPG+gQQIvaU0wLSfj3Ml47SOLLH0siHAB+TgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Tk+Xly+Y
Subject: Re: [Buildroot] [PATCH 1/1] package/apache: security bump version
 to 2.4.64
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



On 10/07/2025 22:05, Bernd Kuhls wrote:
> Fixes CVE-2025-53020, CVE-2025-49812, CVE-2025-49630, CVE-2025-23048,
> CVE-2024-47252, CVE-2024-43394, CVE-2024-43204 & CVE-2024-42516.
> 
> Changelog: https://downloads.apache.org/httpd/CHANGES_2.4.64
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   package/apache/apache.hash | 6 +++---
>   package/apache/apache.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/apache/apache.hash b/package/apache/apache.hash
> index da0b1f1f17..748be01de7 100644
> --- a/package/apache/apache.hash
> +++ b/package/apache/apache.hash
> @@ -1,5 +1,5 @@
> -# From https://downloads.apache.org/httpd/httpd-2.4.63.tar.bz2.{sha256,sha512}
> -sha256  88fc236ab99b2864b248de7d49a008ec2afd7551e64dce8b95f58f32f94c46ab  httpd-2.4.63.tar.bz2
> -sha512  a804ca564dfee5907fe4ce4f36884815bace0621bc7b8c9aa7c99472a954aa19cb13733f90678ff3d58ab3c76cc0e33a27e1035dc1d8cb597a9622154c59ef48  httpd-2.4.63.tar.bz2
> +# From https://downloads.apache.org/httpd/httpd-2.4.64.tar.bz2.{sha256,sha512}
> +sha256  120b35a2ebf264f277e20f9a94f870f2063342fbff0861404660d7dd0ab1ac29  httpd-2.4.64.tar.bz2
> +sha512  299cb0d87a7e0e0a99d22bba7349b6b07c69222897410f9670af29896288d1f4e1da81d22ac9e1d8d6ea096e88044ab1dd34555b40a4b1b1cb3fd4b1d1897a7a  httpd-2.4.64.tar.bz2
>   # Locally computed
>   sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
> diff --git a/package/apache/apache.mk b/package/apache/apache.mk
> index 14676a5aee..7e9fb522b5 100644
> --- a/package/apache/apache.mk
> +++ b/package/apache/apache.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -APACHE_VERSION = 2.4.63
> +APACHE_VERSION = 2.4.64
>   APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
>   APACHE_SITE = https://dlcdn.apache.org/httpd
>   APACHE_LICENSE = Apache-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
