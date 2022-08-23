Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E54C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 13:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB27981249;
	Tue, 23 Aug 2022 13:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB27981249
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HiatQQB5Uukr; Tue, 23 Aug 2022 13:13:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E1AC81247;
	Tue, 23 Aug 2022 13:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E1AC81247
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D60C1BF383
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 13:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC457405B6
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 13:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC457405B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QvwpISLCqeVQ for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 13:13:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1BE940535
Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1BE940535
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 13:13:33 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtpfb1-g21.free.fr (Postfix) with ESMTP id 3D85FDF9A16
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 15:13:31 +0200 (CEST)
Received: from [IPV6:2a01:cb08:8f65:d300:4b96:ac4c:4229:8341] (unknown
 [IPv6:2a01:cb08:8f65:d300:4b96:ac4c:4229:8341])
 (Authenticated sender: thierry.guibert@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 5507A2003A4
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 15:13:25 +0200 (CEST)
Message-ID: <38884503-637d-7c23-5a02-be8f8c3a522a@free.fr>
Date: Tue, 23 Aug 2022 15:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To: buildroot@buildroot.org
From: Thierry GUIBERT <thierry.guibert@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661260405;
 bh=j8bZTvls820k3fc/V6kQsdqupqkNe/uvFLSh2uiujik=;
 h=Date:To:From:Subject:From;
 b=K3CkhKiCyhYfiK2AtHem940Eysv1CIq1rqkAKSJUcpsPNsPGvLIc5a0jjlunTc/sP
 mIg+D+Y8RRE+yaNbBlfCIMghAtjfr4BsNhNO0U3SdzeYRak/bZkMPsMpPh73OFn2sn
 w67x/Gi2k3Wq1hmG1B7NCs/WVs1+1m8ZHllqfbpY7GQrb5CIMheNaBF1tjElLk1B+L
 96nnjiPtd1y4r/pURDrP03Mv8UijqA86OJszP/n32z/ShPCEZWtbMRgbgct2T6zoYY
 PhMLzc9yCODrHdV7h03xdjKvdP9TxygHtEotRYKlEYelhIaZ9EXkRT82qefpYQMTOg
 L/lAQ81J2nisw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K3CkhKiC
Subject: [Buildroot] Docker container for 2022.02.x release
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi folks,

I'm using buildroot to build raspberry pi rootfs for the french red cross.

Is there any reason for buildroot/base:20220206.1756 not to be published 
in the docker hub ?

On the hub, the latest container published is 20211120.1925 which does 
not seems to contain python-pytest, so my gitlab pipelines are out of order.

Have you moved to an other docker registry ?

My favorite search engine did not help me this time...

Regards,


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
