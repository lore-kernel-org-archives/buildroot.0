Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D31CF2566
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 13:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F1028143A;
	Sat, 12 Oct 2024 13:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZ1lYG8iMHjG; Sat, 12 Oct 2024 13:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1805F81497
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1805F81497;
	Sat, 12 Oct 2024 13:37:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 252531BF5DF
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 13:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EC7F60598
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 13:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78169_xGNG-c for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 13:37:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4E2D5600CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E2D5600CB
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E2D5600CB
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 13:37:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEE181BF203;
 Sat, 12 Oct 2024 13:37:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1szcJW-00DGgB-0D;
 Sat, 12 Oct 2024 15:37:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20240915213641.F36C8821B6@busybox.osuosl.org>
Date: Sat, 12 Oct 2024 15:37:46 +0200
In-Reply-To: <20240915213641.F36C8821B6@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 15 Sep 2024 23:34:24 +0200")
Message-ID: <87v7xxfnmd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] docs/manual/manual.adoc: unbreak
 BR2_VERSION logic
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

 > commit: https://git.buildroot.net/buildroot/commit/?id=ec270a08150980e37e36eeb43f4471ed8f7d662e
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The behaviour of asciidoc on my laptop (Debian 10.2.0-1) changed at the end
 > of last year, causing the BR2_VERSION logic to no longer work:

 > grep 'manual generated' buildroot-2023.02.*/docs/manual/manual.text
 > buildroot-2023.02.6/docs/manual/manual.text:Buildroot 2023.02.6 manual generated on 2023-10-16 08:41:26 UTC from
 > buildroot-2023.02.7/docs/manual/manual.text:Buildroot ${BR2_VERSION%%-git*} manual generated on 2023-11-14
 > buildroot-2023.02.8/docs/manual/manual.text:Buildroot ${BR2_VERSION%%-git*} manual generated on 2023-12-04

 > We don't really NEED to strip the -git suffix; indeed, for a git tag, there
 > would be not -git suffix, while for any other commit there will be one
 > and we want to see it (e.g. in the nightly manual, or on a development
 > branch locally).

 > So just drop that to unbreak the version output.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > [yann.morin.1998@free.fr: explain why wew don't want to drop it]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
