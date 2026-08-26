Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B87C5DF97
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 20:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83F994072F;
	Wed, 26 Aug 2026 20:04:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jr_0qLj5SRNn; Wed, 26 Aug 2026 20:04:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787774698;
	bh=EC5k+x9hempW4XFmBwS4dSmyXEmTNy1dwSVkKlu45jo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZcesWXUvyq6HK5wwlbIGoDGCkxgMn1wMd67O+QuRGySYUrfmZdPbzoN+Z9H4/PnrU
	 CtZywvE3bMqfYU7Tz+C69uTWa/29cVAQbXU7sCiKuANx36AACp1zB+1LY/TB7UIwi0
	 dKt3b+z+B9G62oM+mAvpTCfa22xAmJmoGRwjMMc5pS9O9VeuW+TdBpRLcrHOzapnTw
	 ReW4DShY7T385qojVIDMTgzk1wiJAxIVfqXmvOgxlkHyX1F3NL57+e/XbfWL92V8qC
	 GP41D7v8dNhJRBYzB9/2eP8WSpVrWIY7agIyj1c69lzjmTEA47dPoNXjU/MG4lDb3x
	 P+tjSZFT2nDzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9BB440760;
	Wed, 26 Aug 2026 20:04:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71F41341
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63C916060C
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7B4WsPEjQio0 for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 20:04:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76A2C605F3
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 20:04:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E89D41A1851;
 Wed, 26 Aug 2026 20:04:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B73A8604EC;
 Wed, 26 Aug 2026 20:04:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE41511C78051; 
 Wed, 26 Aug 2026 22:04:46 +0200 (CEST)
Date: Wed, 26 Aug 2026 22:04:45 +0200
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Cc: buildroot@buildroot.org
Message-ID: <ao9GvpCwy_2UKUEn@windsurf>
References: <ansJ5dXXblvYeMLB@windsurf>
 <87h5kzya8h.fsf@li-0ccc18cc-2c67-11b2-a85c-a193851e4c5d.ibm.com>
 <anw8fVxA-RNGqSl1@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <anw8fVxA-RNGqSl1@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] S390 Buildroot/gcc build issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Alexander,

Do you have some updates about the S390 gcc build issues? (See below).

Thanks a lot for your feedback,

Thomas

On Wed, Aug 12, 2026 at 11:29:02AM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, Aug 12, 2026 at 11:11:10AM +0200, Alexander Egorenkov wrote:
> 
> > the types _Decimal* require for the host compiler to be built with
> > --enable-decimal-float.
> 
> What do you call the "host compiler" in this context?
> 
> Are you talking about the native gcc compiler available on the host,
> or the cross-compiler built by Buildroot?
> 
> > 
> > package/gcc/gcc.mk:
> > -------------------
> > 
> > HOST_GCC_COMMON_CONF_OPTS = \
> > 	--target=$(GNU_TARGET_NAME) \
> > 	--with-sysroot=$(STAGING_DIR) \
> > 	--enable-__cxa_atexit \
> > 	--with-gnu-ld \
> > 	--disable-libssp \
> > 	--disable-multilib \
> > 	--disable-decimal-float                 <----- !!!
> 
> These are the common options...
> 
> > Can we turn --disable-decimal-float into --enable-decimal-float on
> > s390x arch ? It fixed the problem for me.
> > 
> > package/gcc/gcc.mk:
> > -------------------
> > 
> > ifeq ($(BR2_s390x),y)
> > HOST_GCC_COMMON_CONF_OPTS += \
> > 	--with-long-double-128 \
> > 	--enable-decimal-float                 <----- !!!
> 
> and for S390, it gets overridden.
> 
> See: it's the same variable that gets appended, so at the end we have:
> 
> HOST_GCC_COMMON_CONF_OPTS = \
> 	[...]
> 	--disable-decimal-float \
> 	[...]
> 	--enable-decimal-float
> 
> So on S390, the cross-compiler is built with --enable-decimal-float.
> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
