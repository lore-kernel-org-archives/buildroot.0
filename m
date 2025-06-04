Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21D6C5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:24:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99AE083A63;
	Wed,  4 Jun 2025 18:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2Q0tmiwFfn9; Wed,  4 Jun 2025 18:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA7F583300
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA7F583300;
	Wed,  4 Jun 2025 18:24:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C6C1DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F3BB83312
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7B4W7JCvRu3b for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:24:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6384180E18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6384180E18
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6384180E18
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:24:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7DC981C010A; Wed,  4 Jun 2025 20:24:38 +0200 (CEST)
Message-ID: <17016dd4-1a0f-468c-91ff-ac6a79a5eded@rnout.be>
Date: Wed, 4 Jun 2025 20:24:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
Cc: Asaf Kahlon <asafka7@gmail.com>
References: <20250516113325.795849-2-buildroot@heine.tech>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516113325.795849-2-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749061478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EvwDo0bsp0ovKUdodYL4NumAzE9GnzVZ6VYhPNcUEYo=;
 b=GyvDoafxX2GdCzZXjhXRk7nrLDKInmeCifkb7qxXobbxHZne/4zW5KPYKCK3jucibPXeOD
 iLZQAj7ZoP+90n1O6bWBnMxP533RdHdiOjoX20JICzAf0dBXlkrChdSYGWAsb3P2/30vTZ
 f9NCciNkwN76hsLovMXYxK0UtBrDlixeYsqLdre1WyMVDKtqiVHxthBLgUApjSotexSj1Y
 03BPQ8b01UaT/pftolfUw1K+A5xDWQygogKNGL4ht/B3o9LgoeNEpMLISUJEiUebO9s0OW
 eDugdYDpBzpsxfQmtv+iUSgsZX9Wkbz6PiCCFIVaZTc8umij6ePyYsamwbs/9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GyvDoafx
Subject: Re: [Buildroot] [PATCH] package/spdlog: bump version to 1.15.3
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



On 16/05/2025 13:33, Michael Nosthoff via buildroot wrote:
> Release Notes: https://github.com/gabime/spdlog/releases/tag/v1.15.3

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/spdlog/spdlog.hash | 2 +-
>   package/spdlog/spdlog.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/spdlog/spdlog.hash b/package/spdlog/spdlog.hash
> index 12fd2e2fd4..6803ab5168 100644
> --- a/package/spdlog/spdlog.hash
> +++ b/package/spdlog/spdlog.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  7a80896357f3e8e920e85e92633b14ba0f229c506e6f978578bdc35ba09e9a5d  spdlog-1.15.2.tar.gz
> +sha256  15a04e69c222eb6c01094b5c7ff8a249b36bb22788d72519646fb85feb267e67  spdlog-1.15.3.tar.gz
>   sha256  4ccecab18d1ff0b61174fe3d6c430541625d3ddb865b0d5887db296f883c76e7  LICENSE
> diff --git a/package/spdlog/spdlog.mk b/package/spdlog/spdlog.mk
> index fb9a33c2ca..598f937dbd 100644
> --- a/package/spdlog/spdlog.mk
> +++ b/package/spdlog/spdlog.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SPDLOG_VERSION = 1.15.2
> +SPDLOG_VERSION = 1.15.3
>   SPDLOG_SITE = $(call github,gabime,spdlog,v$(SPDLOG_VERSION))
>   SPDLOG_LICENSE = MIT
>   SPDLOG_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
