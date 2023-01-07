Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F3AC46467
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 13:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0660D60BFC;
	Sat,  7 Jan 2023 13:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0660D60BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nmQ75spcMv0g; Sat,  7 Jan 2023 13:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B84760BB1;
	Sat,  7 Jan 2023 13:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B84760BB1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6A911BF3B8
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 13:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80D304109B
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 13:11:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80D304109B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4t23Tk2LczaP for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 13:11:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B44E408CF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B44E408CF
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 13:11:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.243.59])
 by smtp3-g21.free.fr (Postfix) with ESMTP id D5D8E13F86F;
 Sat,  7 Jan 2023 14:11:13 +0100 (CET)
Received: from [37.169.185.64]
	by webmail.free.fr
MIME-Version: 1.0
Date: Sat, 07 Jan 2023 14:11:13 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20230106194722.1793331-3-peter@korsgaard.com>
References: <20230106194722.1793331-1-peter@korsgaard.com>
 <20230106194722.1793331-3-peter@korsgaard.com>
Message-ID: <7ab2b6d47039653cfd8927e3035006fc@free.fr>
X-Sender: ju.o@free.fr
User-Agent: Webmail Free/1.3.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673097074;
 bh=obVcLMaqokDNnrSu9QR0v4g3YND00aKnvQXvGY5oZy4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JO/cei9xqCcZvCSXSzxAAEZCIh/Tiai7Jv2reYjLFiBfMxH58i70UOK8P/P3IHqo+
 t6JwzfDWfDOR+ut9hTnoTLXX97GkX6ZdRXdf/EJ6D5ZHHZuTpYJCgmGvBkb6Nu1EEF
 pf8B9WBE26ATiQa4fC1JCqfMaqiKcZMWDn/P1DQpcaW/LNchJ8XZjAkVArjbw36b8n
 /0Ug2Y6hLxOiLISdZ+8jRqCQ+ersam7CzUjwOyiSdpG2M+X2K8xmVCr5K1mPAeDg+z
 dG+HhE5/6b1D8OZXOB/MUChmivbJBwZNzVSiimZgCDiX0BfD+QAnEkJ/nllQpqsRIh
 PSJvIKKbooCvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JO/cei9x
Subject: Re: [Buildroot] [PATCH 3/3]
 configs/sipeed_lichee_rv_dock_defconfig: use OpenSBI 1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

I successfully tested this patch on top of branch master
at commit a0a428f with commands:

     make sipeed_lichee_rv_dock_defconfig
     make
     sudo dd if=output/images/sdcard.img of=/dev/sdX

It fully booted on an actual board, reached user space login.

On 06/01/2023 20:47, Peter Korsgaard wrote:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Julien Olivain <ju.o@free.fr>
Tested-by: Julien Olivain <ju.o@free.fr>

> ---
>  configs/sipeed_lichee_rv_dock_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/sipeed_lichee_rv_dock_defconfig
> b/configs/sipeed_lichee_rv_dock_defconfig
> index 807209eeec..a228cd8cb7 100644
> --- a/configs/sipeed_lichee_rv_dock_defconfig
> +++ b/configs/sipeed_lichee_rv_dock_defconfig
> @@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  # BR2_TARGET_ROOTFS_TAR is not set
>  BR2_TARGET_OPENSBI=y
>  BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> -BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.1"
> +BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
>  BR2_TARGET_OPENSBI_PLAT="generic"
>  # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
>  BR2_TARGET_UBOOT=y
> --
> 2.30.2

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
