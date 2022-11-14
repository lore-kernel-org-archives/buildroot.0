Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9045C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 07:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A17B4159F;
	Mon, 14 Nov 2022 07:20:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A17B4159F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4dbvzx6FiPyq; Mon, 14 Nov 2022 07:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3887F41583;
	Mon, 14 Nov 2022 07:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3887F41583
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49D9A1BF3A7
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EBF560D80
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EBF560D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kV9QeS2iArFK for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 07:20:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7D9860D7F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7D9860D7F
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 07:20:44 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3840240005;
 Mon, 14 Nov 2022 07:20:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouTlq-0061Sb-ER; Mon, 14 Nov 2022 08:20:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20221103143414.2624696-1-peter@korsgaard.com>
Date: Mon, 14 Nov 2022 08:20:42 +0100
In-Reply-To: <20221103143414.2624696-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 3 Nov 2022 15:34:13 +0100")
Message-ID: <8735amm27p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/multipath-tools: security bump to
 version 0.9.3
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2022-41974: Authorization bypass
 > - CVE-2022-41973: Symlink attack

 > For more details, see the writeup:
 > https://blog.qualys.com/vulnerabilities-threat-research/2022/10/25/leeloo-multipath-authorization-bypass-and-symlink-attack-in-multipathd-cve-2022-41974-and-cve-2022-41973

 > Update README.md hash after license-unrelated changes:

 > git shortlog 0.9.0..0.9.3 -- README.md
 > Konstantin Kharlamov (1):
 >       README.md: mention libreadline and libedit optional deps

 > Xose Vazquez Perez (4):
 >       multipath-tools: update devel repo info in README.md
 >       multipath-tools: add ALUA info to README.md
 >       multipath-tools: add basic info on how to use multipath-tools with NVMe devices
 >       multipath-tools: add more info for NetApp RDAC arrays

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
