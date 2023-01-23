Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F095FC38142
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 06:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FF0F60BF3;
	Mon, 23 Jan 2023 06:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FF0F60BF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SgIjaTrjXfD7; Mon, 23 Jan 2023 06:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C658D60BF4;
	Mon, 23 Jan 2023 06:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C658D60BF4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC3F81BF5A9
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 06:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96943405D9
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 06:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96943405D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sp8RaSy9oV95 for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 06:26:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D661405B1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D661405B1
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 06:26:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 93F665FF33;
 Mon, 23 Jan 2023 07:26:26 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 23 Jan 2023 07:26:26 +0100
Date: Mon, 23 Jan 2023 07:26:26 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20230123062626.GA2632@scaer>
References: <20230123051808.2213859-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230123051808.2213859-1-troglobit@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1674455188;
 bh=ctCHc+KFrarySNLBM9qrqNKFCJhOsuRVWO74RD4wZ8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ux/XurzyLS7JqDUmNXN9kufGMIjbDK9wdXBy0zWQE/icQYuZhth6MdMO9Cr8OiBhg
 NVZSpNXWzB+oI08RCQVdXa7VxuxnNn4eCRcsVftZzOtdLo/x3b0dbpsxLpOEOgEvZC
 xmmsSmKKctenDBhMVHIe/kK26+ny2QaT0FyOm35HJZyt7Cwdzlbnx10CpA7mFkWjvk
 FleA0gt9KXGUrHzftpDXVwCStKBEt9gmyIH1ozrf4IXKUwje2vHacS2U0Yb9YU09gs
 oN3tjlejtQkaN1ovQSuo1Qlc/9csPfgnCw0ed5IXJwe94Fc7lV7da/aMG953fKlifG
 6cw+rmKUlMwIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ux/Xurzy
Subject: Re: [Buildroot] [PATCH 1/1] package/ssdp-responder: fix misspelled
 define directive
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joachim, All,

On 2023-01-23 06:18 +0100, Joachim Wiberg spake thusly:
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ssdp-responder/ssdp-responder.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
> index fd7b1ea44b..d40f6f8c57 100644
> --- a/package/ssdp-responder/ssdp-responder.mk
> +++ b/package/ssdp-responder/ssdp-responder.mk
> @@ -25,7 +25,7 @@ define SSDP_RESPONDER_INSTALL_INIT_SYSV
>  		$(TARGET_DIR)/etc/init.d/S50ssdpd
>  endef
>  
> -define SSDP-RESPONDER_INSTALL_INIT_SYSTEMD
> +define SSDP_RESPONDER_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 $(@D)/ssdp-responder.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/ssdp-responder.service
>  endef
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
