Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C909EC05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 17:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78D2F40B76;
	Sun, 19 Feb 2023 17:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78D2F40B76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ay8OuUlwCJTv; Sun, 19 Feb 2023 17:30:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE6BC4053C;
	Sun, 19 Feb 2023 17:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE6BC4053C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE0DC1BF423
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7FDC416CE
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7FDC416CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hK0YU-ZIqj-T for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 17:30:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B9FB41697
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B9FB41697
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 17:30:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2CB53E0003;
 Sun, 19 Feb 2023 17:30:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pTnW7-007OA5-Fc; Sun, 19 Feb 2023 18:30:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20230216102556.3047136-1-thomas.devoogdt@barco.com>
Date: Sun, 19 Feb 2023 18:30:27 +0100
In-Reply-To: <20230216102556.3047136-1-thomas.devoogdt@barco.com> (Thomas
 Devoogdt's message of "Thu, 16 Feb 2023 11:25:56 +0100")
Message-ID: <87mt591s24.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/lighttpd: bump to version 1.4.69
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > Changelog:
 >  - https://www.lighttpd.net/2023/1/3/1.4.68/
 >  - https://www.lighttpd.net/2023/2/10/1.4.69/

 > In this commit:
 > - rebased patch & dropped server.use-ipv6 option [1]
 > - fix changed meson options [2]

 > [1]: https://git.lighttpd.net/lighttpd/lighttpd1.4/commit/376d20f1617f2c0202fb415e4cc66d3f780db5ca
 > [2]: https://git.lighttpd.net/lighttpd/lighttpd1.4/commit/6b31f76cd9b36b6033607181238fbf41c5b81e07

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
 > ---
 >   v2: fix git message url links

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
