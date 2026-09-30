Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A717CA5FC1
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 08:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEFD340841;
	Wed, 30 Sep 2026 08:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ZBGqBB06Cio; Wed, 30 Sep 2026 08:48:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B2C00407B2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790758110;
	b=bnJ4qy/0mq9U5Q/fJddXUqFNMcvnaA5UnBAzx/AjPMOPSSHXBUchqNsgm/QQZgDuZGDE
	 Iumuc5NYf+SIlle3rXWsiHzlCXXSDMvMr66o0z2QqnnPEZCL/CjyXuBV0ewXo60ecvbdx
	 y6U4Ykb1gxSAUHCrnqnBfMflMEcThtsH6ch4lCtOB2BuHHjs7pTSo4jnSn2pzJr2dmrZ0
	 rb3ictLij31zz2mvgFNN/VOcWHabTNCm6pyCfhbMQ71ENQnfu5h6787uJ7hEbp3d1mSqB
	 5cehVRIJG0FdtFMLOfHIzGSa3NEF55gXK4vQMO5E4BQHC2DG5xgwt/c/mFdV2y6DClQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790758110;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:Date:
	 To:Cc:Message-ID:References:MIME-Version:Content-Disposition:
	 In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8E/a1nAUfWKkLwSz6l4A/ougC7OpuHjCQXsS/Lo9yhc=;
	b=VuqHUNO8uP45/67jT0/uFyh6xJSnfGnYPWbgp4kwMVHYJCyEJ+BQmBZsoj1fHgIEn54u
	 PuSZJTunK0euI61VH8yJgvUCF8uxJhyFNEf0hlQNvfUN/v7LE46mE3k2WQzILqzu0/UEt
	 J2eZTIkvGCIGudX+9OOmf26ox8VyEBjBr7//tFwcPKel8eEcXFOd9dgwFJOoUyxsdLzxP
	 4MRpSGWyTqWo/Bn3HtMfne14v6VxK3mOovmPGTGclI6elK1IOvDfZxXJqfKbbTJEEWRV8
	 Hv35UUw6vy13Xw2lfeSPKP14Phdk9RM3oCC8ohB7ReCiCOAohROk41Lsqbh/eBvJQVg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790758110;
	bh=8E/a1nAUfWKkLwSz6l4A/ougC7OpuHjCQXsS/Lo9yhc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DCsP19MBz33u84KVE93EMg5JknZ08uyMwTihgdTnonF+x6505oblODWEp9Q4GD4Rl
	 mh//3IMApiMfuROqfVGONfc/xS6aIzfJxJx5loGPRdCmoe0gUoNmK6O/XMrf+Gxakl
	 2N2hahYG2XSJ3Cmml5v6JXxzCRxnatjiZl5s7hNjjEkaPF6zvGG69J9qRWv12KKbLX
	 nA30aigLPcCHby3C1W7TfD/kpJAmJdBpviHFOvGLAx5syo/CaYyMKzWjSHIcrfYIt+
	 XlaltLKQ7U7jt19n19A5CkW2KeJOpOgyHlYBoa9F19/nmYOSivNNGO1sh2wpSJEtGx
	 sf35yXsUt1r6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2C00407B2;
	Wed, 30 Sep 2026 08:48:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96B8D22B
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 08:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C0F080A89
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 08:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t87Xx5PayEwf for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 08:48:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5BC0F80A68
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790758087;
 b=RDvcWIM9GaqnEzWBNN+xS/fpVaQEyejHtsTps9vVPHetI/L6XSGcsNK+kIltRfx8/Y1G
 SZ5jE/mGkEED3Hp/XH4Rm7Dof9H5VZdMZU+ybQC9sRrQ2J8OWe4bt4rP7UWCSknGOlyxu
 9kY8+xiwF/9R4eXZn5c91PN1fD2UqwmtjQSGVAs3T5FZkcBNJmrq2fpbwA5MOyqSaVtYo
 V8NyGUT+dLkgduIeYkNBUqY/65GreHcSh4RRzjooPf7+ynP4XceZy8uCEAzMYi55ojih6
 LO8G7zhk+M308y+tPga0sgy4IgXbfxKFiIUZ+QfMIkQMOoF8C5p3MDTxTTng3u2OoWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790758087;
 h=Received-SPF:Received:DKIM-Signature:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To;
 bh=pX/0G8GbMIN4oMWXauFmddgIiEps9psAXv9tGq29Tp8=;
 b=shWedlnsGpbqQ89WNuKwZN/sDhBMrM4RPQI+4vx8uTGWKWSfO1bfDVndrb36l4SBLNVb
 RBRqnSOfUsrb0r1AmuWpcFEcOmq2nJ9/hh7BMkXbiDG7OilrneL2YFpbDOhbvmii0Depx
 2SA2bzFU5GoJlfj+NkKFvh5S8CMnmUb1TNaVj6LGbSHx13WBa1E5E93lOshwXZpJeTSoB
 +X9vfQNYW6TQY7DIgENW50M6jC96Si+NbvEmBkwco3b05U1JAsnstKBFhtnct5+CzMRy1
 RwHZMYNUSU/DN6BE0tyFDMMffqZxjfcx7jAq1HHs3W5p4AT97SHofKNGJ6jmIE4Aiag==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="ovX8pJi/"; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BC0F80A68
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 08:48:06 +0000 (UTC)
Received: from L20747.iliad.fr (unknown [213.36.7.12])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C61DA780333;
 Wed, 30 Sep 2026 10:48:01 +0200 (CEST)
Date: Wed, 30 Sep 2026 10:48:00 +0200
To: Thibaut Collet <thbt.cllt@gmail.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Message-ID: <arzMwFo4PcYt2vyv@L20747.iliad.fr>
References: <20260930072441.174807-1-thbt.cllt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260930072441.174807-1-thbt.cllt@gmail.com>
Subject: Re: [Buildroot] [PATCH v2] package/lldpd: fix compilation issue
 with kernel 7.3 on aarch64
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thibaut,

> Changes v1 -> v2:
>   - Only remove the bundled headers for kernel headers >= 4.19
> 
>  package/lldpd/lldpd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
> index f0cbc7e436..9ecf622b22 100644
> --- a/package/lldpd/lldpd.mk
> +++ b/package/lldpd/lldpd.mk
> @@ -61,6 +61,13 @@ else
>  LLDPD_CONF_OPTS += --without-readline
>  endif
>  
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19),y)
> +define LLDPD_DROP_UAPI_FILES
> +	rm -rf $(@D)/include/linux
> +endef
> +LLDPD_POST_PATCH_HOOKS += LLDPD_DROP_UAPI_FILES
> +endif
> +

Reviewed-by: Vincent Jardin <vjardin@free.fr>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
