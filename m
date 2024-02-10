Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D834EC48260
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 15:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BFF78139A;
	Sat, 10 Feb 2024 15:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dksM26rr8oQp; Sat, 10 Feb 2024 15:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E10B813C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E10B813C0;
	Sat, 10 Feb 2024 15:22:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3AA1BF5F6
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 15:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 669BC813C0
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 15:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i4DnuF8bEfk3 for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 15:22:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E6808139A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E6808139A
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E6808139A
 for <buildroot@buildroot.org>; Sat, 10 Feb 2024 15:22:14 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id D333C240B7C;
 Sat, 10 Feb 2024 16:22:12 +0100 (CET)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix01.mail.de (Postfix) with ESMTP id B7191801CB;
 Sat, 10 Feb 2024 16:22:12 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 5865724054C;
 Sat, 10 Feb 2024 16:22:11 +0100 (CET)
To: kilian.zinnecker@mail.de, buildroot@buildroot.org
Date: Sat, 10 Feb 2024 16:22:10 +0100
Message-ID: <4544153.LvFx2qVVIh@laptop>
In-Reply-To: <08b6187c-94f2-4cbc-b0e8-0066ca687796@benettiengineering.com>
References: <20231204231212.36450-1-kilian.zinnecker@mail.de>
 <20231204231212.36450-2-kilian.zinnecker@mail.de>
 <08b6187c-94f2-4cbc-b0e8-0066ca687796@benettiengineering.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1106
X-purgate-ID: 154282::1707578532-47DBA670-47838CED/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1707578532;
 bh=P+yBt4io141fhg3vWx1NXjeaoqE/SZh7BqYd+qVfF6M=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=29+0gMPIWyepc2+9AfOuFOTbk4oBxTHeckng4BW8E8MmTF0lkRrY2mPMC56vd65Vm
 pBEgrori6Gh+G8KvOGmpYWwG+sDBxtHuBK1DMVw/5aW7smV3X9RfDPZij7EI7e4hNE
 tE8nyz8FvOP+KLFg+AyDxxGqqy5IkM601k6WOhRGEO1EpfwF9apRtFfrnJSLuSrgQz
 Eml8QQ9UABUA31IauXCnA79D/q/CE0Yq84sNrHVrEbeThEvLUce/i6gTzb8CW7+av0
 yARPwvbDdspKqnr5Qcn3osTBaToLh+9zAfG34tmP7Ph3HasXsMOSjP2DEhrQt7dRnH
 jyEMo99eB9G1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=29+0gMPI
Subject: Re: [Buildroot] [PATCH v2 1/2] package/xuantie-bins: new package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Robert Nelson <robertcnelson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio, all,

> Hi Yegor, Kilian,

This is strange, maybe someone can have a look here: On ozlabs, there are a 
lot of patches, which have the submitter "kilian.zinnecker--- via buildroot". 
However, most of them are NOT from me. E.g., one from Yegor Yefremov [1] is 
marked with submitter "kilian.zinnecker--- via buildroot" - However, I am 
definitively not Yegor, and none of his patches is from me. There are even more 
patches marked with "kilian.zinnecker--- via buildroot" [2], some of them even 
from before I ever submitted my first patch (the Rock5B board support) to 
buildroot. Does anyone have any idea what this is about, or can have a deeper 
look at this? (The BeagleV-Ahead patches are from me.)

[1] https://patchwork.ozlabs.org/project/buildroot/patch/
20240206132051.2838897-1-yegorslists@googlemail.com/

[2] https://patchwork.ozlabs.org/project/buildroot/list/?
submitter=82609&archive=both&state=*

[--SNIP--]

Thanks for your review Giulio. I will try to address the issues and prepare a 
new version of the patches.

Best regards,
Kilian





_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
