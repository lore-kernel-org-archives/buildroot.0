Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3269C4451B
	for <buildroot@archiver.kernel.org>; Sat, 18 Jul 2026 10:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3970680C53;
	Sat, 18 Jul 2026 10:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ra4OH5PDwLSl; Sat, 18 Jul 2026 10:55:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3B7180C68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784372104;
	bh=Uonny5OgtzIyBZ6p/0PIndm0/NhPwUbr9/3lohdHTu4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZyGpiOyv3LZwe4GGlxDDWvpFJLopEPKlPQJhwDGnYF9O/9S4mqpmwYowVkfyxpjsd
	 oi1CwU9PoQiXZhLo8gcQN21T2L7Y3nLgs/pX1B1ik79qdHeun/uyvZXy4NeaR/72F9
	 8IIyFIiDtud9Z0QCcvInJDR/vBC/+soJzzU2WnFmLBIYQwWL3DbxLgOjx5De6/v2KH
	 ENLK0AO3JXV2QT1G0/KVnMGu6qUs/mMzpHNmoi2oHod2Ao8tIyZtU5+1eqFQ2sVziA
	 S1u15E38QWfneXKu20+4jqDqDxnCu4zCpiHm/d3VFPINU5myZxpnliWWM52GqyrKMG
	 IwpMoTaOapcgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3B7180C68;
	Sat, 18 Jul 2026 10:55:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B66E136E
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 10:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DF974066C
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 10:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jScN5xOGRIZF for <buildroot@buildroot.org>;
 Sat, 18 Jul 2026 10:55:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2984340735
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2984340735
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2984340735
 for <buildroot@buildroot.org>; Sat, 18 Jul 2026 10:55:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 877D2B00592;
 Sat, 18 Jul 2026 12:54:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 18 Jul 2026 12:54:55 +0200
MIME-Version: 1.0
Date: Sat, 18 Jul 2026 12:54:55 +0200
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260717061943.4491-1-flaviu.nistor@gmail.com>
References: <20260717061943.4491-1-flaviu.nistor@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <a97b4a7a76d63c6f7b0ebe23c3b43ca1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784372097;
 bh=HeUWCaFdYDOYUtrqgEd0oT7tgAX7R2dki3PS2PDzl9I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=odc34zLMPEsbJZ6U37TChAeQtgpRnSgae4du/RbX+v7so7Y0j3qHRpWY4Ju7nI9Lu
 VQyQRxCjvIlH1vHjsem2+PLdm/PG5yBEoGd+ijUPPBL8P49y6dwNP9n7KpC2LhBU7p
 YsuIwLxmaFUDht7mgqDbD3bg+WZVt4aQ7EpB2rRvjM5rEp6b/RfQX3FmTFlRwU40u/
 ozS6Q/9tyMdfWEmoZ0nrixngYFn86gQynMPZWGVrPa6QB3QZWIph9Thw1zlzwmHKdL
 DONV7mCMnkNkcKYFjYHOrH25QWGtFiZFiBoGY4jF/j5sygTQjMM/hAzw9E1q4BDu3C
 oTaVM8irg/zcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=odc34zLM
Subject: Re: [Buildroot] [PATCH v2] package/python-snappy: bump version to
 0.7.2
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

Thanks for the update.

On 17/07/2026 08:19, Flaviu Nistor wrote:
> Even if there is a 0.7.3 on Pypi, there is no 0.7.3 release
> on the project homepage, hence the bump to 0.7.2.
> Add also PYTHON_SNAPPY_SOURCE for correct package on Pypi.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
> Changes in v2:
> - Fix error indicated by Julien Olivain when running make 
> python-snappy-legal-info.
> - Link to v1: 
> https://lore.kernel.org/all/20260409152520.5894-1-flaviu.nistor@gmail.com/
> 
>  package/python-snappy/python-snappy.hash | 4 ++--
>  package/python-snappy/python-snappy.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
[...]
> diff --git a/package/python-snappy/python-snappy.mk 
> b/package/python-snappy/python-snappy.mk
> index e80aa861df..b1bd8ca6ca 100644
> --- a/package/python-snappy/python-snappy.mk
> +++ b/package/python-snappy/python-snappy.mk
> @@ -4,8 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_SNAPPY_VERSION = 0.6.1
> -PYTHON_SNAPPY_SITE = 
> https://files.pythonhosted.org/packages/98/7a/44a24bad98335b2c72e4cadcdecf79f50197d1bab9f22f863a274f104b96
> +PYTHON_SNAPPY_VERSION = 0.7.2

When building with the commands:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_SNAPPY=y
EOF
make olddefconfig
make python-snappy

The build fails with the error:

ERROR Missing dependencies:
         cramjam>=2.6.0

It seems python-snappy was updated to switch from the snappy library
to cramjam, since v0.7.0:
https://github.com/intake/python-snappy/commit/277fb4a4b7e16b771f1ed1addde33feebd96c979

Cramjam is currently not included in Buildroot. So, I believe you will
need to add it, and update this python-snappy bump to reflect that
library change.

I also suggest you write a Buildroot runtime test to make sure
everything works. For the test, you can use the simple sequence
such as:
https://github.com/intake/python-snappy/blob/0.7.2/README.rst?plain=1#L50-L51

Could you send an updated patch series addressing those issues,
please?

> +PYTHON_SNAPPY_SOURCE = python_snappy-$(PYTHON_SNAPPY_VERSION).tar.gz
> +PYTHON_SNAPPY_SITE = 
> https://files.pythonhosted.org/packages/cb/52/acd87583175fa930e4385f8a6164eb5909acd683c0e62ee01d41de8195a2
>  PYTHON_SNAPPY_SETUP_TYPE = setuptools
>  PYTHON_SNAPPY_LICENSE = BSD-3-Clause
>  PYTHON_SNAPPY_LICENSE_FILES = LICENSE
> --
> 2.34.1

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
