Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B22AC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 06:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0624660A7F;
	Mon,  8 Jan 2024 06:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0624660A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bt-SDEn1FYO2; Mon,  8 Jan 2024 06:33:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70B5960743;
	Mon,  8 Jan 2024 06:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70B5960743
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE19D1BF387
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 06:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A61CB606A0
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 06:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A61CB606A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MILatZntfEpP for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 06:33:16 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36A2860692
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 06:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36A2860692
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 5780E4402E9;
 Mon,  8 Jan 2024 08:31:03 +0200 (IST)
References: <20240108013056.39493-1-patrick.oppenlander@gmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
To: patrick.oppenlander@gmail.com
Date: Mon, 08 Jan 2024 08:28:58 +0200
In-reply-to: <20240108013056.39493-1-patrick.oppenlander@gmail.com>
Message-ID: <87bk9w2v2v.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1704695463;
 bh=y+w77fiJrIzSwcGXA6eHLG/xFLizeF3hs3Qs1BpLJ9Y=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=vjC80pniLJ3LIU/SGFt9qIJNnr61pU/x1Hmj1lQiyp2NyI+43C5AN83lYOYjAkwex
 P6HX536FLPZNXIDOpvToS+BBpMPPTBZYeo+UIvaB5ilI/FQEpyKLA0lL/VIa7+Mwkw
 AZTxkG6ZS+7pIkZHh18PFoJX2NIgm7vyHDPLb+aluyf25rszU32woxcsOJOplIUUhn
 loz0UtWuhEPHcCf7zun9pgXfX192rMGE/QTzEnrGliLJxZI6aSLIKJLSnLJYeSLHxP
 Opni8PAHlvOHVlOOak1fQAm9oBKL7/w2J1DV4kGU+ZGSOxGIZt8eNWOFnJm1es1uha
 qiLTDk8iRD3fQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=vjC80pni
Subject: Re: [Buildroot] [PATCH] package/minisign: new package
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Patrick,

On Mon, Jan 08 2024, patrick.oppenlander@gmail.com wrote:
[snip]
> new file mode 100644
> index 0000000000..d6be41b2fe
> --- /dev/null
> +++ b/package/minisign/minisign.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# minisign
> +#
> +################################################################################
> +
> +MINISIGN_VERSION = 0.11
> +MINISIGN_SITE = $(call github,jedisct1,minisign,$(MINISIGN_VERSION))
> +MINISIGN_LICENSE = ISC
> +MINISIGN_LICENSE_FILES = LICENSE
> +MINISIGN_DEPENDENCIES = host-libsodium libsodium

Does target minisign need both libsodum and host-libsodium?

What about host-minisign? Doesn't it need host-libsodium to build?

To add dependencies to the host package, set HOST_MINISIGN_DEPENDENCIES.

baruch

> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +MINISIGN_CONF_OPTS += -DBUILD_STATIC_EXECUTABLES=1
> +endif
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
