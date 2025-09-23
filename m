Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0D5CAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 20:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86D6D40C8C;
	Tue, 23 Sep 2025 20:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L4AiLF2KLioY; Tue, 23 Sep 2025 20:16:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C40C040AD2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C40C040AD2;
	Tue, 23 Sep 2025 20:16:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 021BEE7
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 20:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7E2D40A98
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 20:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFmlvzythnck for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 20:16:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D2B4408A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D2B4408A4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D2B4408A4
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 20:16:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EBA5CB0054E;
 Tue, 23 Sep 2025 22:16:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 23 Sep 2025 22:16:18 +0200
MIME-Version: 1.0
Date: Tue, 23 Sep 2025 22:16:18 +0200
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
In-Reply-To: <20250921181748.416113-1-raphael.pavlidis@gmail.com>
References: <20250921181748.416113-1-raphael.pavlidis@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <952c26d08945d7c798264805f7ae3cd9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758658581;
 bh=xSB8GOcfnBxm/wGYmIvM70E+59CvLGWRWggw+bvetO4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rTXxEa08HK6bjBCuOEtWJvBCVnfSEK2bye7KGfFOFzNU/kO47NXqgy9/UkyWVRPr4
 miPOGzhkNHQSNYqOwVTKBosWdVBjvPhXLz4Qp/MJzJ1PlxrEs3JGiFnHX7oLMztC/1
 pgOn90OlUmR5JsuVHGU11igT/gWtSiJ+wJBrHS8uNP3hlWfz0N7Gbg9/Z8PVp1SZDz
 SKzmU9ZBlxTl8+HqxT1yFRePEtf4pZ1IJTkIJyJibL1t8gDupDiz7dsZ5e/3S5Vw4a
 wt1z1nAnHZXhR+a+rdqjnozTUByAjfDeGwHy7TdUB+q3mBuGaAyelfC7dMb+ybzDW2
 d7XVq/ysGa/PA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rTXxEa08
Subject: Re: [Buildroot] [PATCH v1 1/2] package/wlroots: bump to version
 0.19.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Raphael,

Thanks for the patch.

On 21/09/2025 20:17, Raphael Pavlidis wrote:
> Changelog:
> https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.19.0
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
> ---
>  package/wlroots/wlroots.hash | 4 ++--
>  package/wlroots/wlroots.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
[...]
> diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
> index 81f76fcdc7..689662f536 100644
> --- a/package/wlroots/wlroots.mk
> +++ b/package/wlroots/wlroots.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -WLROOTS_VERSION = 0.18.2
> +WLROOTS_VERSION = 0.19.0

Updating wlroots to 0.19.0 breaks cage 0.2.0 due to the breaking changes 
described
in the release note.

Could you also send a patch that bumps cage to
v0.2.0-15-g2e593fe5a8a2186a558ceb414674775e4ba5d2b1
or greater, please? (no need to resend this series)

>  WLROOTS_SITE = 
> https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/$(WLROOTS_VERSION)/downloads
>  WLROOTS_LICENSE = MIT
>  WLROOTS_LICENSE_FILES = LICENSE
> --
> 2.51.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
