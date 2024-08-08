Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185AAC3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 12:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B51B360A92;
	Thu,  8 Aug 2024 12:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b28znQb_w73z; Thu,  8 Aug 2024 12:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C467160A81
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C467160A81;
	Thu,  8 Aug 2024 12:02:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 306361BF2AB
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 12:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B34860A81
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 12:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jg_c3NZ32l8p for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 12:02:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 80F4A605E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80F4A605E1
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80F4A605E1
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 12:02:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5573A40002;
 Thu,  8 Aug 2024 12:02:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sc1qp-007Uzj-1s;
 Thu, 08 Aug 2024 14:02:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240712220254.DF24A8624E@busybox.osuosl.org>
Date: Thu, 08 Aug 2024 14:02:39 +0200
In-Reply-To: <20240712220254.DF24A8624E@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sat, 13 Jul 2024 00:02:39 +0200")
Message-ID: <87h6bvmdcw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [git commit] package/uvw: bump to 3.4.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=c54134bf6914593caaa9ed4aa11cbe3a17c59eca
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This allows uvw to be again in sync with the libuv package, following
 > the bump of libuv to v1.48 in commit
 > bd2f99246c253739a3d44d8345f2fbb5362b3fb5 ("package/libuv: security
 > bump to version 1.48")

 > The hash of the license file has changed due to a copyright year
 > update.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
