Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CC7C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 16:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91DE94013E;
	Sun, 13 Nov 2022 16:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91DE94013E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TSWYPsdJDqID; Sun, 13 Nov 2022 16:48:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 842D4400CF;
	Sun, 13 Nov 2022 16:48:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 842D4400CF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2452B1BF2FE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF79881656
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 16:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF79881656
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m2eAIn4cl97h for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 16:48:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1E1581589
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1E1581589
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 16:48:07 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EE0C41C0007;
 Sun, 13 Nov 2022 16:48:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouG9N-005TLf-2s; Sun, 13 Nov 2022 17:48:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
References: <20220916210059.2395129-1-geomatsi@gmail.com>
 <20220916210059.2395129-3-geomatsi@gmail.com>
Date: Sun, 13 Nov 2022 17:48:05 +0100
In-Reply-To: <20220916210059.2395129-3-geomatsi@gmail.com> (Sergey
 Matyukevich's message of "Sat, 17 Sep 2022 00:00:59 +0300")
Message-ID: <87k03yol6i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/wpa_supplicant: fix static
 build issue with zlib-ng
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Sergey" == Sergey Matyukevich <geomatsi@gmail.com> writes:

 > Hostapd/wpa_s uses 'crc32' name for IEEE802.11 CRC-32 routine. This name
 > is too generic. Buildroot autobuilder detected configurations that failed
 > to build due to the naming conflict with zlib-ng.

 > Add wpa_supplicant part of the upstream patch that renames 'crc32'
 > function to a less generic 'ieee80211_crc32' name.

 > Fixes: http://autobuild.buildroot.net/results/ac19975f0bf77f4a8ca574c374092ba81cd5a332/

 > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
