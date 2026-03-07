Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B1FF55100
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 15:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8560660FDC;
	Sat,  7 Mar 2026 15:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cgKk46mYepPa; Sat,  7 Mar 2026 15:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2E1060F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772899082;
	bh=JxtmX9wqU0E2OMXkvp327vkvI5s3ZclxGHGgSOLPVdw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ch1b/kQ0+6YZjOEY9uFcWmpsG5PKiFNj8iFMDuTrWTacAHi4mEpjhKvnf5Ajfe+AK
	 qaBHELkJGRR7TEPFIqUDrKaVjUabWfhts0pcHklGTiQ2CW3AJN2hiGf4b2agtuLBKg
	 b21cV3cjLX/ToMFdGZ4xNwPm4Q3ObcZ/GxMDVCloL5+2TmRAePMf1EyZZozaqXRQQQ
	 2gKW0p61OjH5xnDYsEOKjJHzvHJ8C9M8lv5yvXRROE879vbDPhDIA0wD6AenOIkRQ/
	 /zKo583zYCdDZeK/sE2hMpT62reoaVxN0IrcJR2MxqFiXGR35MdOSe4aVpmnDMG/Ad
	 /6jih0awK5TMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2E1060F29;
	Sat,  7 Mar 2026 15:58:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D83F9169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 15:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9DF081586
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 15:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0dhphP5kvfe for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 15:58:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 980BE81570
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 980BE81570
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 980BE81570
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 15:57:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0740113F88D;
 Sat,  7 Mar 2026 16:57:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 16:57:51 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 16:57:51 +0100
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org, james.hilliard1@gmail.com,
 thomas.petazzoni@bootlin.com, maxime.ripard@free-electrons.com,
 Pablogsal@gmail.com
In-Reply-To: <20260304074234.15910-1-chakrabortyshubham66@gmail.com>
References: <20260304074234.15910-1-chakrabortyshubham66@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <7ff7e330cfaf6d75fe4eaafc8073d1e9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772899077;
 bh=VP9ZOsXi521fseOeDRPaUQ2nwqSUkPsSOJeTpRPDk/I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VsewzWPUdcvgDJlycrEI85ffukZjVMZDjP96SIz/IoO41kEeedVJG1MwoUoz8MCYU
 sRWZT/fUOFJ2joE9Hde4yP6xkajkNP9cXieJYl9wuXv96Okxy/XEy5/Ahz2unvBmCj
 cmy+NtTGxUNcForB0aUBmuvCdTkf07n4819mWqKfgV8GYl+5UrBh8nH41ZAp0zxvJr
 aZtLZaygGvHry/2aJDT2eqoAaBapnoNahjypOhuoU1wukYPRSk9MFfi4PWzyRTU/LD
 FxP7OxKqUjEPDJ9clGXOsWHu/JiWqSoCU2DpBgnhejfg1k1qejgP5xgQdxXoVgNvkc
 eka5qAL/Al3LA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VsewzWPU
Subject: Re: [Buildroot] [PATCH] package/python3: remove nis and ossaudiodev
 modules
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

On 04/03/2026 08:42, Shubham Chakraborty wrote:
> These modules were dropped in Python 3.13 as per PEP 594.
> The current version in Buildroot is 3.14.3.
> 
> - Remove the TODO and related config overrides in python3.mk.
> - Remove BR2_PACKAGE_PYTHON3_OSSAUDIODEV from Config.in.
> - Add BR2_PACKAGE_PYTHON3_OSSAUDIODEV to Config.in.legacy.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
