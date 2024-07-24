Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20FCC3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 09:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 755DA4041C;
	Wed, 24 Jul 2024 09:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmM_rUqZqQNL; Wed, 24 Jul 2024 09:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 403BC40BE8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 403BC40BE8;
	Wed, 24 Jul 2024 09:57:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 351BC1BF377
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 09:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F49B4063E
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 09:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAgiqsNG5jXI for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 09:57:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.132.182.106;
 helo=mx07-00178001.pphosted.com;
 envelope-from=prvs=79354ec97b=etienne.carriere@foss.st.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 903A940606
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 903A940606
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 903A940606
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 09:57:27 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46O6wCbp007163;
 Wed, 24 Jul 2024 11:57:25 +0200
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40gpt14qj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jul 2024 11:57:25 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2FD4340045;
 Wed, 24 Jul 2024 11:57:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 49F2A21A8F9;
 Wed, 24 Jul 2024 11:57:07 +0200 (CEST)
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 24 Jul
 2024 11:57:07 +0200
Received: from SHFDAG1NODE1.st.com ([fe80::b848:dbeb:cd0:84a0]) by
 SHFDAG1NODE1.st.com ([fe80::b848:dbeb:cd0:84a0%13]) with mapi id
 15.01.2507.037; Wed, 24 Jul 2024 11:57:07 +0200
From: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH v2 1/2] configs/qemu_arm_vexpress_tz: bump
 tf-a and u-boot versions
Thread-Index: AQHa3R2gIO367ZjyM0KGLB8lRww1ALIEof+AgAD1cr4=
Date: Wed, 24 Jul 2024 09:57:06 +0000
Message-ID: <cae4751a34a8439e9e7f38b75ee9cc13@foss.st.com>
References: <20240723163025.2733492-1-etienne.carriere@foss.st.com>,
 <20240723222829.1526e8c3@windsurf>
In-Reply-To: <20240723222829.1526e8c3@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.86.128]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-24_07,2024-07-23_02,2024-05-17_01
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 llpwXYGtAWUerQ26zdPKDtZU5gQ9argnPj5D+tJIUfk=; b=20F4r6KV3veNro0q
 JugyRW/AiFP3lHU/4/X3iiqv2PCuVvfdubofnUzIMcHNphXIFsebfIUlrRypGpjr
 lHvBWMwSTD+hOR0Cq0HRB+Go5jZAjqa9quyBrCGv2icX0xPGRf+CXapKtSBQNMzC
 F2izUqCNvZGN+hqC1fIWllIFml+ttMfVznFEEpNg6MHmcjKs7Drre9MRTVcEsb+G
 yaDXA41Ict1Lheb0rs3KpTqVbgw6xPqzAWbEFHIcEBJmbhsaf/OtoVMej2FAq78G
 DslCWKxUv+FyBRNNDCAsOiymWsecAH+fd8246qFFcCdTgJwkNI2sLf59wQepGhwq
 BqTtuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foss.st.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=20F4r6KV
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/qemu_arm_vexpress_tz: bump
 tf-a and u-boot versions
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Tuesday, July 23, 2024, Thomas Petazzoni wrote:
> On Tue, 23 Jul 2024 18:30:24 +0200
> Etienne Carriere <etienne.carriere@foss.st.com> wrote:
> 
> > Bump TF-A to version v2.10 and U-Boot to version v2024.07 for
> > Qemu arm-vexpress/trustzone board config.
> >
> > Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> > ---
> >  configs/qemu_arm_vexpress_tz_defconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Thanks for the patch. However, are you sure you tested it? Indeed this
> defconfig has BR2_DOWNLOAD_FORCE_CHECK_HASHES=y, which means all hashes
> are checked. So when you bump components, it cannot be done without
> updating hashes in board/qemu/patches/. Please note that those hash
> files are shared by all qemu defconfigs. Could you check this?

Sorry, indeed I realize i forgot to re-parse the defconfig after applying the change.
Bad test, my apologies.

It happens that building with these U-Boot / TF-A versions works ok.
No hash failure on U-Boot or TF-A source tree blobs but actually, the source tarball hashes for these versions are defined in relative  boot/xxx/xxx.hash.

That said, booting this platform with U-Boot 2024.07 fails. I did not expect that.
I think I'll upgrade at least to TF-A v2.10 (there's an LTS on that tag) and will postpone U-Boot version bump to later.

Regards,
Etienne

> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
