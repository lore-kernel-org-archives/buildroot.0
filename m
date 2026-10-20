Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6485660A2617
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CD4nq3Ey
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3783F40820;
	Tue, 20 Oct 2026 09:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9qcTUe2HCaO; Tue, 20 Oct 2026 09:39:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 92DB3405C6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792489176;
	b=Xn0Xla2vogWau8SWP9evcpgs/pDyoGADQjmFiO5mIV5C+dR+AKaCOpKnYk+CZzLWLjZc
	 zgYUPUxqLkHv24uXpvujc1NBnqtJCHXi10XWtej4nHQrb0S4mV6LhE5YDba2Pc3Z3bMiU
	 KFXwRk4FR5WGLbQLfAUbAESPjXLBkMmzSW1ZolkAYZkDnJhpvuYtXFL7p+TGVj7vrssHH
	 VsOKMEjYGUA41y2JUG9QTCo/1gnb6qBi1dBWZsEdVv08QKNzciCgP/gXNO8hyPt20p5zG
	 Rnpz9ms2zkVOWbYOdN+BAQGH829x1CSdLd3tKHh8HTWPSg2nCrQDD9/vglln4GHQbcA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792489176;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QVFw/1irbcFGWOBcEZ0xrg4Dpa22jCYEJk+VQLuNLV4=;
	b=M4uy0oXUZPFqt8Jqik3CSykvohDSGgl4HvtPglxqADWn8Rrbct8NBdKK/wSQ/QPdmR27
	 h3U1HY4PcX6CmrLzp4IkeRbBjea2NVRfV77O8HqMbm+3o+7BO0wMTAZ5Th9shmxaUE2bC
	 X6Rus5vBuUD0Leq04aoT8Mokn9vjER9w6WLcRIOirONKK5k7KKCGhptwbKG4zJREA7IRQ
	 Y7mOq8Jy9CVjZkFK9htne/JjMhd9JLzOi2gTDMbKZ95KxM9QEioikMhZIFQm5P0NYBagv
	 ZEItDwbwhxL2MyujYnqV3kazc7i23Cko7bVSQIwfNLuRggLS/cc6Pe6PiEYVQQa1Qsw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792489176;
	bh=QVFw/1irbcFGWOBcEZ0xrg4Dpa22jCYEJk+VQLuNLV4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CD4nq3Eyf1S+t1mFAJ6y34Sh+qb2u+iCPZgKNgYSgJ4yg1Hl1Nj60r/gwHliw/JLA
	 LcMcTsAVXnlal98vvywnr98WUZEb9oErlKgRXMj90Ns669TUePhdGMD+X45jvHnGB0
	 w9GPsUfF/PnZUtZWuxlc6hJUFmg6bK5EoCYYpfH7QBCtUx6DaV5GAZfwPnA4s/0qIP
	 Xy+JgKMro2jXAefOPWfpTzSnQV/+UF5JH18YXZS/G5dUC9RObsRAELvxcnd9VEG5SB
	 SHHjEVfqqPFEaf/nErfA62zFlXa6mDs5Nkz5/TwJ17co1lILsFYgIV5drp+kzB865r
	 Sn+dQJnyWf8WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92DB3405C6;
	Tue, 20 Oct 2026 09:39:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 35DC61DE
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C14580D21
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P74otE8VGdB5 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 09:39:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8C53580CF0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792489173;
 b=oWjYI5CgaFJTOzIOHhtd4+6skNv+2mjXvEn+MKigB1g38EdNq6+YZ2a/yfHTgl4WFEUZ
 53a0kLBwppCpp4pfQVnaMeuYvrDdI+yO586mqbbFdMlanaUJxQUP73HgU6popgciOoq8v
 8TEp9xuv3mBfQ7fOmuLKqNijuon4fsF0nekFeWRszCBKicHR5Jjs9UopU4TCoobRmTkH0
 sjMD+KimPy+nYjTROrJB8rYFqLw4ySHlHKkraJOvIRSaG7lVmxqiGRowrpqZZY7tOGae7
 fUIlHrdkuUZ4oSZXnW94oKc4a8ev8pT9stAgfXgcb7cpe8xMhjXsGRgaJEAzvi9lnZA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792489173;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=KdZNO79+rIPcdT+eJescaXcExVnnVYn+EgCqEHdR1UM=;
 b=l7j2tUMJrErnTR1W4FQE1y6+t7DqU/c2y8QCK0HYlO46t+KsvcuUJ+CPUpKWVX5u8mbe
 kv49q343bzSaKQHQFgT8bEVn1xoiv/Unfz+5vSPob2vcyT/d/bo6mcA1LtRG5rwZlNbpu
 wnGpkO756N57RMQNlZYn208vYB7b3scB6riqlG1zZrOAUm6RAA3HQGPIdp4CTYvWE8/lf
 i0TMvDEUzD9elT971PgfOrcPi+BWi8kFW5oRPVkthhMOuqH/TnxayIzcbCpcmHu/O6lBi
 lIUNh4S7hTwTAlmOe/U0Ja71izOBMX4cDFa+0khCq5YhtHDjd7jFE4K5zrXU1zczFCA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=odjDatA5; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C53580CF0
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:39:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 354381A129E
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 09:39:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EDE4B60393;
 Tue, 20 Oct 2026 09:39:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E125510328DBA; 
 Tue, 20 Oct 2026 11:39:26 +0200 (CEST)
Date: Tue, 20 Oct 2026 11:39:25 +0200
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Fiona Klute <fiona.klute@gmx.de>, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Message-ID: <atc2qld8Xtc90rIY@windsurf>
References: <20261020-qcom-modem-userspace-v1-0-da720723d9ef@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020-qcom-modem-userspace-v1-0-da720723d9ef@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 0/3] package: add qrtr,
 rmtfs and tqftpserv for Qualcomm modems
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 10:07:44AM +0200, Igor Opaniuk via buildroot wrote:

> Igor Opaniuk (3):
>       package/qrtr: new package
>       package/rmtfs: new package
>       package/tqftpserv: new package

Thanks, looked super clean, so all applied. I just did one small
change on PATCH 1/3, so I'll reply to this one specifically.

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
