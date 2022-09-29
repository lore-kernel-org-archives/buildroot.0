Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC81DC433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 15:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A175418F7;
	Thu, 29 Sep 2022 15:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A175418F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mvj-9o-2Dg2R; Thu, 29 Sep 2022 15:29:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E3E2408E9;
	Thu, 29 Sep 2022 15:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E3E2408E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BD191BF334
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 15:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01C894108C
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 15:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01C894108C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5DAOWifaOlxx for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 15:29:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DDD741089
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0DDD741089
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 15:29:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C7D1C20004;
 Thu, 29 Sep 2022 15:29:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1odvTf-009ges-OS; Thu, 29 Sep 2022 17:29:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Quentin Schulz <foss+buildroot@0leil.net>
References: <20220919114757.1076737-1-foss+buildroot@0leil.net>
Date: Thu, 29 Sep 2022 17:29:31 +0200
In-Reply-To: <20220919114757.1076737-1-foss+buildroot@0leil.net> (Quentin
 Schulz's message of "Mon, 19 Sep 2022 13:47:57 +0200")
Message-ID: <874jwq8ahw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/busybox: fix CVE-2022-30065
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Quentin" == Quentin Schulz <foss+buildroot@0leil.net> writes:

 > From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
 > This fixes CVE-2022-30065 by backporting a patch from the master branch.

 > Cc: Quentin Schulz <foss+buildroot@0leil.net>
 > Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
 > ---

 > Cc'ing Peter for backport to stable releases
 > Only build tested

Committed to 2022.02.x, 2022.05.x and 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
