Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9CAC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:18:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D98361B40
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 08:18:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D98361B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF617848CF;
	Sun,  3 Oct 2021 08:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5mV8i2mioAd5; Sun,  3 Oct 2021 08:18:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4147A848CD;
	Sun,  3 Oct 2021 08:18:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 983231BF5A4
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 950EC848CD
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 08:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LS2eh5uZSeUK for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 08:18:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79930848CC
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 08:18:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:acc5:ef3b:8cb0:272a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 30B37B00533;
 Sun,  3 Oct 2021 10:18:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633249103;
 bh=42zyR+nkL2NHb+Pe95gSxFP+TsgURd+3v3YkgXldc0s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RFQZlXzpgwi3lpHH6N5JhZ3SKHcDFa+yUkumqp4d1WlILoHeKKgxe4WLbUu+tgu9S
 mtSW1rSEbdgzZTn063OMTDoPJXTkJuf/1c7khbRbJEjkhcV2djNk5Kmin6HxKWw83/
 kwTH6rmNy9OkRXpKoZyYYsGmdttuBf7cmS6N2fyR49CpZd0Rfit1eECbE1+k99IkkG
 N3cs8wVoJ3KGn1d1yeXktfMOYrWvJEuE9oGs11eoXrswM9lsWeeSuME8nBT2aaYTs8
 3Fd133GODlL5cdxHcfTYolyUZJ1KuJDkSgUWcEvsrzC03NOdxZYIfbStIUvB0wzUZp
 j5Tu29S95Zm7Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 10:18:12 +0200
Date: Sun, 3 Oct 2021 10:18:12 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211003081812.GE1504958@scaer>
References: <20210930054139.1929150-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210930054139.1929150-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-inflection: python3 is
 also needed for host
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
Cc: John Faith <jfaith@impinj.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All

On 2021-09-30 07:41 +0200, Fabrice Fontaine spake thusly:
> Commit ac120d277704fb212654356a6d2a2ff7be90737a forgot to set
> HOST_PYTHON_INFLECTION_NEEDS_HOST_PYTHON
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b0f7e56fd1dfe891396adc2b232a2663a9715196
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-inflection/python-inflection.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-inflection/python-inflection.mk b/package/python-inflection/python-inflection.mk
> index 7c030e99b9..59f35aa135 100644
> --- a/package/python-inflection/python-inflection.mk
> +++ b/package/python-inflection/python-inflection.mk
> @@ -10,6 +10,7 @@ PYTHON_INFLECTION_SITE = https://files.pythonhosted.org/packages/e1/7e/691d061b7
>  PYTHON_INFLECTION_SETUP_TYPE = setuptools
>  PYTHON_INFLECTION_LICENSE = MIT
>  PYTHON_INFLECTION_LICENSE_FILES = LICENSE
> +HOST_PYTHON_INFLECTION_NEEDS_HOST_PYTHON = python3
>  
>  $(eval $(python-package))
>  $(eval $(host-python-package))
> -- 
> 2.33.0
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
