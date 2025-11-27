Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F493CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47AAA60A7F;
	Thu, 27 Nov 2025 20:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NUyMTUhJLnIh; Thu, 27 Nov 2025 20:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A451616EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A451616EA;
	Thu, 27 Nov 2025 20:04:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 613E0708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E987413ED
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJpR--IneTcl for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:04:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D2DBE41427
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2DBE41427
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2DBE41427
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:04:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0453EB979CA9; Thu, 27 Nov 2025 21:04:06 +0100 (CET)
Message-ID: <216847e5-938d-4faf-8c34-617bc7c5a393@rnout.be>
Date: Thu, 27 Nov 2025 21:04:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251119202016.563421-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251119202016.563421-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273847; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=3xmRE1I7NHobo/dT5ovqUKoy1o9kIiWAD+epthB9q84=;
 b=Gb4ah416+YWmpup8obx5kKLq2sDy/ZuQ73dPAW0D+qjiues/3d82owuBTUGqnYhflK8Vee
 X894UH6l3krWONcMuctabMrr364bOnxIwaJKkbEj0Ulswfhxx2FOd3kij7RTPIGjzgibyV
 h4ukdz8eZt6dN/Bk0OmF3TVdK7a1ijYqfFd1SaCkiBWYiuJCRxn2OYon6BVIqP8HZo/Zv5
 BpfcSf1VQZdoXzyRJAc7WjE4Ob8pVvUFVTc9BqgIQ4Fj0fKn4NuUZ7chLxoirvIog3uXH9
 LvmkkzuWL93sDTh5DZqUsRhpjcGk89VGpC/JTYWnCnNPIc1FnZSQmArXrMBlgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Gb4ah416
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: security bump version
 to 2.6.16
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



On 19/11/2025 21:20, Bernd Kuhls wrote:
> Fixes CVE-2025-13086.
> 
> Release notes:
> https://sourceforge.net/p/openvpn/mailman/message/59261309/
> 
> Changelog:
> https://github.com/OpenVPN/openvpn/blob/release/2.6/ChangeLog
> https://github.com/OpenVPN/openvpn/blob/release/2.6/Changes.rst
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/openvpn/openvpn.hash | 2 +-
>   package/openvpn/openvpn.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
> index 353e8a8051..0123babe4b 100644
> --- a/package/openvpn/openvpn.hash
> +++ b/package/openvpn/openvpn.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated after checking signature
> -sha256  e35513ee15995e3c71adfd8891b9f33522896c70b3baa2ed9a23c7a42c4d7bde  openvpn-2.6.15.tar.gz
> +sha256  05cb5fdf1ea33fcba719580b31a97feaa019c4a3050563e88bc3b34675e6fed4  openvpn-2.6.16.tar.gz
>   sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYRIGHT.GPL
> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index 26558c3d16..0175c51d63 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENVPN_VERSION = 2.6.15
> +OPENVPN_VERSION = 2.6.16
>   OPENVPN_SITE = https://swupdate.openvpn.net/community/releases
>   OPENVPN_DEPENDENCIES = host-pkgconf libcap-ng
>   OPENVPN_LICENSE = GPL-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
