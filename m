Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C526C49EA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 22:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C75B26059C;
	Tue,  6 Aug 2024 22:40:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5H4KRXrYkV7; Tue,  6 Aug 2024 22:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3DFE606F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3DFE606F1;
	Tue,  6 Aug 2024 22:40:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED1081BF982
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E42F60668
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 22:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNqSvcLFJqRx for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 22:40:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C00376059C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C00376059C
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C00376059C
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 22:40:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7063340002;
 Tue,  6 Aug 2024 22:40:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sbSqv-0009jl-2x;
 Wed, 07 Aug 2024 00:40:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20240712183131.544A286140@busybox.osuosl.org>
Date: Wed, 07 Aug 2024 00:40:25 +0200
In-Reply-To: <20240712183131.544A286140@busybox.osuosl.org> (Arnout
 Vandecappelle via buildroot's message of "Fri, 12 Jul 2024 20:30:50
 +0200")
Message-ID: <87ikwdp95y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] docs/manual: normalize delimiters of
 listing blocks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=447fa1fca425e629cc65cd0a8261a4c09ddf67d2
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Although the asciidoc toolchain accepts any number of ~ to delimit a
 > listing block (i.e. a code block), it is actually specified to be
 > exactly four, i.e. ~~~~. Currently, a mix of diffrent numbers of ~ are
 > being used - sometimes even a different number at the beginning and at
 > the end of the block.

 > Normalize this to always use exactly four ~ for the delimiter.

 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
