Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F055510F3DD9
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 11:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BD6F83FF6;
	Sat, 28 Mar 2026 11:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJswzkt8x7nA; Sat, 28 Mar 2026 11:57:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75EFD83FEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774699064;
	bh=NXLOWEprTSu8X3YVlSl+xrsAl84JtPOi3+R1cA+0224=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DW4PWnMdzWatjtKpIIY33c0xMAN3K1NdzZc6WFBt+erfe77KZSJVfRi+goUrVRaIC
	 SkVfAF+ZR+36og51TaBUVUcpDst50+h1unk68LcF8bpCZFo5/2wCL3HClsl0jO/K+l
	 s/qIQVo2RY4VkyiDRoeEw6dAMb5v2hPW1Jwc62E4ij+xiGvZRQNTani+4l/OUZecIR
	 QdpHGkgAV8cw6/+Gn+HpZaq3+D08Ctxx7VyyAhezhcpZAQoM5/WQZ83EZV4y7K9mBN
	 FbhiZoxQ/bbf+6KWY176YCutqzlp1t9C+S/f1QuMNTFQ/GWie/ZfKheeHQV6iEc4TC
	 K4QIoc+reToOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75EFD83FEF;
	Sat, 28 Mar 2026 11:57:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55D7D2AA
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 11:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B7D7610FE
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 11:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12RlPXwfRSHe for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 11:57:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 49466610F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49466610F5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49466610F5
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 11:57:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 762772003B4;
 Sat, 28 Mar 2026 12:57:37 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Mar 2026 12:57:37 +0100
MIME-Version: 1.0
Date: Sat, 28 Mar 2026 12:57:37 +0100
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260324172659.4834-1-flaviu.nistor@gmail.com>
References: <20260324172659.4834-1-flaviu.nistor@gmail.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <01b7e4fe8d7439f53154b75cf5b3ed41@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774699059;
 bh=kROOqzkIT/l57qMTC0cjRnfBCM/cMBO1qVmNPF93OyY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QrRSXDl7XQqB+ltieKUtCO2dM6cbUTR6Al7VnDE1Ib6MOrZogQr78+8t7/zLu4VgO
 orv54HRa6t0meV8MSGby2+v2M5iaXEw+xZcYk3mbX9IPMWs/JW8jBTTtNq4I61/C0p
 mMp4lNdheP8f3mBc1Q1YAOucPeSEj8erBU2V7jFBqBScrctFATFXwdU27wsWxeFVzn
 2LCbYiQxd5XzwRZW+koQ6wEXhMkFOZNco/6AKvXpln5XnLKTNGFTGgtK+eNFKjCCxt
 A72TW36c01KKhfVNdXlpANTQWWxGhQxdzz6Zn0XE9nr74Oj41L6qnRAgxS9f1E7Wr2
 beTQP0aDxdf0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QrRSXDl7
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aenum: bump version to
 3.1.17
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

Hi Flaviu,

Thanks for the patch.

On 24/03/2026 18:26, Flaviu Nistor wrote:
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
[...]
> diff --git a/package/python-aenum/python-aenum.mk 
> b/package/python-aenum/python-aenum.mk
> index 4b59216722..49cba84990 100644
> --- a/package/python-aenum/python-aenum.mk
> +++ b/package/python-aenum/python-aenum.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_AENUM_VERSION = 3.1.16
> +PYTHON_AENUM_VERSION = 3.1.17

It seems there is some confusion upstream about that 3.1.17 version.
PyPi publishes it, while there is no tag on the corresponding github
repo. See:
https://github.com/ethanfurman/aenum/issues/53

I'll wait for clarification from upstream before merging this patch.

>  PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
> -PYTHON_AENUM_SITE = 
> https://files.pythonhosted.org/packages/09/7a/61ed58e8be9e30c3fe518899cc78c284896d246d51381bab59b5db11e1f3
> +PYTHON_AENUM_SITE = 
> https://files.pythonhosted.org/packages/07/e9/8b283567c1fef7c24d1f390b37daede8b61593d8cdaffb8e95d571699e83
>  PYTHON_AENUM_SETUP_TYPE = setuptools
>  PYTHON_AENUM_LICENSE = BSD-3-Clause
>  PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
> --
> 2.34.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
