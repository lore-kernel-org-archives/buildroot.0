Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3090E7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 17:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8241D8408E;
	Sun, 15 Dec 2024 17:50:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFdcpGqR_sJQ; Sun, 15 Dec 2024 17:50:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98F8284091
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98F8284091;
	Sun, 15 Dec 2024 17:50:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CEFD2C5
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9E2140687
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 17:50:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IrJu3F96Dwpu for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 17:50:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3832740685
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3832740685
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3832740685
 for <buildroot@uclibc.org>; Sun, 15 Dec 2024 17:50:37 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1tMslG-0008Wl-7W
 for buildroot@uclibc.org; Sun, 15 Dec 2024 18:50:34 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 15 Dec 2024 18:50:17 +0100
Message-ID: <pan$30470$5844d8e8$7ca39d12$9dff8d5a@ID-313208.user.individual.net>
References: <20241214195649.917315-1-clement__23608.0726071791$1734206664$gmane$org@clementramirez.fr>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
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

Hi Clement,

Am Sat, 14 Dec 2024 20:56:49 +0100 schrieb Clement Ramirez:

please renumber the remaining patches.

> diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
> index 6eba365ecc..c2f8627115 100644
> --- a/package/busybox/busybox.hash
> +++ b/package/busybox/busybox.hash
> @@ -1,5 +1,5 @@
>  # From https://busybox.net/downloads/busybox-1.36.1.tar.bz2.sha256

Please update the link to the hash file.

> -BUSYBOX_VERSION = 1.36.1
> +BUSYBOX_VERSION = 1.37.0

I tried that version a couple of months ago:
https://github.com/bkuhls/buildroot/commit/
6e409ec1344ff66b3dd8c4975452c1233fd80139

and had problems with the syslogd applet (local logfiles empty) but did 
not find time to debug it so I reverted the bump:
https://github.com/bkuhls/buildroot/commit/
2e610f82e964a8510bdbfbf810e8f32872e000c9

Does the syslogd applet work for you?

It seems there is some discussion about it upstream, just found those 
message today:
https://lists.busybox.net/pipermail/busybox/2023-September/090493.html
https://lists.busybox.net/pipermail/busybox/2024-October/090970.html

and the discussed fix was not committed yet:
https://git.busybox.net/busybox/log/sysklogd

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
