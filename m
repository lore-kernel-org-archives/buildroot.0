Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E98C83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AF1082023;
	Thu, 17 Jul 2025 20:05:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQ2EjHlic3OD; Thu, 17 Jul 2025 20:05:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5267981FE7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5267981FE7;
	Thu, 17 Jul 2025 20:05:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 78BA1DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F1C1607B2
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jUt9oo5xLvOz for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:05:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8845360750
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8845360750
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8845360750
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:05:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E9223B977A8D; Thu, 17 Jul 2025 22:05:36 +0200 (CEST)
Message-ID: <bc844a76-a188-4f43-83f8-ab272873c6c3@rnout.be>
Date: Thu, 17 Jul 2025 22:05:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tim Soubry <tim.soubry@mind.be>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250710112849.341011-1-tim.soubry@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250710112849.341011-1-tim.soubry@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782737; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=EllVXdxGHAcC6+XHwl+0du2EicRiIG3CVWVR+Rp/PX0=;
 b=niw9tTFJ5VXr3L6tTGTJOiEPgn0woHRM2zU8WT0aLrqQ3Qu9j/1p23e1LMCF5oUQ1pywdU
 hhWa+9k10BVfSWvNFlA41AYSpXtwJnRo3R6FF2KOi78KEbsZtF9JC22l0MSPCUDPZ88uj9
 DvbORoB8rBiCBll5T+fO2PE/uwaQdGQv5ePlV0Sn+GbtOPaghvLlc87dnzDLbK3Kig8SHp
 9+IaSsHAfG7KQgPNrwve2BTUr1GOOwkGVtVbmomkaaGjQlCiG6Cwc+H8LwY9AjksHgtmfJ
 mXugCtDs+yFRZrSw3M4CO/ARJDE4YLs75YXBar++XLvIRxhfyZE/5DQZ7iEEeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=niw9tTFJ
Subject: Re: [Buildroot] [PATCH 1/1] package/libhtp: security bump to
 version 0.5.49
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



On 10/07/2025 13:28, Tim Soubry via buildroot wrote:
> Fixes a potential Denial of Service as described in [1].
> Release notes:
> https://github.com/OISF/libhtp/releases/tag/0.5.49
> 
> [1] https://github.com/OISF/libhtp/security/advisories/GHSA-rqqp-24ch-248f
> 
> Signed-off-by: Tim Soubry <tim.soubry@mind.be>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   package/libhtp/libhtp.hash | 2 +-
>   package/libhtp/libhtp.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
> index 1809bc93a3..2e93586f7a 100644
> --- a/package/libhtp/libhtp.hash
> +++ b/package/libhtp/libhtp.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  7f0719732fd0c82f9915e3df27e31548798590ad624fbad24f58b50885248ab8  libhtp-0.5.48.tar.gz
> +sha256  214395f8b42011154e133dfb4e94d15e4e3e3e12535e744a4c1eec8687d12c18  libhtp-0.5.49.tar.gz
>   sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
> diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
> index 8735f593d9..bb6559bc92 100644
> --- a/package/libhtp/libhtp.mk
> +++ b/package/libhtp/libhtp.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LIBHTP_VERSION = 0.5.48
> +LIBHTP_VERSION = 0.5.49
>   LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
>   LIBHTP_LICENSE = BSD-3-Clause
>   LIBHTP_LICENSE_FILES = LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
