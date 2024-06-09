Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450DCC27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 12:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFD686064B;
	Sun,  9 Jun 2024 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPCGkXbi8phY; Sun,  9 Jun 2024 12:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E33946061A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E33946061A;
	Sun,  9 Jun 2024 12:38:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC36B1BF3EE
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 12:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9737380CE1
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vt5hRWstJvbi for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 12:38:53 +0000 (UTC)
X-Greylist: delayed 319 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 09 Jun 2024 12:38:52 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A7C8B80C63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7C8B80C63
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7C8B80C63
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 12:38:52 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id C183E240C9B;
 Sun,  9 Jun 2024 14:33:31 +0200 (CEST)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id A4ACBA03C4;
 Sun,  9 Jun 2024 14:33:31 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id F03CC240EB5;
 Sun,  9 Jun 2024 14:33:29 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sun, 09 Jun 2024 14:33:29 +0200
Message-ID: <6052941.lOV4Wx5bFT@laptop>
In-Reply-To: <8b75fd72-c3e4-4359-9691-2bf824904d45@benettiengineering.com>
References: <20240217083525.561684-1-kilian.zinnecker@mail.de>
 <8b75fd72-c3e4-4359-9691-2bf824904d45@benettiengineering.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 505
X-purgate-ID: 154282::1717936411-FD52E878-803D668F/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1717936411;
 bh=XThn6lGGmriEzeG4Chx5aqcOZTTr22xHWHsxskeIkTY=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=Fsg1tf570Rqpeq3+DnN4WckZr9Fpppay458/cxC/3Xq3N1M3jbi/i1ezYqQm3Qacc
 HAsEvWR8yRbGXklN9v0rg+015uQo9/Ej4GNd1I6aebYTK+wod0/DsiJM3XyjLjcIZF
 Sn8v/uiopQDsgPkdt0TQ3719JlUpvNbDP/56rOjiKcPuIC+8lLqYBm+BsINsOeEV1T
 jzyBfGRCqCDF1GrTwbFT/0BCAdBSvtmaboIuz/SNuWV7qwuYZ3WspQw0BgLs1Zyh1R
 i3NpiM+4E5nZjmAO5afC0zxrtYely9AR5oDhKZRlo/BmGmr2Uuaz+HHAC2fFvj6yaw
 SRi0LovIxm/iQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=Fsg1tf57
Subject: Re: [Buildroot] [PATCH v3] configs/rock5b_defconfig: switch to
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
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio, All,

> it looks everything good to me now, so:
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Thanks for all the feedback and for reviewing Giulio!

@all: Are there still things which I may fix or improve, so that the patch may 
finally be applied? From my side its not urgent, but of course I would like to 
see the patch hopefully get accepted at some point, and ofc if needed, I would 
give it a try to improve the patch.

Best regards,
Kilian 


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
