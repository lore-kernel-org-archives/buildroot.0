Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222C9C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 21:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD3B160A53;
	Mon,  6 May 2024 21:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZt3m7zoXPWe; Mon,  6 May 2024 21:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEA6660A56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEA6660A56;
	Mon,  6 May 2024 21:01:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 768ED1BF59D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6397540118
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 21:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bh3NMvQ10jL9 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 21:01:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 16C1B40163
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16C1B40163
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 16C1B40163
 for <buildroot@buildroot.org>; Mon,  6 May 2024 21:01:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD955E0003;
 Mon,  6 May 2024 21:01:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s45SM-003juw-0B;
 Mon, 06 May 2024 23:01:06 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240411043420.511368601F@busybox.osuosl.org>
Date: Mon, 06 May 2024 23:01:06 +0200
In-Reply-To: <20240411043420.511368601F@busybox.osuosl.org> (Yann E. MORIN's
 message of "Thu, 11 Apr 2024 06:33:25 +0200")
Message-ID: <87r0eey7sd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] support/testing: sync TestATFAllwinner
 with orangepi_zero_plus2_defconfig
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=eb16148dddc6be39b0d850181c2461fdaba1ee6f
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > u-boot-2021.04 seems to be broken when pylibfdt support is enabled
 > and the latest python3/setuptools are used.

 > Since the TestATFAllwinner is using bananapi_m64 as u-boot defconfig
 > but the Buildroot defconfig of this board was removed in 2022.11 [1]
 > update TestATFAllwinner to use a newer BSP. Use the one provided
 > by orangepi_zero_plus2_defconfig.

 > [1] daf3c6661f823e566b6310042884c36c1d73f1de

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/6477656317 (TestATFAllwinner)

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
