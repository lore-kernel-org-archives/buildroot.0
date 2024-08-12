Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8725C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 13:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3858406ED;
	Mon, 12 Aug 2024 13:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mxwak0-kyYdY; Mon, 12 Aug 2024 13:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 959D140711
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 959D140711;
	Mon, 12 Aug 2024 13:08:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EEDC31BF311
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD56060685
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GiaddcPMZwBb for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 13:08:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 05ED7605C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05ED7605C0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05ED7605C0
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 13:08:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5A3440006;
 Mon, 12 Aug 2024 13:08:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sdUmu-007C3B-1F;
 Mon, 12 Aug 2024 15:08:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240607134848.2974069-1-yann.morin.1998@free.fr>
 <20240607134848.2974069-2-yann.morin.1998@free.fr>
Date: Mon, 12 Aug 2024 15:08:40 +0200
In-Reply-To: <20240607134848.2974069-2-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 7 Jun 2024 15:48:48 +0200")
Message-ID: <877cclkhwn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 2/2] utils/checkpackagelib: extend hint
 about unscopped variables
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
Cc: "Frager, Neal" <neal.frager@amd.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > User may get confused when they see the current hint, and take that as
 > the proper replacement, while we're only reporting the stem of the
 > variable name:

 >     .../foo.mk:16: possible typo: BLA -> *FOO*

 > There is usually no easy way to actually suggest the proper variable
 > name, though, so let's make it a little bit more obvious that we meant
 > the variable was improperly scoped:

 >     .../foo.mk:16: possible typo, variable not properly scoped: BLA -> *FOO_XXX*

 > And while at it, throw in the URL to the corresponding manual entry.

 > Adapt the test accordingly.

 > Reported-by: "Frager, Neal" <neal.frager@amd.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>

 > ---
 > Note that this uncovered an issue in the composer package, and that was
 > recently fixed in master with 139e47861724. No other new issues were
 > reported with this change.

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
