Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D631C3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 18:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C32498207B;
	Thu,  1 Aug 2024 18:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnZt7PvcfOR5; Thu,  1 Aug 2024 18:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D43E88207D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D43E88207D;
	Thu,  1 Aug 2024 18:58:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1588F1BF2B9
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 18:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02FE340E3F
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 18:58:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNeRdnioDCy7 for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 18:58:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16DCE410AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16DCE410AB
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16DCE410AB
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 18:58:55 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 89CB8240086;
 Thu,  1 Aug 2024 20:58:54 +0200 (CEST)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id 6D854A00E2;
 Thu,  1 Aug 2024 20:58:54 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id C89CE240A49;
 Thu,  1 Aug 2024 20:58:53 +0200 (CEST)
To: buildroot@buildroot.org, philip-dylan@gleonec.bzh,
 "festevam@gmail.com" <festevam@gmail.com>
Date: Thu, 01 Aug 2024 20:58:53 +0200
Message-ID: <4911724.GXAFRqVoOG@laptop>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 512
X-purgate-ID: 154282::1722538734-DACAF6E7-1DCC1809/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1722538734;
 bh=NtKbXpBCgC+vHOZmS84ltHU060KHcWrA8bhmGe6V2sc=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=zoWHjkLIBUw7oRmv9/0XoLWSrWXTlXXuMY0+s2azSZwJojoQGX7umbOui8aql7eBG
 C70o9y80x2kvcw/MMfFWS+6Wi+4K8YqjJ7Ws4BDo9J2+N9Onbdn2ODrB6s1KuyNg8g
 QfePgMrmBpA4rZQ0FAfwaqsxxsuybRaxDyrg8m5xEIQIZt0SLrOfCa/t2O6JRYgBDq
 meotjclQuiuI4VMAAEzUuiEroBelJUVm0UtKsrsJWxGEG/2GHttnDDBDO579O/X/WP
 BZuBP2huHD+Tp1cFcIYJT86g7vombSRNA1MjB5iOButH15O1YAUzHdX3/JAXaiMVl4
 fFX681DM+dPuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=zoWHjkLI
Subject: Re: [Buildroot] [PATCH v2 0/2] Udoo Neo kernel update
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Philip, all,

> Please find attached the corrected patchet for the Udoo Neo kernel
> update.
> This fixes the linux hash to use the correct version.

Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Acked-by: Kilian Zinnecker <kilian.zinnecker@mail.de>

I built the image and was able to boot it on my Udoo Neo Basic.

Sorry for not replying directly on your email - I currently don't receive 
emails from the buildroot mailing list, hence I wasn't able to.

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
