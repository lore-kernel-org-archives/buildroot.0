Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2ED5C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 21:29:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFA4C61167
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 21:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFA4C61167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67EC740646;
	Wed,  8 Sep 2021 21:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H8U4RPdenmoR; Wed,  8 Sep 2021 21:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C493E40302;
	Wed,  8 Sep 2021 21:29:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 806FF1BF427
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 21:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7021A80CC5
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 21:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGqwpmxQHCji for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 21:29:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D53580CBA
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 21:29:10 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id O57zmQzEVKBZzO57zmXF2x; Wed, 08 Sep 2021 23:29:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631136549; bh=YaBOanOzxKM+TNr+oUBj+dIAwZ5HYE++BSdgSnxONG4=;
 h=To:From:Subject:Date:MIME-Version:Content-Type;
 b=afo+SxbgJTvvrNJSBKqjmBncjZ3x9O7rsa0434qhVkaJClpoRAYNQXLXMFiPzjwx3
 1ggA08ilLb+Ki1v/Z1mb+neJo/hyaSaFkxiP550s550Wi+fDS+LugC88kql+e8vHTN
 9lblAE0x4lTkD9SuCEvLlUGAwsDpZmYQWFx6+ioVfrFcjbl8nzlE4AdfzOSGYkzYbi
 qcubPDHHae8CTaQGU9erdEJxbav3jMCqWMfV6xcCUldQiYjQ0MhjsaTTOd7seLbqnE
 F4cq5LPXWkFTklnQ3EvVeBPTYf3ct9bLWx+bMWyna8vBbgA019jkF59K53YdRc0t5s
 RUFEqvvKM1L7Q==
To: Buildroot Mailing List <buildroot@buildroot.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <e465a48d-f2eb-6822-415b-06468a375fce@benettiengineering.com>
Date: Wed, 8 Sep 2021 23:29:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
X-CMAE-Envelope: MS4wfMwc5gY7zz1ww6/5F+VQHixb18QecmN40Q5bgdF7SmdKtt+3DPOXYUABq1wTu5Sz3ZeQ1iLjiP1ndhBuizJpT7EMGoHcZ4JIp+2PGSkZejHZXw9qP9/l
 iWRq16PYCSzsZGlmZK8qCsVEvbY6f2XwFi6/wHIRGeDCV1nnxBmU72xYxGsu/NjNzOFqpOP8uktvzCkegmoyBuSdXfSO6bmNoTpnx5ipaXdNvxtn4o0qjPZH
 Vk9lb5J47mYZ5AAWIKZRQ1C4WR/DewDiC/vii8/dBQDTavZycobaIROo5KXSifTt
Subject: [Buildroot] Arc and C-Sky toolchains
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello Romain, Thomas, All,

I can't understand the reason why Arc and C-Sky provide a special 
toolchain(i.e. synopsis gcc10) instead of treating them like external 
toolchains. Can you help me in understanding this?

Thanks a lot
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
