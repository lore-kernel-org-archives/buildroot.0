Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD352E77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 21:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23C6F80C18;
	Thu, 26 Dec 2024 21:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id co4K_exkMVIZ; Thu, 26 Dec 2024 21:20:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B5EB80C0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B5EB80C0E;
	Thu, 26 Dec 2024 21:20:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A407757
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CC0180C0D
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APjmlRnhXjpq for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 21:20:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 982DB80C0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 982DB80C0E
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 982DB80C0E
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 21:20:00 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id B9C07240B83
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 22:19:58 +0100 (CET)
Received: from smtp01.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id 88B1426009F;
 Thu, 26 Dec 2024 22:19:58 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 4909124123C;
 Thu, 26 Dec 2024 22:19:57 +0100 (CET)
To: buildroot@buildroot.org
Cc: kilian.zinnecker@mail.de
Date: Thu, 26 Dec 2024 22:19:05 +0100
Message-ID: <4632342.LvFx2qVVIh@kilian-laptop>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1008
X-purgate-ID: 154282::1735247998-34D3489E-75926965/10/3626336762
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735247998;
 bh=X94EiGqZpDEVV1KbAn8Gwzc9DUNHc1l25cZuljFCQ1Y=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=fsg/J2BkOnbof3/jm64wnEdTAa6u+a+rQLj2PMj7xMA/yO64Xl+/mRUAP95rIm9pl
 89wVpDo55q1bT2fyjJ5qvHZ/7rWC/jNCSuI6riWQpI2SKqg681mPbdGYJ2w0wkX/No
 vGl4+qGkilDaTPDd/P4HXVgWiNnGbLMHdAxPnyQVa+6PEOch4iM1ob3cghppl5P/1h
 uTjTLdsYP9M8u+zcH3h/oXN9iLfrMEqzoMGi9llKHL1cDRlRFaOPeBb5EqRj1SdvAt
 2by3tyE6TvE9ZEJ3n4qkjAsJHPQSNcuuYzMaMLV+T8R0cojsKZKD466R113/yp2nc3
 g8jubmG4wDMDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=fsg/J2Bk
Subject: [Buildroot] [Help] How to bump a package, e.g., OpenSBI?
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello all,

I saw that RISC-V's OpenSBI recently got an update to v1.6.[1] In buildroot 
the package's latest version is v1.5.[2] I would like to bump it. Ofc. I'd 
have to adjust the version in the Config.in, and also the hashes in the hash 
file. I am wondering what is required with regards to testing? Currently I 
cannot test whether RISC-V boards would work with OpenSBI v1.6. However, I 
could do a build-test, i.e., pick a RISC-V defconfig, adjust its OpenSBI 
version to 1.6 (just locally, not sending any patch with that regard to any 
board's defconfig) and see, whether OpenSBI v1.6 gets build successfully. Is 
this sufficient as testing before sending a patch bumping OpenSBI? Or is 
additional testing expected before sending a bump-patch?

Best regards,
Kilian

[1] https://github.com/riscv-software-src/opensbi/commit/
bd613dd92113f683052acfb23d9dc8ba60029e0a
[2] https://gitlab.com/buildroot.org/buildroot/-/blob/master/boot/opensbi/
Config.in?ref_type=heads#L21-22


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
