Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81759CF6ABC
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 10:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3230E80C24;
	Thu,  8 Jan 2026 10:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JTgSS0aJvw2F; Thu,  8 Jan 2026 10:11:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A1F080BD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767867065;
	bh=vWG6CuewQlQPD3JpJaAmc4tkQ3xdSxYgbRSq7mkn60I=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Qn8IXLtdt6e3k3txMaYoaw6GxY8mV0WFRd4itt+6hHM6SyYxSp8PeUdl+/hV3IRRd
	 x48rnRmJGXNoPlN5t0QoEN0e8+krdqZSzxP5LdCm49wSyQ/p1eEbGGLOItL1EBSNLC
	 uZLxItJqKaDvngREe47KYmbWbGg+DlVncHd/iHjNvwLo3EKnr0OmYnK4I2zfpdeNco
	 544YsMW+4QoXujQXo2SoEe4KptqOfdbCjCepupLKNC2Dh+LsVgLACLXqFVsTtGad5t
	 MS841x4ptKBBFJpuyjDhvrRPDtE86oVo/lJxzPreRhtpzT8Q1hGk8DlkZNOZGLeS26
	 g0MoW5jDXUcKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A1F080BD0;
	Thu,  8 Jan 2026 10:11:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FF4A237
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 10:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92723606DE
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 10:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uja_LU3D5Loq for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 10:10:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=cnoize@andestech.com;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 558A960665
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 558A960665
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 10:10:49 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 608AAjda050865
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
 for <buildroot@buildroot.org>; Thu, 8 Jan 2026 18:10:45 +0800 (+08)
 (envelope-from cnoize@andestech.com)
Received: from swlinux01 (10.0.15.88) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 Jan
 2026 18:10:45 +0800
Date: Thu, 8 Jan 2026 18:10:44 +0800
To: Che-Wei Chuang via buildroot <buildroot@buildroot.org>
Message-ID: <aV-CpLh7NMHvtq_A@swlinux01>
Mail-Followup-To: Che-Wei Chuang via buildroot <buildroot@buildroot.org>
References: <20260107073401.3004368-1-cnoize@andestech.com>
 <20260107150232.7b672513@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107150232.7b672513@windsurf>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.0.15.88]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 608AAjda050865
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: Re: [Buildroot] [PATCH 0/2] board/andes: add AE350 OP-TEE support
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
From: Che-Wei Chuang via buildroot <buildroot@buildroot.org>
Reply-To: Che-Wei Chuang <cnoize@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Wed, Jan 07, 2026 at 03:02:32PM +0100, Thomas Petazzoni wrote:
> So if the OP-TEE enabled build is the "future" in terms of how AE350
> will be running a Linux kernel, then this should be supported directly
> into the existing AE350 configuration.

Thank you very much for the detailed feedback and kind words.

I will discuss this internally with Leo to integrate the OP-TEE and non-OP-TEE configurations into a single official AE350 defconfig.

We will provide an update as soon as we have a concrete plan.

Best regards, Che-Wei

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
