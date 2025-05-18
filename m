Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B42C3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 06:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F99C81F84;
	Sun, 18 May 2025 06:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omrYEbzjVG1P; Sun, 18 May 2025 06:33:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3711481F75
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3711481F75;
	Sun, 18 May 2025 06:33:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 256EC1C9
 for <buildroot@buildroot.org>; Sun, 18 May 2025 06:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A85681F75
 for <buildroot@buildroot.org>; Sun, 18 May 2025 06:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBoNOLDA5SoC for <buildroot@buildroot.org>;
 Sun, 18 May 2025 06:33:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=daggs@gmx.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5E9D81F73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5E9D81F73
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5E9D81F73
 for <buildroot@buildroot.org>; Sun, 18 May 2025 06:32:59 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [193.16.224.1] ([193.16.224.1]) by web-mail.gmx.net
 (3c-app-mailcom-bs14.server.lan [172.19.170.182]) (via HTTP); Sun, 18 May
 2025 08:32:57 +0200
MIME-Version: 1.0
Message-ID: <trinity-14131c26-e3d1-4322-b0cd-b9bbf25edd81-1747549977480@3c-app-mailcom-bs14>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 08:32:57 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:Ji+laKlrY4sKdxdxYuHd/AIY4Wnx6pE5RvYnmhifZ825Ov4mUv9Gnvem2lKPpdCtHBMui
 N61OPHcd4Ocmk0seSIvI+5qzrNEFgsH/3rB3SmsmEA+hwyBOnDDpfw7tFqw5ghl1DHQBqypZZj3u
 2SUzOO62licSEc1gn5zpmyD8eIdh088Ra0v9dPmlyNTzqmtEyGU0dXmjt949ysMNDu1ox+1TKDSL
 I3GYQOaiZNpG7H11Z9K+dD/QNCTTWgVlUnTOGKd8jHBItVZPV9/KyPY3Ip24XBhkda+oLdmh5cpg
 wo=
UI-OutboundReport: notjunk:1;M01:P0:duSFcHdaQQU=;NinQdblVlc7xu5h3zI8AfkM6biP
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.com; 
 s=s31663417; t=1747549977; x=1748154777; i=daggs@gmx.com;
 bh=IYBqMpm++kpRYKWufOoH/RN4RKUBElKnvGiJBqe3Wyo=;
 h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Subject:
 Content-Type:Date:cc:content-transfer-encoding:content-type:date:
 from:message-id:mime-version:reply-to:subject:to;
 b=L9OeaEJSdfS/s5kz7C1KrufRtN2AEUCrwzImD68PIvAtdw49y/OUTeshtCFlmbID
 ZBmjGIC2A2qdEywTC96iSnOntsjlXXYpcG5mz2v1ZSFCcIz5zB08Z3cjJMv21LasO
 gPl6OfyOaaMPtVWDZ/WM4QU5elmvcTpnodLcbcEC4r3I7UWwgp54g8UJehkq0ucCq
 VB/PFA785HZJ35zjErMwgSdeaRool62q8BWHqWM/V4ZNh4Utmg/HHl8nMaXBH1nTp
 mjWpo5VnHRUrMEl7bbbJ10blCZGRbLxr7DiQJxr0MIp6JN80hmlKFz7oltcYAPxY8
 JUngDORysz9KFHXQ7A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.com header.i=daggs@gmx.com header.a=rsa-sha256
 header.s=s31663417 header.b=L9OeaEJS
Subject: [Buildroot] adding service file as part of a image generation
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
From: daggs via buildroot <buildroot@buildroot.org>
Reply-To: daggs <daggs@gmx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Greetings,

I need to add a custom systemd service file to an image prior to using it, preferable as part of the build
is there such support?

Thanks,

Dagg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
