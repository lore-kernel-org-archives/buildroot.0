Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFB1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 21:10:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7336860F38
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 21:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7336860F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 172BD6075E;
	Sun, 19 Sep 2021 21:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x0y_gJLmU2XE; Sun, 19 Sep 2021 21:10:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A223606BE;
	Sun, 19 Sep 2021 21:10:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AEB431BF21A
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 21:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E26F818C9
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 21:10:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E3HuNcnSTpAI for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 21:10:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41002818C4
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 21:10:27 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.167.42])
 by Aruba Outgoing Smtp  with ESMTPSA
 id S44tmB1c0FA2gS44um4grh; Sun, 19 Sep 2021 23:10:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1632085824; bh=sOyr5eFzU8dflSBlgFifd9C6RXsPd/jBL4VXVTq+5Qg=;
 h=To:From:Subject:Date:MIME-Version:Content-Type;
 b=E/atvWAH71u2yPHkxGgPtzGzH8E6IkK4u4hLLkTVpFILkiQ8yULXMWDlTaINoPpSB
 4ZJwfJ7uGwpOq4ekx71dWoIdTMlw4yd/eJ/viTyOEJiw2f9wwMe9Een6b9h2GB1Ro2
 wG9Q851oiBy+k/Pao3310nQam9qeJki3NK6ZAXtSEOREUwO66NrKLwBf+ezT2TKmvz
 C160ox0W9Rmakd2emjV/vngYka4zbKonVMoPLxI22NhPkYRsTBJljDDM5tgkpN6klb
 q9Ns/9gZk1OyMS2AmlgKS0Ec7oOeE+EkcsKVVF2a0hzwzvIRACjNMqv3nCGj9bRQ0H
 +AAGCh1YQS2tg==
To: Buildroot Mailing List <buildroot@buildroot.org>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <f98c560b-9a4f-26df-3bcb-3bdb4509786d@benettiengineering.com>
Date: Sun, 19 Sep 2021 23:10:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
X-CMAE-Envelope: MS4wfP5PB+mAuPYUe7+MAIh42QlY2nJwpkCefIGvLB/oyjiI4kWYfTfZV1ONqAit2O/Dpe91DCAAGjc3WP/vARPt7J3kHAunEa6yI5hlqFeBkwQA8TKL1e60
 dbgoMdzTK1IxDS1MeMC5s305bTCuEvyj0FDxRFKrii/401/+t5wgEwDCWQetFqCrEuYgGbHdpLM8eRKLASA68EHLmWnby+0vTRAKJiqfHzz1GRLYOHiWklcO
 +Vvq7etgzEex5rkMeLlIFMD78cgpoTFl8QkcgD0jhCgJi/WuvGIjfzAKTkNBlN/xxgJX0zN/n9wseIDJxmceDs6tZ8ViHR2FwOmHj0pkFA8=
Subject: [Buildroot] Harfbuzz bump major version question
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi All,

I'm going to bump harfbuzz to version 3.0.0 but being a major version it 
looses 15 apis[1] and introduce some new ones. So I'm not that sure if 
this can be a normal bump or I need to introduce the new package 
harfbuzz3. Package pango that requires harfbuzz builds fine, but how 
should I proceed? Should I build every package that depends on it and 
check if it builds fine? Or should I add package harfbuzz3 and then 
every package that depends on harfbuzz should move to harfbuzz3 package 
per package? I'm new to this case so help is appreciated.

Thanks in advance!

[1]: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS#L29-L49
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
