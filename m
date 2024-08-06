Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E13C52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 21:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1EEB606AE;
	Tue,  6 Aug 2024 21:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tqg35e7wEB54; Tue,  6 Aug 2024 21:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3093E605E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3093E605E1;
	Tue,  6 Aug 2024 21:53:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4C121BF30B
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D107E80C16
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 21:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEs6cC30UCoZ for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 21:53:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A528980BF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A528980BF0
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A528980BF0
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 21:53:29 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id CD9A3240EC5;
 Tue,  6 Aug 2024 23:53:27 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix01.mail.de (Postfix) with ESMTP id 7A9B3240FBA;
 Tue,  6 Aug 2024 23:53:27 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 4DB83240CE9;
 Tue,  6 Aug 2024 23:53:25 +0200 (CEST)
To: romain.naour@smile.fr
Date: Tue, 06 Aug 2024 23:53:25 +0200
Message-ID: <3823808.kQq0lBPeGt@laptop>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1363
X-purgate-ID: 154282::1722981206-2ACCF779-419F9CEB/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1722981207;
 bh=AZKLiSX+sJMDmjVzo5nfYCQJoiaKIJ2Dg1OWyXQcDRk=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=BQEEBqZaBE5ZohNd05wQWGjsI67Eji7bULWmMazkv8m+7izBf/zOtUVkhpnPhGysS
 trDeE1tu/FRV/sST/NkWhtgbCQtFQ8wifXbTZDyW3LCgs1isercgrkLBIR9unBD1KB
 VQjxQ22c1kRwWQmAtUvmI4yQ47mZDYbO+C66GlOT6ZZAgFjOE0W6+jpL/Z3+AX9BpM
 5mlebxhDAlchYOXsUQBXa4g5D8sjSrbsNWQueMRrE3DiCtQMvuFFyCtWrux+so/faJ
 z2Oq9Au83z2S6iRnzhfhF/ous1ZFGkiiHRx8A+ccUO69oduQHHyb1kcJfy/jgljdWb
 /AGYCEShdggqg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=BQEEBqZa
Subject: Re: [Buildroot] [PATCH v4 2/3] package/xuantie-bins: new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

thanks for reviewing.

>> +XUANTIE_BINS_VERSION = 1.2.1
>> +XUANTIE_BINS_SITE = $(call github,beagleboard,xuantie-ubuntu,beaglev-$
(XUANTIE_BINS_VERSION))
>> +XUANTIE_BINS_LICENSE = PROPRIETARY
>
> "We need a proper license, that at least gives the right to redistribute 
those
> binaries. Without a license, nobody is allowed to redistribute those 
binaries,
> making them pretty useless." [1].
>
> This is the same issue here, we don't have any license information when 
theses
> binaries where added [2].
>
> [1]
> http://patchwork.ozlabs.org/project/buildroot/patch/1533545408-11248-2-git-send-email-narmstrong@baylibre.com/
> [2]
> https://git.beagleboard.org/beaglev-ahead/xuantie-ubuntu/-/commit/
f64f1cd8cf80fa50782b3a50a2d3272bc59451ed

Yes, I agree. I already encountered that problem in the past with binary blobs 
from Rockchip ([1]). Back then I managed to get the developers from Rockchip 
to add the license to the repository. I am currently trying to get the proper 
license added to the repository too, but this time it seems really tricky. 
Hopefully I will eventually succeed. I will reply again if I am successful, or 
if I come to the conclusion that I cannot get the proper license added.

[1] https://lists.buildroot.org/pipermail/buildroot/2023-July/732747.html

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
