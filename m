Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A60C4451B
	for <buildroot@archiver.kernel.org>; Sat, 18 Jul 2026 14:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67C4D80E14;
	Sat, 18 Jul 2026 14:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yuOMWNhnKH3; Sat, 18 Jul 2026 14:40:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FDA580E17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784385628;
	bh=mEiAjOtm1PcH6rA27sNmE4EhHdHwgq2NJ8a7aaiIiwg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g0uDY0tY1xipiBJ7InWc3PImJwoa4pPJ0JosUaezO3X2FpoWDGsTZ4DoClu0YB2gD
	 KgcZf8C8cqgZnlN8FG4FSTxXtoSErbFRufDBg3ifSQSYjpAoQahxIDz1zoWDAT0JoW
	 EX+SoNbbRKbjn7mu2t8WAmSqSbgZIJf2mHCgcs1z0vYekvofIFpjoDjxLHxeahxb1p
	 qanoTS7G0OmLdWXWymaFe9yJ4unLvyz5OLHCtlXLFSClrYYrGFW6wGVvkNDFGUKU8o
	 +kkHMccX82jqgWHANmGZwIRoQIOgoX6Bfq3T06NpQPDzF3L/G+8TTKz7ryfvVuwdji
	 UE5o+p56VW1Vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FDA580E17;
	Sat, 18 Jul 2026 14:40:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1FC85320
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 14:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11A0180E17
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 14:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1s5sOkQJz347 for <buildroot@buildroot.org>;
 Sat, 18 Jul 2026 14:40:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A14F380E14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A14F380E14
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A14F380E14
 for <buildroot@busybox.net>; Sat, 18 Jul 2026 14:40:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 084842003C3;
 Sat, 18 Jul 2026 16:40:21 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jul 2026 16:40:21 +0200
MIME-Version: 1.0
Date: Sat, 18 Jul 2026 16:40:21 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260612205029.269642-5-francois.perrad@gadz.org>
References: <20260612205029.269642-1-francois.perrad@gadz.org>
 <20260612205029.269642-5-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.17
Message-ID: <9d76b28385a58382342c861391086b1d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784385623;
 bh=al1LwH6PllJGErBbuGWLQpOOZazXo/IDcyKVCYqfff0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BGcicaAiJo95v8krum15S1miaaNU5C2omf8Y13p9nEKpDZlo8kzJ+78qrFLGMnDKj
 pFs59+Ny1kofxxQQ0XtnDhBeaUJGJPw4BNF8Y0y1+VYUsHlXPMzyENTQ28K2/JHEvQ
 rytHcLJG7TlLx1+ytt5/yXLHTF2twc0lt8MX78KPdAh0Rg44csHsNX39B+7MWQcrtR
 letXdm30ItE8JJhTrvlwuWNfVtXiFmUxWFBt2LOQR5NA2+J0ccm44IcdkRhPyFc/TV
 4g1uAaHBvXrYukCzxY/HssDC6zedjNynfeCaEnCbWZx+OrBTs7PUAGvCiSBE9+peQY
 i7b/YTS8BLepw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BGcicaAi
Subject: Re: [Buildroot] [RFC PATCH 4/9] package/hare: new host package
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

Hi Francois,

On 12/06/2026 22:50, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS                  |  2 +-
>  package/Config.in.host      |  1 +
>  package/hare/Config.in.host | 14 ++++++++++++
>  package/hare/config         | 45 +++++++++++++++++++++++++++++++++++++
>  package/hare/hare.hash      |  3 +++
>  package/hare/hare.mk        | 27 ++++++++++++++++++++++
>  6 files changed, 91 insertions(+), 1 deletion(-)
>  create mode 100644 package/hare/Config.in.host
>  create mode 100644 package/hare/config
>  create mode 100644 package/hare/hare.hash
>  create mode 100644 package/hare/hare.mk
[...]
> diff --git a/package/hare/hare.mk b/package/hare/hare.mk
> new file mode 100644
> index 000000000..39b0cc77a
> --- /dev/null
> +++ b/package/hare/hare.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# hare
> +#
> +################################################################################
> +
> +HARE_VERSION = 0.26.0.1
> +HARE_SITE = https://git.sr.ht/~sircmpwn/hare/archive
> +HARE_SOURCE = $(HARE_VERSION).tar.gz
> +HARE_LICENSE = MPL-2.0
> +HARE_LICENSE_FILES = COPYING
> +
> +HOST_HARE_DEPENDENCIES = host-qbe host-scdoc host-harec

Could you sort dependencies alphabetically please?

HOST_HARE_DEPENDENCIES = host-harec host-qbe host-scdoc

> +define HOST_HARE_CONFIGURE_CMDS
> +	cp package/hare/config $(@D)/config.mk
> +endef
> +
> +define HOST_HARE_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(HOST_DIR)" all
> +endef
> +
> +define HOST_HARE_INSTALL_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(HOST_DIR)" install
> +endef
> +
> +$(eval $(host-generic-package))
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
