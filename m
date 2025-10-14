Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37346CCD190
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 18:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDEA583DEB;
	Tue, 14 Oct 2025 18:43:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FL1oVlAGdR8n; Tue, 14 Oct 2025 18:43:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D72883DE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D72883DE8;
	Tue, 14 Oct 2025 18:43:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7765BC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D47EA612F5
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:43:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qux3kd0rflaM for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 18:43:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BD775612F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD775612F2
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD775612F2
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 18:43:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CD29D19F57E;
 Tue, 14 Oct 2025 20:43:32 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Oct 2025 20:43:32 +0200
MIME-Version: 1.0
Date: Tue, 14 Oct 2025 20:43:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>, Andrey
 Smirnov <andrew.smirnov@gmail.com>, Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>, Bartosz Bilas
 <b.bilas@grinn-global.com>
In-Reply-To: <20251012182016.2711834-4-bernd@kuhls.net>
References: <20251012182016.2711834-1-bernd@kuhls.net>
 <20251012182016.2711834-4-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <66971a2caa105ed823f71942ca38e142@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760467420;
 bh=vOVFVsD9V4tNcASak4ig03Nq30LTvXFbcq/eVybctIU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CkAlOLXXnNbCFaF5XxKeohk2LDg3SKm3EEzZknCsog7GQBW8oXjRDL5TowLNihav1
 L1bhHbRhaojFWMgPFKy03SLrn+nYcE4nVCifUO1ayudJYOxMtbf4Z0qWeMKw6DeI/D
 zfO3covBUHuldiPPsdPSzcn0FKMcWZ9/SDfuUqsYmCGMFKwRV/reW1eEF+mvysbzOJ
 qQc3kGU2JGPohspJ5TXtyFUJGMgOnaw8szsD6x0ghQxoNW1FIe+8BeY4VLbsLrMJtr
 0BczKB/FJ5kTN5Pcxiz5Zc/ZEd59MIntVKmGDxZMTKJ934ACSQ1RheLp9itmTo9nY/
 /tPYReQ6J+RFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CkAlOLXX
Subject: Re: [Buildroot] [PATCH 04/21] package/python-automat: bump version
 to 25.4.16
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

Hi Bernd,

Thanks for the patch.

On 12/10/2025 20:19, Bernd Kuhls wrote:
> Release notes: https://github.com/glyph/automat/releases/tag/25.4.16
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/python-automat/python-automat.hash | 4 ++--
>  package/python-automat/python-automat.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-automat/python-automat.hash 
> b/package/python-automat/python-automat.hash
> index 4edc9f3f09..562c15dc63 100644
> --- a/package/python-automat/python-automat.hash
> +++ b/package/python-automat/python-automat.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/automat/json
> -md5  c023f8848366053a76f99cffba3ea34e  automat-24.8.1.tar.gz
> -sha256  
> b34227cf63f6325b8ad2399ede780675083e439b20c323d376373d8ee6306d88  
> automat-24.8.1.tar.gz
> +md5  a725256be8545c32048eb12239caeebb  automat-25.4.16.tar.gz
> +sha256  
> 0017591a5477066e90d26b0e696ddc143baafd87b588cfac8100bc6be9634de0  
> automat-25.4.16.tar.gz
>  # Locally computed sha256 checksums
>  sha256  
> b2201301678d0a937d938543827ca1360712eb34e23de8ee3f3bfffbd4c0e376  
> LICENSE
> diff --git a/package/python-automat/python-automat.mk 
> b/package/python-automat/python-automat.mk
> index 85bc890fc5..be45149f8b 100644
> --- a/package/python-automat/python-automat.mk
> +++ b/package/python-automat/python-automat.mk
> @@ -4,9 +4,9 @@
>  #
>  
> ################################################################################
> 
> -PYTHON_AUTOMAT_VERSION = 24.8.1
> +PYTHON_AUTOMAT_VERSION = 25.4.16

This new version fail to pass its runtime test. See:
https://gitlab.com/jolivain/buildroot/-/jobs/11715397548

It's possibly introduced by:
https://github.com/glyph/automat/commit/643f7ce4ff0dfbe0269d57e0611b24fd5a149d93

Could you have a look please?

>  PYTHON_AUTOMAT_SOURCE = automat-$(PYTHON_AUTOMAT_VERSION).tar.gz
> -PYTHON_AUTOMAT_SITE = 
> https://files.pythonhosted.org/packages/8d/2d/ede4ad7fc34ab4482389fa3369d304f2fa22e50770af706678f6a332fa82
> +PYTHON_AUTOMAT_SITE = 
> https://files.pythonhosted.org/packages/e3/0f/d40bbe294bbf004d436a8bcbcfaadca8b5140d39ad0ad3d73d1a8ba15f14
>  PYTHON_AUTOMAT_SETUP_TYPE = setuptools
>  PYTHON_AUTOMAT_LICENSE = MIT
>  PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
