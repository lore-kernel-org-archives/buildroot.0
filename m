Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BEFC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 19:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44D4F6147C;
	Wed,  7 Feb 2024 19:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVNzJZ0dv7iv; Wed,  7 Feb 2024 19:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4884B61480
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4884B61480;
	Wed,  7 Feb 2024 19:14:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D42951BF577
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C12FA8106A
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 19:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6qQwmsTN9gpG for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 19:14:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B477180FAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B477180FAA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B477180FAA
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 19:14:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [84.198.244.196])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 41C7E6013D;
 Wed,  7 Feb 2024 20:14:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Feb 2024 20:14:16 +0100
Date: Wed, 7 Feb 2024 20:14:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Reza Arbab <arbab@linux.ibm.com>
Message-ID: <ZcPWiF48ZmAVFALi@landeda>
References: <20240207175135.1532037-1-arbab@linux.ibm.com>
 <20240207175135.1532037-2-arbab@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240207175135.1532037-2-arbab@linux.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707333265;
 bh=wFLzb0+dY0SChtq91Qtxzqgkb+nLzGfrFS/ywNj2iXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mOqyUJAq1goMcZhSQFHcNwYxxErOuC7XZGGxbUc8/EREJ24Vz6BAT/BH5EsWQs3Rw
 7gcwkT/HWuueVRkD+t5XADWhRzymstYPk8eJXBK8irCfyuV5RPfMNisyvRWoqyVWXo
 u8ELkDXRjC5ULQyW5f7ZCVNBRWzIvGGzDR42zc/B4G1lRbzRBPzxqgJevPKxR4y6xZ
 PmoC+p+HbIi4ie9jsALtLWbl25Wq0f219NpShkup+8vEPHW5OxOVGvPZBAQgnRs/ty
 olu3bQm6YlGshQhwUyvZkd8dALOQ+8FxGyTnDS/3kD9L6CTyQ1Avcj3/tVVh1TsCyQ
 4hRUmWFxlfn5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mOqyUJAq
Subject: Re: [Buildroot] [PATCH v5 1/5] package/petitboot: minor makefile
 cleanup
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reza, All,

On 2024-02-07 11:51 -0600, Reza Arbab spake thusly:
> Normalize the order of arguments to $(INSTALL). Remove an unnecessary
> pair of parentheses.
> 
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/petitboot/petitboot.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> index 2087f01b090c..4c8bc35adb38 100644
> --- a/package/petitboot/petitboot.mk
> +++ b/package/petitboot/petitboot.mk
> @@ -63,15 +63,15 @@ define PETITBOOT_POST_INSTALL
>  		$(TARGET_DIR)/etc/petitboot/boot.d/01-create-default-dtb
>  	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
>  		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
> -	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
> +	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/S15pb-discover \
>  		$(TARGET_DIR)/etc/init.d/S15pb-discover
>  	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-console \
>  		$(TARGET_DIR)/etc/init.d/pb-console
>  
>  	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
> -	(for port in $(PETITBOOT_GETTY_PORT); do \
> +	for port in $(PETITBOOT_GETTY_PORT); do \
>  		printf 'SUBSYSTEM=="tty", KERNEL=="%s", RUN+="/etc/init.d/pb-console start $$name"\n' "$$port"; \
> -	done) > $(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
> +	done > $(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
>  
>  	mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
>  	ln -sf /usr/sbin/pb-udhcpc \
> -- 
> 2.39.3
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
