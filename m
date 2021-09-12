Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7B7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 21:11:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBE6461027
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 21:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBE6461027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92F7081A2B;
	Sun, 12 Sep 2021 21:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uiIbPrtbGR11; Sun, 12 Sep 2021 21:11:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04F6481959;
	Sun, 12 Sep 2021 21:11:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D05661BF3FD
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 21:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFCF54040F
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 21:11:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P16MEFvUS5HP for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 21:11:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp4.osuosl.org (Postfix) with ESMTP id D30B54040D
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 21:11:24 +0000 (UTC)
Received: from [192.168.126.129] ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id PWl1mw6e6KBZzPWl1mduz6; Sun, 12 Sep 2021 23:11:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631481083; bh=T8mKEW3eEnVuvRJLqlSw2eGUP+e3FO5xYb8G3UsTgJA=;
 h=Subject:From:To:Date:MIME-Version:Content-Type;
 b=YdGM6kIFat5aKlCsL1Uz9YxNkreL1lD+IEEdRPn4TB0OoaJhGKlfh0T7jIekdx1Lm
 H4QM2zkj4CxHanNb8GDMhMLYT/TwNKP+aSIdBKuuOgo2FLQYA1kURQjjcheR88ykmr
 fe6/uKLOUQQnPfWvj1blk6SIM2w0IuHis/rx1fGERjQuA1BnVfFVtcam+R06WWMD76
 VTk2KhUnNl5jezDrrrsYduuCKPq6gGMzjWbSEZw7tt4AATyT2/QcROERGFBCUxOfy7
 kA/qoBBKBA3aATYjhyhU6GYSr6w9eTUgHuB8O6OHBKRzNUDSXlyuXdLXRQJlXmafGQ
 SUf81VLh8zyGQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210912200706.2884974-1-fontaine.fabrice@gmail.com>
 <bfb503d3-a70e-9e12-6a39-d0d56dbb5e56@benettiengineering.com>
Message-ID: <60e98119-f7e7-f7d4-0976-ddd62295b068@benettiengineering.com>
Date: Sun, 12 Sep 2021 23:11:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bfb503d3-a70e-9e12-6a39-d0d56dbb5e56@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfNYzfgZRfe49wssmEjHGYAitaK+OItydrqkBYdgM5AEOQWYV3wWxxwQmx7ePDmMwnkVQk32MNkSCck9n2kG4mhs0ZzeM+f+mRRGcRUzgoqjbEMVsYsFl
 UzxA9sGvN47LtaucVOMT989/0ntNPO/flYULkVr9bOMXsWzpAQXJaZGviZ7xth5V7hSMVCil5ZJ63K6FRbPs7PvP4P2wC55W3FVywCAqbxw5fS8sSQL+3/KM
 9i4+GGutpagFuoxmMq5B0mJPbm7ZicVAbZnt5CVzEjs=
Subject: Re: [Buildroot] [PATCH 1/1] package/minicom: drop autoreconf
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

On 9/12/21 11:09 PM, Giulio Benetti wrote:
> Hi Fabrice,
> 
> On 9/12/21 10:07 PM, Fabrice Fontaine wrote:
>> autoreconf (and so AM_ICONV) is not needed since commit
>> 2df32e0d4437b422175089edf1917219656fccef
> 
> Can you specify the upstream commit instead of the Buildroot one in
> commit log?

Ah yeah, with a link too.

Thanks a lot

-- 
Giulio Benetti
Benetti Engineering sas

> 
> Except that:
> 
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Best regards
> 

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
