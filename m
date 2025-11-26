Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4138AD1037B
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 10:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1712B6132D;
	Wed, 26 Nov 2025 10:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MMhEDU9NKrHu; Wed, 26 Nov 2025 10:41:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DE35607A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DE35607A2;
	Wed, 26 Nov 2025 10:41:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DB822A9
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F1F9607A2
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zj4AXqVEjHgM for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 10:41:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0EEC9605A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0EEC9605A2
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0EEC9605A2
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:41:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2085131859; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 26 Nov 2025 10:41:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vOCxT-0000000BekF-2hee;
 Wed, 26 Nov 2025 11:41:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
In-Reply-To: <20251123172531.527134-5-neal.frager@amd.com> (Neal Frager's
 message of "Sun, 23 Nov 2025 17:25:31 +0000")
References: <20251123172531.527134-1-neal.frager@amd.com>
 <20251123172531.527134-5-neal.frager@amd.com>
Date: Wed, 26 Nov 2025 11:41:11 +0100
Message-ID: <87ecplgjp4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ZA4D14njOkHXOSujuLC1NEDJxeqmHFzP/KHd/1Rl6K6T7/zhOKndxxQkCi5eCoZTesGZqgv6rD9uNvedogz94XbNAK4qZPxMb6rC1asqGWDshUWMnkWWBAr53j6m61V3empdOXQaHStvJ6v78yHui2e3ESKsG8cm8+LOMBQ8VSeKrFzI351jeo63Y2jdBgBnTFq+VmkMO7JzToxZz+yIuy0FmN61Li6R4RS/lTexmnDgKb9ffsrAS/DXWYgP71TY14LiwzlWveZA7BiXorS0ctyH8hSSyYA+IWdi71ZFzgpO92Rt3rMrIcvL+qoE0tDjcXB66EaPM/RSwjciD4GOqQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=5xPUQ6dRll9EDy5Z6WbdfGDspjwf0ABUv0joc053XYQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ZA4D14nj
Subject: Re: [Buildroot] [PATCH v1 5/5] configs/zynqmp_kria*: bump to
 xilinx_v2025.2
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
Cc: yann.morin@orange.com, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, buildroot@buildroot.org, brandon.maier@collins.com,
 ju.o@free.fr, thomas.petazzoni@bootlin.com, romain.naour@smile.fr,
 michal.simek@amd.com, romain.naour@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > Bump zynqmp_kria defconfigs to xilinx_v2025.2.
 > xilinx_v2025.2 includes the following software versions:
 > arm-trusted-firmware v2.12
 > linux v6.12.40
 > pmufw xilinx_v2025.2
 > uboot v2025.01
 > with all Xilinx downstream commits included with xilinx_v2025.2.

 > xilinx_v2025.2 was run tested on a kv260 starter kit.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
