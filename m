Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11D2C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 11:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A07B340506;
	Mon, 12 Aug 2024 11:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTLjEP3q6xhT; Mon, 12 Aug 2024 11:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77B2840520
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77B2840520;
	Mon, 12 Aug 2024 11:22:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B7911BF2A5
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 11:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6496280F1A
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 11:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHh_lfIN0Atm for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 11:22:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 752EA80EB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 752EA80EB4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 752EA80EB4
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 11:22:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A283220007;
 Mon, 12 Aug 2024 11:22:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sdT8C-0072Jy-0g;
 Mon, 12 Aug 2024 13:22:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
References: <20240713054407.229084-1-heiko.thiery@gmail.com>
Date: Mon, 12 Aug 2024 13:22:32 +0200
In-Reply-To: <20240713054407.229084-1-heiko.thiery@gmail.com> (Heiko Thiery's
 message of "Sat, 13 Jul 2024 07:44:08 +0200")
Message-ID: <87ttfqj893.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/2] package/llvm-project/llvm: remove
 overriding the ASM compiler
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Heiko" == Heiko Thiery <heiko.thiery@gmail.com> writes:

 > There was an error in the pkg-cmake infra file regarding the selection
 > of the ASM compiler. Now that this has been fixed, overwriting the
 > ASM compiler selection is no longer necessary.

 > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
