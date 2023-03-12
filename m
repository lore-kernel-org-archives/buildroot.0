Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CAFC6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 18:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A8DA60B2E;
	Sun, 12 Mar 2023 18:01:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A8DA60B2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7xckmnJukzop; Sun, 12 Mar 2023 18:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B4CB60B32;
	Sun, 12 Mar 2023 18:01:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B4CB60B32
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE9EA1BF20D
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 18:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5AB480DB6
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 18:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5AB480DB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ADVXEcylE1J5 for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 18:01:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A472380C21
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A472380C21
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 18:01:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9A3B51BF205;
 Sun, 12 Mar 2023 18:01:31 +0000 (UTC)
Date: Sun, 12 Mar 2023 19:01:30 +0100
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230312190130.27668e0d@windsurf>
In-Reply-To: <20230228202720.6762-1-ju.o@free.fr>
References: <20230228202720.6762-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678644092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bl463n+hzia/pxtXKzFMdCOzCIiyB7+RaYTwShWGKGo=;
 b=NX/2Mm7TV6n6dgr40nsRUamDU4XkmhhzmI2+7ia8FMc+rLlCqQKDqxfvIsJKy2LexskbWp
 4Bpxqyh09fR1E1NvOD2msDZvyeZq13Y6l2ouBf7lwDjL980pjJmF9DAWZukfBQxLmpSOLg
 fimAc2T0ZAj4mnSryblSt0z5DQRk2OoWi8r8Ox6OQHMUic9PaQF7V6IafEVlFt8PWDQHUn
 T16hgi+4MxJlA6ZpYVhGoClV8cd5ML81C0wMbOubgdqTaZPp2PcPMfFtMTWc+wcDJDz/Tl
 Rq4VXf72Sq5J7H1UUQn4+T0BFtrh0OaM5r9ZzlzFXl0L55GFTWN3ZGHAWSMnVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NX/2Mm7T
Subject: Re: [Buildroot] [PATCH next 1/1] package/openmpi: bump to version
 4.1.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 28 Feb 2023 21:27:20 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log, see:
> https://github.com/open-mpi/ompi/blob/v4.1.5/NEWS#L61
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch next at commit b793f3a with commands:

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
