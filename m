Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00006606A328
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 06:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=E94rvpVs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256 header.s=orange002 header.b=qQsExqG1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA833606ED;
	Wed, 21 Oct 2026 06:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZmU8m2V47Jx; Wed, 21 Oct 2026 06:40:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B31FD60762
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792564801;
	b=HVwL8LNQB+FdvlU6OpkCLZiedQzbBt87aD83pc8C/RN7/KfQHWE3EYf9whgIFcVZtvyn
	 DgjmmD7SMveFPAeb/jV6CGJTOgEpdmzmGbh5k7LB0y+wFWis0TcXFPlz8WLZ/ZlHFbgfK
	 QxUXcHpoeuaOzFmv35tNiJ72nO+/IhE7fLx9Rpb6wS9O+QsBk+XDvoTdkJByRCdPltOO/
	 Pal1lEcZ6N5wiw0j3KUecG4ygFuVQ0gI2BwQfiu7i+PZLMb8BeYsghKIgIqAFPFvRgifa
	 SwgUIEpqdZgEIkZl5zxtG7DJrIGLJ9KH3SNw6Qsk1v/LGDbYJnZcXeoYwtAq6IBODDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792564801;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:From:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Originating-IP:X-ClientProxiedBy:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=54WDMRrXUvUwLLYGZaPiUJWuce4xahEb80DLzcwXdK8=;
	b=TQSgLli5dbyTOBEmAx6p1F2exQAyM82UECJEakhBWUB5J01KeQKbN6HQ4zmeq1rE0tDw
	 sT9RBnKa5uxmVN8BPZzrEs9CX6LRgWNzCf0762ymZ+ZAKTDQl9XrRLc7uXiRkIj3GkOrD
	 YGiyXyf7N/xFOPomNpyxIPsDgLGQuxLC2VmufSgzOK0Engqk3kivcHKf8IbDAKEWyg39j
	 nUspfn/65jUDIpPa3RzV629oR/cSII99H6+MfKFBisUcHKMLMwsHdifGagGs4fAD46FHf
	 x23Ag9HtJIYiHVoYTi/WsSEbXu6DMMXXirz7b1kKA83JzJI/Uf4w/rP/yZsIeUMW5pw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792564801;
	bh=54WDMRrXUvUwLLYGZaPiUJWuce4xahEb80DLzcwXdK8=;
	h=From:Date:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=E94rvpVsPiCukqkCTCqQ8RZBGeZKZT9WvKLcMTVUibh9D0Dz8RZKjXTi6M/YZ6BOe
	 2wf6LFnI3KEE+W+Erwo1vfoxJUcr7WHVh5dr9NZhTGmIcpL1JAIv6uvDCjSXMQKEZO
	 fGWAnW400aIASpcJ0sBbpGFwgNrNQqMaGSDAQ5KTjT8cLOvX89tppTx7IxKmYVO94f
	 +TZ68O95vy+to0ur62DiDwqGWmUE4uWJ9Tu07J8UKelsqnD34uerZ7Nk7Qu59UUYN8
	 MWNKqZdZhpUOpQ+0oLA7eAPILO2YZg+uWP5ilU9UIs+gOQN5mrJ/ibHTxtaL8aqg9Z
	 4outjm1SPzNVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B31FD60762;
	Wed, 21 Oct 2026 06:40:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA2803A4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 06:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BCC281080
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 06:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ydSyvRXZrDD4 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 06:39:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 190D280FB7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=80.12.126.237
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792564798;
 b=OKi+vW2EzSP4YuSp9Iuyqo8jcOIbLRGOrPkNJ5D9uJNp59+KZgtCSHMUEVTkRNGJf6DE
 MpAFcWaDSV6Ob4CM8PsM/KHyJGk6fcQfUJHDqn9uj8CnOn9vCSQgmEogrMfd8NbHNCh1x
 DlFZxNbeKXdk0p/SPalMUrVUKZivS1MueVEMsVBWlk+pOmnIVGXWkxIF7DEnw8OXfOxVX
 jZ59otj3bYbAC9zuMT0K/jwVmW5KTBTlitE3n4OgnaWc76p+jciqeQBmapY7lET+DwPPZ
 5uAitqturJyy8MBl6jjJMxv5uavsYWpUTUgWSfRq6tqrNMP1CigWUVA1/Z7VNRGioeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792564798;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:From:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:Date:To:CC:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Originating-IP:X-ClientProxiedBy:
 Content-Transfer-Encoding;
 bh=VjrXWvTuuKNXyMZAgVs6hRf9VfdUOeiy/9MDGrYZpws=;
 b=afnGweNFboqgjOed+mlT+iDE66fw0c11fm4J08gO+POk5Uluv0THw8NtKXPU+juhT66r
 oCVw4h/cNf6CRzWLKmYLED8HBWngcvqpw4gB4+s4mU8uXuQGD6f2V8COm4yRRObMCNvAI
 uTz9ieWamrg3RVGDJL3phfeJ7nRzF2x3mwkpnEMkCvcA1wXz78K9AJl2l1ZRV7YajbW+X
 CrOkDfQgvWeTKDg9mwLznTj7tG1bCJvT8Kn4kuJsdTpHFnnM0AzlpETp76a1sohUVkZgz
 S5lgf2oVuev0e5NvZHJhqaEvDlqZuC3FbDU6d8YvCJ17t0Hmlo+xpxqU69sATpatHzQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=orange.com;
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=qQsExqG1; 
 arc=none smtp.remote-ip=80.12.126.237
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=qQsExqG1
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 190D280FB7
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 06:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1792564798; x=1824100798;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=VjrXWvTuuKNXyMZAgVs6hRf9VfdUOeiy/9MDGrYZpws=;
 b=qQsExqG1AmmKqWai+CaMWPGlxG5EwO7qjN2yJxco3ImJfoUGp1EALbwK
 lX5GqSwMmtCs9zV//JOVcR8ua0iP0YUxTVDKeH4HZDfpXpA9oU0+MO1M2
 ldQN/18AF1owDpVmayWA3Ju6MCELFmBlnyhm/swDpJWItPMD8CCT02W1a
 LGN/2IgxO5KbcULnRKfVDXp20iq57xrfayWQ77SgWdQuxbiRrhhYx4+rZ
 RWIX7i006ElK94ISWbDc2mNfHmS8UXUAa2nRN8cXfbk5vDK3V0wpqjCPL
 dx4KyKq1P5rVU/UHOHqgY4LY52wCDvu3pF/+2EKog3nnJVXBTyW0yQRzK w==;
X-CSE-ConnectionGUID: IVAhmJD0Tl2Ncwq7Qtzx+A==
X-CSE-MsgGUID: PKKbyNHgRnOCh260RA/WSg==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 21 Oct 2026 08:39:55 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 08:39:54 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Wed, 21 Oct 2026 08:39:52 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 21 Oct 2026 08:39:51 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: p7hDCHhETUC8jScj36vreQ==
X-CSE-MsgGUID: lmRXMhMtTNupdNHt3xsc8g==
X-IronPort-AV: E=Sophos;i="6.27,169,1787004000"; d="scan'208";a="488058193"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Wed, 21 Oct 2026 08:39:51 +0200
To: Christian Stewart <christian@aperture.us>
Message-ID: <atheN4vBnVfvFWCD@yd-6wlzhs3>
References: <20261020195145.32754-1-christian@aperture.us>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020195145.32754-1-christian@aperture.us>
X-ClientProxiedBy: OPE16NORMBX607.corporate.adroot.infra.ftgroup
 (10.115.27.31) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: Re: [Buildroot] [PATCH v1 1/1] package/pkg-golang: use external
 linking on ARM Thumb
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Christian, All,

On 2026-10-20 12:51 -0700, Christian Stewart spake thusly:
> On ARMv5, runtime/cgo calls __sync_synchronize, which comes from
> libgcc.a. When cgo objects have unresolved symbols, the Go internal
> linker loads libgcc.a itself to resolve them. With
> BR2_ARM_INSTRUCTIONS_THUMB=y, gcc is built with --with-mode=thumb, so
> libgcc.a contains Thumb code, which the internal linker rejects:
> 
>   link: R_ARM_THM_CALL, are you using -marm?
> 
> Go already passes -marm when it compiles the cgo C sources, so adding
> -marm to CGO_CFLAGS does not help. The call from ARM code into Thumb
> code must switch the processor to the other instruction set, which the
> internal linker cannot do. Force external linking instead: GNU ld can,
> by rewriting the call to BLX or routing it through a small stub.
> 
> Fixes: https://autobuild.buildroot.org/results/7534211959577546c3777939d11e411d8a417baa
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Many thanks for looking into this! :-)

Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Tested-by: Yann E. MORIN <yann.morin@orange.com>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-golang.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
> index 3e388cb257..cf12dd56b0 100644
> --- a/package/pkg-golang.mk
> +++ b/package/pkg-golang.mk
> @@ -146,6 +146,17 @@ ifeq ($(BR2_aarch64),y)
>  $(2)_EXTLDFLAGS += -fuse-ld=bfd
>  endif
>  
> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS),yy)
> +# On ARMv5, runtime/cgo calls helpers such as __sync_synchronize that
> +# come from libgcc.a. With BR2_ARM_INSTRUCTIONS_THUMB, libgcc.a is built
> +# as Thumb code while Go emits ARM code. A call between the two must
> +# switch the processor to the other instruction set, which Go's
> +# internal linker cannot do: it aborts on the R_ARM_THM_CALL relocation.
> +# The external linker (GNU ld) can, by rewriting the call to BLX or
> +# routing it through a small stub, so use it.
> +$(2)_LDFLAGS += -linkmode=external
> +endif
> +
>  ifneq ($$($(2)_EXTLDFLAGS),)
>  $(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
>  endif
> -- 
> 2.55.0
> 

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
