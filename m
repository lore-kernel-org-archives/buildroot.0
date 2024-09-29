Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E984CCF6495
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 19:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83D60402CE;
	Sun, 29 Sep 2024 19:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwjWmaGPQGj7; Sun, 29 Sep 2024 19:30:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F48C402C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F48C402C1;
	Sun, 29 Sep 2024 19:30:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C5D9D1BF20B
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 19:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4FED6059A
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 19:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIu2N6VBCFwN for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 19:29:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9575760595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9575760595
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9575760595
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 19:29:57 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id AFFBB240E3C;
 Sun, 29 Sep 2024 21:29:55 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 8BCDC260170;
 Sun, 29 Sep 2024 21:29:55 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 1D1EB240BCB;
 Sun, 29 Sep 2024 21:29:54 +0200 (CEST)
Message-ID: <97e1c0a9-9ebc-4b45-b231-75ac947a7ead@mail.de>
Date: Sun, 29 Sep 2024 21:29:52 +0200
MIME-Version: 1.0
To: Andrew McCann <andrew.2.622266@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>
References: <CAPKzRz-HU2_WJesQKDn_Nj8dZLgzYpJXL9+Gt6tH1Xgk8LzT=A@mail.gmail.com>
 <763b02bb-2b74-4afc-b670-d41183bef12c@grenoble.cnrs.fr>
 <CAPKzRz83KTOgnyyBBuZjzV7uSti+G05KaUnM4=mFV8U2GhcKCw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAPKzRz83KTOgnyyBBuZjzV7uSti+G05KaUnM4=mFV8U2GhcKCw@mail.gmail.com>
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1191
X-purgate-ID: 154282::1727638195-45CC9779-FEABF4B3/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1727638195;
 bh=jye+L1NfOfBxQGNPMTEU/wR7a+eNf07Fdq86FtqA3ms=;
 h=Message-ID:Date:Subject:To:Cc:From:From:To:CC:Subject:Reply-To;
 b=W3ut46Bj7XyP/YamJYfRp6xlMf+ashsmNBJrhoAcCyV3/ldbnhBYPqmkZLvVBe7bu
 VmReno9NPYfg2/Lz9UEgW3AAuEBFtGHPXBAaSyFhiHMTUhEkSfKMpAEWwoZH5UoDsX
 Bsgu41J2KzV6aZUm1IHPLpmegDQCXg1SNf9wnXYIwtno6GaIo5gpzL+Ykkwu09AWg2
 cn5EBNqPADmF1oCOupG7tVcLMC0nMRU63oAVKTm7cEvld9uhjib8lO9IONKPgYHpz2
 vDlJ8ALPCX84szNDygQhaP0Urb5QICVkhlfhTOIiZZCqaRdy7Ptsr9dB21H2DJEniQ
 Y2WpuuR3ZY3Hw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=W3ut46Bj
Subject: Re: [Buildroot] Change config.txt Not Working
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andrew,

 > I appreciate your effort.  I am surprised we don't see the same thing.
 > I installed a new instance of buildroot.  Below are my settings of
 > PACKAGE_RPI_FIRMWARE configs.  I run make, but the contents of board/
 > andrew/rpi/config_3_64bit.txt do not end up in output/images/rpi-
 > firmware/config.txt.   I have't changed any other buildroot settings
 > in menuconfig to try to narrow down the issue.  Any other 
suggestions?  > I'm guessing I'm making some small mistake, but I just 
don't see it..

I didn't try your or Edgar's steps myself. So just a suggestion, judging 
from the outside, what might be the problem, without actually knowing: 
Maybe you are missing some cleanup and rebuild step after changing your 
".config". Maybe try something like:

$ make rpi-firmware-dirclean
$ make rpi-firmware-rebuild
$ make

Ensure, that you have your modified BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE 
parameter inside your ".config" when doing these commands.

Maybe also have look at the section "Understanding how to rebuild 
packages" of:

https://bootlin.com/~thomas/site/buildroot/common-usage.html

Hope this helps and best regards,
Kilian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
