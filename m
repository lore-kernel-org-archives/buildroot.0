Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8A4C25B0F
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 16:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDB7483ED1;
	Sun, 14 Aug 2022 16:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB7483ED1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahnQhXG76o1Y; Sun, 14 Aug 2022 16:37:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF8DF83ECE;
	Sun, 14 Aug 2022 16:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF8DF83ECE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CAEC31BF410
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1B4460D50
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1B4460D50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BBV7S2QaCnoa for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 16:37:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 722CE60D69
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 722CE60D69
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:37:44 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 51352240008;
 Sun, 14 Aug 2022 16:37:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oNGcN-000MxP-On; Sun, 14 Aug 2022 18:37:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Colin Foster <colin.foster@in-advantage.com>
References: <20220720171125.2914642-1-colin.foster@in-advantage.com>
Date: Sun, 14 Aug 2022 18:37:39 +0200
In-Reply-To: <20220720171125.2914642-1-colin.foster@in-advantage.com> (Colin
 Foster's message of "Wed, 20 Jul 2022 10:11:25 -0700")
Message-ID: <875yiuixws.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/mstpd: fix mstpd bridge-stp use
 of pidof
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Colin" == Colin Foster <colin.foster@in-advantage.com> writes:

 > Through mstpd version 0.1.0, the bridge-stp script uses the '-c'
 > option to the pidof command. Busybox does not support this option, so
 > mstpd does not work.

 > This has been fixed in the main development branch of mstpd, but it is
 > unclear when the next release will be. In the meantime, apply the fix
 > here so that mstpd will be useable until the next version release.

 > Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
