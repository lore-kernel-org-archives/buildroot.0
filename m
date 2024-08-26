Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F50C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 20:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85BB6401FE;
	Mon, 26 Aug 2024 20:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELTTQ-aGrjES; Mon, 26 Aug 2024 20:44:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6325440274
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6325440274;
	Mon, 26 Aug 2024 20:44:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D15E01BF29D
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 20:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C882040541
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 20:44:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nogc8hiImmVN for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 20:44:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0C09740286
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C09740286
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C09740286
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 20:44:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70EB6240004;
 Mon, 26 Aug 2024 20:43:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sigZB-00HQFN-2p;
 Mon, 26 Aug 2024 22:43:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240824190720.2370919-1-thomas.petazzoni@bootlin.com>
Date: Mon, 26 Aug 2024 22:43:57 +0200
In-Reply-To: <20240824190720.2370919-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Sat, 24 Aug 2024 21:07:19
 +0200")
Message-ID: <87plpv9fqq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/libuecc: switch to a functional
 Github repo
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
Cc: Alexander Dahl <post@lespocky.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > The https://projects.universe-factory.net/attachments/download/85 URL
 > no longer works, so let's switch to what appears to be the official
 > Github repo:

 >   https://github.com/neocturne/libuecc

 > The v7 in this Github is 100% identical to the v7 that was available
 > from https://projects.universe-factory.net/attachments/download/85.

 > Also at
 > https://metadata.ftp-master.debian.org/changelogs//main/libu/libuecc/libuecc_7-5_copyright
 > Debian lists https://github.com/NeoRaider/libuecc as the source, and
 > this URL redirects to https://github.com/neocturne/libuecc.

 > Thanks to the original tarball being a .tar.xz, and our Github macro
 > generating a .tar.gz, the filename is different, and therefore the
 > different hash will not be an issue.

 > Fixes:

 >   http://autobuild.buildroot.org/results/c4c24bd06bc7889c46d78e14d5bef528340d4463/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
