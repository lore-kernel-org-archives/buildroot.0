Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F589CCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 12:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02686612D8;
	Wed,  5 Nov 2025 12:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8yWVpLUVBhz1; Wed,  5 Nov 2025 12:25:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 282EC612DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 282EC612DA;
	Wed,  5 Nov 2025 12:25:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F8E3222
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 12:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25DE583E65
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 12:25:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id itVuIvDwhI50 for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 12:25:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=ycliang@andestech.com;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B457B8291C
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B457B8291C
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 12:25:46 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 5A5CPc1g001816
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Wed, 5 Nov 2025 20:25:38 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Nov
 2025 20:25:38 +0800
Date: Wed, 5 Nov 2025 20:25:35 +0800
To: Vincent Jardin <vjardin@free.fr>
CC: <buildroot@buildroot.org>, <tim609@andestech.com>
Message-ID: <aQtCP5SHLUoG9vwu@swlinux02>
References: <20251027033242.1797230-1-ycliang@andestech.com>
 <20251027033242.1797230-4-ycliang@andestech.com>
 <vqod7vwg76gzuo6bzp5jfb5mltauigzwv4aflzt35lakge6g6u@w6lomwzuua43>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <vqod7vwg76gzuo6bzp5jfb5mltauigzwv4aflzt35lakge6g6u@w6lomwzuua43>
User-Agent: Mutt/2.2.10 (e0e92c31) (2023-03-25)
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5A5CPc1g001816
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: Re: [Buildroot] [PATCH 3/4] configs/andes_ae350_45_defconfig: bump
 to opensbi v1.5
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
From: Leo Liang via buildroot <buildroot@buildroot.org>
Reply-To: Leo Liang <ycliang@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

On Wed, Oct 29, 2025 at 02:54:57PM +0100, Vincent Jardin wrote:
> [EXTERNAL MAIL]
> 
> Hi Leo,
> 
> On Mon, Oct 27, 2025 at 11:32:41AM +0100, Leo Yu-Chi Liang wrote:
> > This bumps opensbi to v1.5 and add proper hash file.
> >
> > -BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,riscv,opensbi,22f38ee6c658a660083aa45c4ec6c72f66a17260)/opensbi-22f38ee6c658a660083aa45c4ec6c72f66a17260.tar.gz"
> > -BR2_TARGET_OPENSBI_PLAT="andes/ae350"
> > +BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
> > +BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.5"
> 
> Why using opensbi 1.5 knowing that the latest tag is 1.7 ?
>   https://github.com/riscv-software-src/opensbi/tags
> that was released last June.
> 

Thanks for the review.

We are working on a patch to fix current v1.7 OpenSBI for our FPGA board.

For simplicity, we would like to use an older version OpenSBI and update 
the OpenSBI once the patch is merged.
That way we do not need an extra patch/ directory for our OpenSBI.

However, I've just found that v1.6 works.

Do you mind if we bump to v1.6 for this patchset?

Best regards,
Leo

> > +BR2_TARGET_OPENSBI_PLAT="generic"
> 
> Nice that generic can be used.
> 
> Best regards,
>   Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
