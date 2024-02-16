Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB164C48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 22:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49FFF400CE;
	Fri, 16 Feb 2024 22:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhXK2RpQpLL1; Fri, 16 Feb 2024 22:30:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19C124011D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19C124011D;
	Fri, 16 Feb 2024 22:30:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A8831BF25F
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 22:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6858B612AD
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 22:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 39u6Z0TOKNRA for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 22:30:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AAE67612A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAE67612A7
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAE67612A7
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 22:30:44 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id D066E245C16;
 Fri, 16 Feb 2024 23:30:42 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id B0C0B80069;
 Fri, 16 Feb 2024 23:30:42 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 7CAAB240A5F;
 Fri, 16 Feb 2024 23:30:42 +0100 (CET)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 16 Feb 2024 23:30:42 +0100
Message-ID: <1881605.CQOukoFCf9@laptop>
In-Reply-To: <58E9CC6C-0DA1-42B9-AA17-3435786DCBDC@benettiengineering.com>
References: <20240215214341.6137-1-kilian.zinnecker@mail.de>
 <58E9CC6C-0DA1-42B9-AA17-3435786DCBDC@benettiengineering.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 655
X-purgate-ID: 154282::1708122642-077EF338-7B1EBE1C/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1708122642;
 bh=5XgEzpirQdJZM+IYo7EFtcEnPs7JCL9cSij+JANhSbg=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=XdcjWCsVK6d5+U/QaMIsuifZIf2uh898lZYMffZKBLr8BKtmDKJty52GBZiqLA0Yo
 WDOJWvIXNrGTe7Arju1FxCNK17BrsYD6ORsFOIGoa9wn3WLhgo5V7ZkL1FKIglq9TO
 ZaT7BxstClPWZj0dfQQBFDAeHmR7E3s0my/gt6ox4s2M+9PI5Pa0w9yejDFE3xwPM5
 x0B7HLocspx7jd3B0qwarGnIxj3VazjFAVK6Z01k6cmi/NtgvLFsbQ1KvGnJQ6Cyfd
 ppgEz0KgxG7RKyINPuF+QdWTlwIcc5GHPdyw/6ne87fYw8ZtPFdpa2/+G+y1WmZjAj
 QG+4hO9tW8qzA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=XdcjWCsV
Subject: Re: [Buildroot] [PATCH] configs/rock5b_defconfig: switch to
 mainline linux
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

thanks for reviewing! I made changes according to your comments and sent a v2 
of the patch.

[--SNIP--]

> It would be great if you switch to extlinux that is easier for debugging and
> here you only override bootargs so you can add environment uboot variables
> file.

Switching to extlinux played out very nicely: A lot of files became redundant 
and this decluttered the board support. Thanks!

I have a question though: Is it possible to specify in extlinux.conf, that 
uboot shall fetch the kernel image and device tree via tftp? How would an 
example of such an extlinux.conf look like?

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
