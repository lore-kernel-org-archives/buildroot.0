Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3017E7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 17:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5362811FC;
	Sun, 15 Dec 2024 17:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nGOFjtQ3oSkb; Sun, 15 Dec 2024 17:58:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF96C811E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF96C811E2;
	Sun, 15 Dec 2024 17:58:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3227BD1
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13412811DF
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUdIMXiKcuYT for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 17:58:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=glbb-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 087A3811D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 087A3811D7
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 087A3811D7
 for <buildroot@busybox.net>; Sun, 15 Dec 2024 17:58:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1tMssb-0005Ny-0o
 for buildroot@busybox.net; Sun, 15 Dec 2024 18:58:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 15 Dec 2024 18:57:41 +0100
Message-ID: <pan$de0bb$35c5a64$ca9b6f21$2408ff40@ID-313208.user.individual.net>
References: <20241214195649.917315-1-clement__23608.0726071791$1734206664$gmane$org@clementramirez.fr>
 <pan$30470$5844d8e8$7ca39d12$9dff8d5a@ID-313208.user.individual.net>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Cc: buildroot@uclibc.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH] package/busybox bump version to 1.37.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sun, 15 Dec 2024 18:50:17 +0100 schrieb Bernd Kuhls:

> and had problems with the syslogd applet (local logfiles empty) but did
> not find time to debug it so I reverted the bump:
> https://github.com/bkuhls/buildroot/commit/
> 2e610f82e964a8510bdbfbf810e8f32872e000c9
> 
> Does the syslogd applet work for you?
> 
> It seems there is some discussion about it upstream, just found those
> message today:
> https://lists.busybox.net/pipermail/busybox/2023-September/090493.html
> https://lists.busybox.net/pipermail/busybox/2024-October/090970.html

Hi again,

Alpine Linux contains not only the fix for the syslog problem
https://gitlab.alpinelinux.org/alpine/aports/-/commit/
f0c388f29c213e6a576421991dc16e1488fc2bb0

but many other patches for busybox-1.37.0:

https://gitlab.alpinelinux.org/alpine/aports/-/commits/master/main/
busybox?ref_type=undefined

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
