Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF1CC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 18:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15523402DE;
	Sat,  8 Jun 2024 18:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvo5pef_SLMZ; Sat,  8 Jun 2024 18:11:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A75B3402EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A75B3402EA;
	Sat,  8 Jun 2024 18:11:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 620B61BF408
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 18:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C9A384450
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 18:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPtC3fFqDZb0 for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 18:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2E55821F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2E55821F1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2E55821F1
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 18:11:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DA4261BF204;
 Sat,  8 Jun 2024 18:11:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sG0XU-002GoV-1k;
 Sat, 08 Jun 2024 20:11:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240603071726.532652-1-peter@korsgaard.com>
 <Zl2Ly8g2Ayl9IF4-@landeda>
Date: Sat, 08 Jun 2024 20:11:40 +0200
In-Reply-To: <Zl2Ly8g2Ayl9IF4-@landeda> (Yann E. MORIN's message of "Mon, 3
 Jun 2024 11:24:27 +0200")
Message-ID: <87r0d7wbhf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 01/23] package/doom-wad: drop reference to
 ftp.idsoftware.com
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2024-06-03 09:17 +0200, Peter Korsgaard spake thusly:
 >> The server was decommisioned in 2017 and is unlikely to ever come back, so
 >> drop the reference:
 >> 
 >> https://www.doomworld.com/forum/topic/96999-rip-ftpidsoftwarecom/
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Whole series applied to master, thanks. I've additionally replied to
 > individual patches where I did some changes.

Committed series to 2024.02.x except for the two package removals, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
