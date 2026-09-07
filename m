Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B4CC79F9E
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 06:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48BD680AC2;
	Mon,  7 Sep 2026 06:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFiGW1g85vrr; Mon,  7 Sep 2026 06:08:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5FB5F80AAE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788761317;
	b=GgRD9xShxHJiLk97cYHKg3zCAj5sTiSHsF1ojHEtxN9gS8VM8XegLX5SG5OzVmzk78qC
	 AlzfQxY6b/fNBCansAPF+reS6TAD1HHOPT+IIdgq8qzlpJULwSlKGdynO7D5Fw50P+ybh
	 bvU9+/64B5VsuaIyMa9W/kUWTF9h8TCMmLqFwxbeKtaCgaCKPYIYb2M6TpDh3Q584jNaL
	 n3cSPUp5mCGCyO6Xo7r5+ih5DJ4XYUD8W6ex0ij1Su5lFtLJ34vI6lm0c11y+Yn1qkexU
	 bp85vuwcvBBaU23tPKg4AtsyIahyaatxO2BY9r/NrQK/aFyEMn4tGmZOAWAM+KbrMSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788761317;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=nMe00nsu/KlZYbYA2ZKXutiHLIRL/ciGxds/jtdvmYU=;
	b=U0l3w2PPGi30+25Jm8v5a7vd7x1A/9vjbFscbXoBpY+PDcGqIy2TgjI0d9BQTiXEME3k
	 v/nH/xnDmvfOSCMwZF9pT+9C3DI9MLJESnx97vfM6dztTkoFe4E+tEAgEhhsixTRk+Mdh
	 ogl46p+5h9xr2P4q1KrpQydRD4CEDdDFXAxKdlCLMd8Y+xRCNiUyRr5elF7R5sW9h3ZRh
	 EQPkcr4TjItT4KGNAtXGgE9jXzbXeUx/Q0+fYlYICFYTQK1VWAgYwjTo7uCd+9LLKvtat
	 bzr3A62Mi4xAnBS54NrKk/y5PznJusIKsIyxVHy+SBQcMTGeUY8aQ3N/WL8wI9jTJsQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788761317;
	bh=nMe00nsu/KlZYbYA2ZKXutiHLIRL/ciGxds/jtdvmYU=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=QDfpSOs3PJ8EGLuHaescq8Z0YtCZz7bd5CU4TNRZedF+CPxYICTN1wJ7g7yZ8ZKBT
	 K+F34FZq3YdGkzSepRgXLieEPQFRleW+O8XiwFzqk6kd8VPuv3r/zj5YHJTdkuW/uc
	 ntDuFpxePiAq073yowr4h1WA4hhUmgsgQ2zSij6JAWwKDnu9r91qPMBhXHERUOW9AM
	 bdGQxLvPteNtNkGCK379GuwiIu6i6tsm8mD6+xXNGr1QnKP6xYcOyMRXotYr9oBzLu
	 zfJ1yW+ST6dDkMLu6P6Gv1z0rv4lWdDaLVCkqmrdfR30O1YsJlszIoSlw4oiX+kRk3
	 tpeIsMDu+w8og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FB5F80AAE;
	Mon,  7 Sep 2026 06:08:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BB1C29B
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71F15605E4
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F80gWFw6CoaI for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 06:08:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 70F1F605D4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788761313;
 b=rc7U0apT557Hb3rSH2x6KisrVwQkwRFCQo2OBWeZqHGpeXvOI8bQIS35AQiATcb3aFhz
 as4SFJwwpa8UcENKVZ3FEV6LRUxNfANN1zsJ90ZDZibAO063HkiW2SUw7l1BybT7USHup
 NhUnuxc0GGZ8pTMgufjOMB44toe21O2zCX3qsxlOhejAayqHJDMKPkYifX46/ELd1/dQK
 vPNvo0avj9DnHYH2ftUwYeDdpPasfFDWYCrtkp7Mpqh4SudTEEvIl71t4RaeM6mFjorlF
 Jm6OlYCLJiLC8A0HpkQzoyTpYoZJ8r3uhvbVOBZLDzcKOrzN6jmzT5kxVYRUsyeZa9g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788761313;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=8H23x7bbe1JcKSU7RCGjAp6mPDFPYb/Lho6OuH02BB4=;
 b=boCUW7llfkDfgY9hHjBQxVQsVloKUe2lgWhpT2k1Ol7I3sziQLkjUNfDZOM+UlG9Hk+0
 0a1qETE9ARg5bZxqfXRwbveD58P3KWziT89LQKK1gXXNorSlo3JSWagaVbHmcbFPlvCka
 EAnfwIWa7ii/NamwnXf6UpCrUqe/ph9LzHclPaLNsk4XppyTY2e0W1J8iBN2HFmfyvikw
 r4PZB2bzdf0KmviG02lHyugkYpqmzBvWuIqCOu7s9LH6fPw3KyNhVi2oLDI0xKX/rbnR6
 KDHepFVhktDytoAkGuHVJbT/jsde58c8R+1vwfXdj4n5kWRL+Owt3t4fVj1MQNk/WlA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Oy5KemL3; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70F1F605D4
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 06:08:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8F8E41A1A1D;
 Mon,  7 Sep 2026 06:08:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 624F360383;
 Mon,  7 Sep 2026 06:08:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4328211C7A06D; 
 Mon,  7 Sep 2026 08:08:25 +0200 (CEST)
Date: Mon, 7 Sep 2026 08:08:24 +0200
To: Joseph Kogut <joseph@anodize.com>
Message-ID: <ap5UEVoz1-Vb0P0h@windsurf>
References: <20260818-passt-20260728-v1-0-aa8bc1ce2c5a@anodize.com>
 <20260818-passt-20260728-v1-1-aa8bc1ce2c5a@anodize.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260818-passt-20260728-v1-1-aa8bc1ce2c5a@anodize.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/passt: disable on uclibc
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
Cc: joseph.kogut@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, Aug 18, 2026 at 01:55:33PM -0700, Joseph Kogut wrote:
> Upstream lists uClibc-ng support as a "nice-to-have, eventually", and
> tracks the required build fixes as an enhancement:
> 
> https://bugs.passt.top/show_bug.cgi?id=5
> 
> passt relies on interfaces and definitions missing from uClibc,
> resulting in build failures such as:
> 
> qrap.c:145:25: error: 'ARG_MAX' undeclared
> tcp.c:2926:34: error: storage size of 'wnd' isn't known
> tcp.c:3321:47: error: 'TCP_SEND_QUEUE' undeclared
> 
> Disable passt for uClibc toolchains and propagate the dependency to
> Podman's passt backend.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7e4/7e4434e01baece4d090e44b4b3713f2eeefc1e27/
>  - http://autobuild.buildroot.org/results/3f6/3f60889b4599f1bc42a69076f6fe469517ea9ab5/
> 
> Signed-off-by: Joseph Kogut <joseph@anodize.com>

Thanks, I have applied.

However:

- ARG_MAX is not a standard definition, the code should be using
  getconf() to get this kind of value

- The code uses ARG_MAX incorrectly. ARG_MAX is the maximum number of
  bytes occupied by arguments, but the code uses it as the max number
  of arguments.

For the other two problems, I guess a bug should be reported to
uClibc. I've Cc'ed Waldemar, uClibc-ng's maintainer.

> diff --git a/package/passt/Config.in b/package/passt/Config.in
> index fca1dff7c5..d06cc3e482 100644
> --- a/package/passt/Config.in
> +++ b/package/passt/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PASST
>  	bool "passt"
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC

I added a comment above this to explain why.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
