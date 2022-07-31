Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332D6C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 12:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9E6060EC2;
	Sun, 31 Jul 2022 12:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9E6060EC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uqlRrmlFXxfS; Sun, 31 Jul 2022 12:30:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C19C060E83;
	Sun, 31 Jul 2022 12:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C19C060E83
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D10A1BF33E
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 12:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECCE5405B6
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 12:30:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECCE5405B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JELledttHiZO for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 12:30:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3EF74017B
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3EF74017B
 for <buildroot@uclibc.org>; Sun, 31 Jul 2022 12:30:08 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1oI858-0005Jk-MD
 for buildroot@uclibc.org; Sun, 31 Jul 2022 14:30:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jul 2022 14:29:26 +0200
Message-ID: <pan$451db$f0fedacb$1d38fc5e$2b25cd7b@ID-313208.user.individual.net>
References: <20220731114235.93784-1-bernd.kuhls@t-online.de>
 <87les9wlk0.fsf__10495.4630181723$1659268091$gmane$org@tarshish>
 <pan$9391d$38089e12$245e79a3$aad97a61@ID-313208.user.individual.net>
 <87h72xwkkn.fsf__20322.4888000236$1659269367$gmane$org@tarshish>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/php: ignore various CVEs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sun, 31 Jul 2022 15:02:57 +0300 schrieb Baruch Siach via buildroot:

> I share your desire to make the weekly list more useful. My question is
> why current version check method does not filter out these CVEs
> automatically?

Hi Baruch,

because many CVS entries I added to the ignore lists do not contain any 
version number in the NVD database, for example:

https://nvd.nist.gov/vuln/detail/CVE-1999-0236

cpe:2.3:a:apache:http_server:-:*:*:*:*:*:*:*

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
