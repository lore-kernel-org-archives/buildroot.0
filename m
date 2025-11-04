Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EE5CCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 06:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E52B840C03;
	Tue,  4 Nov 2025 06:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DO88HABa5P8f; Tue,  4 Nov 2025 06:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25B2740BFE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25B2740BFE;
	Tue,  4 Nov 2025 06:20:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 666AF222
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 06:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48B1B4086A
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 06:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sF5TPA5Qab1X for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 06:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=ycliang@andestech.com;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA82940416
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA82940416
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 06:20:35 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 5A46KRTe087393
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Tue, 4 Nov 2025 14:20:27 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Nov
 2025 14:20:27 +0800
Date: Tue, 4 Nov 2025 14:20:27 +0800
To: Julien Olivain <ju.o@free.fr>
CC: <buildroot@buildroot.org>, <tim609@andestech.com>
Message-ID: <aQmbKw0NnOO1py4u@swlinux02>
References: <20251027033242.1797230-1-ycliang@andestech.com>
 <20251027033242.1797230-3-ycliang@andestech.com>
 <832fec4cb78947eff7aeea7b9682ee0b@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <832fec4cb78947eff7aeea7b9682ee0b@free.fr>
User-Agent: Mutt/2.2.10 (e0e92c31) (2023-03-25)
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5A46KRTe087393
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: Re: [Buildroot] [PATCH 2/4] configs/andes_ae350_45_defconfig: Fix
 linux tarball source
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

Hi Julien,

On Wed, Oct 29, 2025 at 09:41:24PM +0100, Julien Olivain wrote:
> [EXTERNAL MAIL]
> 
> Hi Leo,
> 
> Thanks for the patch.
> 
> If you add the hash files here, the defconfig should also select:
> BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> Without it, the hash files will be ignored.
> 
> Could you send an updated version adding it?
> 
> Also, could you consider, in a separate patch, updating this defconfig
> to switch to external Bootlin stable toolchain, please?
> 
> See for example:
> https://gitlab.com/buildroot.org/buildroot/-/commit/dd3ef914867dca5e429bb25ee14445fb0c87baa5
> 

Thanks for the review!

I will send an updated patch adding "BR2_DOWNLOAD_FORCE_CHECK_HASHES=y"
and another patch to switch to external Bootlin stable toolchain.

Best regards,
Leo

> Best regards,
> 
> Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
