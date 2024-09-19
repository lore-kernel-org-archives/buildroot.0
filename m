Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA552CF3962
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 17:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D80C42450;
	Thu, 19 Sep 2024 17:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFFXmbHXwrXY; Thu, 19 Sep 2024 17:55:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 203B542455
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 203B542455;
	Thu, 19 Sep 2024 17:55:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2D431BF836
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 17:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE9214045E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 17:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvSQjygnXQFx for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 17:55:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.150.162;
 helo=dd33218.kasserver.com; envelope-from=brpi@duering-andreas.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F2C114038B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2C114038B
Received: from dd33218.kasserver.com (dd33218.kasserver.com [85.13.150.162])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2C114038B
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 17:55:41 +0000 (UTC)
Received: from devuanPc.fritz.box (muedsl-82-207-200-048.citykom.de
 [82.207.200.48])
 by dd33218.kasserver.com (Postfix) with ESMTPSA id 7E934200253C;
 Thu, 19 Sep 2024 19:55:38 +0200 (CEST)
Date: Thu, 19 Sep 2024 19:55:37 +0200
To: buildroot@buildroot.org
Message-ID: <20240919195537.6ad966f2@devuanPc.fritz.box>
In-Reply-To: <10fa5318-3bc7-474c-a8ad-ec3928757d96@mind.be>
References: <20240915210519.4d3322a5@devuanPc.fritz.box>
 <10fa5318-3bc7-474c-a8ad-ec3928757d96@mind.be>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=duering-andreas.de; 
 s=kas201911161523; t=1726768538;
 bh=UKndl8D4wHcXljjZ02pRHwumzzTzsWw35pf1DmRP3eo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:Reply-To:From;
 b=NhaAcl1zBu03u08m4b+IYLobUdL/wtkwEJMBeJ9d01VcZwgGGE+Wf0jmT9x2fBKFy
 zzA3g3ZE3YtBlIoB6U97DOCy06yC74x65EScs6bEhVJQ5UMkgtB1lPQi8gybBuUZWP
 bTN6tuyUXsCjNRh2vgmAU/oOMwbQCBGnEzxmaCene+bWJ08zawv6wQOEnzD4ZzYaGK
 yeS2btlHGMziGg5WVt6RoFkQYAYXO2SpiXicvkr/oV8BfB6oz5Spo5W5eRX2uCpcIc
 wemVe8XtnpAbuHrEBnrsjs+iOXo1d1TnUQDgPeWBP+exsElnEkYw3k9YBvOsPB76ce
 0pw9032aRiFuw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=duering-andreas.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=duering-andreas.de header.i=@duering-andreas.de
 header.a=rsa-sha256 header.s=kas201911161523 header.b=NhaAcl1z
Subject: Re: [Buildroot] mbedtls: Test programs with unfortunate names
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
From: =?utf-8?q?Andreas_D=C3=BCring_via_buildroot?= <buildroot@buildroot.org>
Reply-To: Andreas =?UTF-8?B?RMO8cmluZw==?= <brpi@duering-andreas.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout,

>  Why are those names weird? [...] And it's optional [...]

I did not actually expect a program "hello" to be installed, but I get
your point.
I briefly thought of it, but I don't adding think an
exhaustive list of the programs in the Config description would be
appropriate either (maintenance effort, and those who are curious can
actually look it up in the mbedtls source archive, after all).

>  Please take this upstream first. We don't want to maintain a patch
>  like this indefinitely.

That's a good point, especially since the patch would have to be
maintained / updated in case programs (or rather, subdirectories) are
added or removed by mbedtls.

Best regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
