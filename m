Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E145C32771
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 15:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32DB541D16;
	Sat, 24 Sep 2022 15:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32DB541D16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sY2b96E-IKUt; Sat, 24 Sep 2022 15:07:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9AE441D15;
	Sat, 24 Sep 2022 15:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9AE441D15
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 946DC1BF852
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 15:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FE0560BBF
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 15:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FE0560BBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I95GztZ3KI6H for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 15:07:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 684B360BF6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 684B360BF6
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 15:07:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 72CEAFF804;
 Sat, 24 Sep 2022 15:07:52 +0000 (UTC)
Date: Sat, 24 Sep 2022 17:07:51 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20220924170751.05e08f43@windsurf>
In-Reply-To: <20220729004658.1298414-1-joel@jms.id.au>
References: <20220729004658.1298414-1-joel@jms.id.au>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1664032072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8HSQxUNBAfAxDI2U8wINvkAtrQtDI9vCMqhul8lDg74=;
 b=LICM5inRNPZaVEM82WV+m+gC9pdHtIKbvnHpMiWSonX8/5WcVhra4lhYfulQvVA5N0XQur
 tIMmVf9iera/9zgAS3fQXmPnj3OgFTQ3fWCgudRmTOpgzf88Zrka3wT5Hvk/cpqt4ZDLgV
 1hUrSHwYFnR/0GCb3hPN3mkOr8sevPRyebWwJPol8A1TG6Tugeqn46zEUc9HInUuZd6HiE
 P8cfPOMDSjtFE+zmuZAk+QX5EdfAw3U7PDJtT4/HsJ3NsogUDX8dXLGH8mgpDwkwCe7S74
 LVQ6shqbLDPYq978qme06XskQeKZHRO2FM5+QB+aAKCdylyUIf+iXTHVPz4xyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LICM5inR
Subject: Re: [Buildroot] [PATCH] board/powerpc/pseries: Set x-vof on qemu
 command line
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
Cc: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Jul 2022 10:16:58 +0930
Joel Stanley <joel@jms.id.au> wrote:

> This uses a newer firmware implementation that is much faster at booting.
> It is supported as of Qemu 7.0.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  board/qemu/ppc64le-pseries/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
