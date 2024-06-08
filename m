Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3368C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 18:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFF19416F1;
	Sat,  8 Jun 2024 18:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rCGGYRzmtAU0; Sat,  8 Jun 2024 18:15:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5864141866
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5864141866;
	Sat,  8 Jun 2024 18:15:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02B301BF408
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 18:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F119E606B8
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 18:15:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l50-02ziV_bE for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 18:15:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C7263606B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7263606B4
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7263606B4
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 18:15:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 725A940003;
 Sat,  8 Jun 2024 18:15:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sG0av-002HAn-0z;
 Sat, 08 Jun 2024 20:15:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240603091957.E708587989@busybox.osuosl.org>
Date: Sat, 08 Jun 2024 20:15:13 +0200
In-Reply-To: <20240603091957.E708587989@busybox.osuosl.org> (Yann E. MORIN's
 message of "Mon, 3 Jun 2024 11:18:08 +0200")
Message-ID: <87le3fwbbi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] Config.in: drop --passive-ftp from
 default wget options
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=1a61c1d9b1919120883b689c3767925bd91d3028
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fedora has recently migrated to wget2, which has dropped ftp support and the
 > --passive-ftp command line option:

 > https://fedoraproject.org/wiki/Changes/Wget2asWget

 > It turns out that the command line option also doesn't do anything for wget1
 > as it was made the default in wget 1.10:

 > https://git.savannah.gnu.org/cgit/wget.git/tree/NEWS?h=v1.13#n292

 > wget 1.10 is from 2005, so it is safe to assume that all supported
 > distributions use >= 1.10.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
