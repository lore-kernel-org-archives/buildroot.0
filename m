Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E00C83F14
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 22:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00FD741814;
	Wed, 30 Aug 2023 22:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00FD741814
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SKPQXCDUWkTm; Wed, 30 Aug 2023 22:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5EB72402B1;
	Wed, 30 Aug 2023 22:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5EB72402B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E8E61BF424
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 183D9822FB
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 183D9822FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HH-IBGK19tNc for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 22:26:20 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FE28822DC
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 22:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FE28822DC
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F666E0002;
 Wed, 30 Aug 2023 22:26:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qbTdg-000JRJ-Mz; Thu, 31 Aug 2023 00:26:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <VI1P190MB0493EB214DD0DF6418B029E69FBF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 <20230730234227.08d99fea@windsurf>
Date: Thu, 31 Aug 2023 00:26:16 +0200
In-Reply-To: <20230730234227.08d99fea@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sun, 30 Jul 2023 23:42:27 +0200")
Message-ID: <878r9snp4n.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/sam-ba: drop 32bit host lib
 requirement
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
Cc: Lang Daniel <d.lang@abatec.at>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Hello Daniel,
 > On Wed, 15 Mar 2023 16:21:11 +0000
 > Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

 >> Current versions of sam-ba are 64bit only.
 >> 
 >> objdump -p $(HOST_DIR)/bin/sam-ba
 >> $(HOST_DIR)/bin/sam-ba: file format elf64-x86-64
 >> 
 >> Signed-off-by: Daniel Lang <d.lang@abatec.at>
 >> ---
 >> Config.in                     | 2 +-
 >> package/sam-ba/Config.in.host | 1 -
 >> 2 files changed, 1 insertion(+), 2 deletions(-)

 > Indeed, this was wrong since commit
 > b26a62236f015ee723206c6a6da431799e8866da. So: applied to master!

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
