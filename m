Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC520C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 11:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60614400E5;
	Sat, 13 Jul 2024 11:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DqrKDSOhos4J; Sat, 13 Jul 2024 11:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F34B40199
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F34B40199;
	Sat, 13 Jul 2024 11:12:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F39BD1BF4E4
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC4B441871
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pzw6d75cx1Pj for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 11:12:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B68D041870
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B68D041870
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B68D041870
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 11:12:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 430E4E0002;
 Sat, 13 Jul 2024 11:12:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sSafz-00CjOM-1d;
 Sat, 13 Jul 2024 13:12:27 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain <ju.o@free.fr>
References: <20240701193924.799937-1-ju.o@free.fr>
Date: Sat, 13 Jul 2024 13:12:27 +0200
In-Reply-To: <20240701193924.799937-1-ju.o@free.fr> (Julien Olivain's message
 of "Mon, 1 Jul 2024 21:39:24 +0200")
Message-ID: <87msmlfsv8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/xfsprogs: update Kconfig
 package homepage URL
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

>>>>> "Julien" == Julien Olivain <ju.o@free.fr> writes:

 > The old xfs homepage URL [1] seems defunct at the time of this commit.
 > The http URL redirects to https, the certificate expired on
 > 2024-01-26. If the certificate expiration date is ignored, the site
 > shows a "502 Bad Gateway" error.

 > The package README [2] advertise the homepage as [3].

 > This commit updates the URL to the new one.

 > [1] http://xfs.org
 > [2] https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/tree/README?h=v6.4.0#n12
 > [3] https://xfs.wiki.kernel.org

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed to 2024.02.x and 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
