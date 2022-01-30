Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E21C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 13:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDF3560AC0;
	Sun, 30 Jan 2022 13:54:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3cFhNw3szDPX; Sun, 30 Jan 2022 13:54:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1990660E73;
	Sun, 30 Jan 2022 13:53:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 123141BF592
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 13:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F07F408BA
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 13:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-PbQ8VYcAIK for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 13:53:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2156140296
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 13:53:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 190B4240002;
 Sun, 30 Jan 2022 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643550809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKqGrIL7dsaNXNt/aSwEyTTU+2JOdz/pa8kesMOiypg=;
 b=BXE2L+U+uuko/0hQ9a1vjFVfZE3sf1If+nTo3RCZZ4i52cAytyZMXjMuTiBzhojqApGvub
 v4OzinTkgZ5J5THlZ7lMZkN4abXw1YsZcIhiFyNQlgqe6Qt3UFdaYERQ3KYxF1Wt8jkyiF
 ojX2caFWnpA38aIn8y+4NGx96WrwAZPuqj/GKxt5Idpek4nFgwECrtrMJVVjnkvJ94vi2e
 hHhMyj6efDLAmzZR8L0Lc7W9vK8brb5DEbh/aRwQbXtD7HoLRHRPqVYOkH8sK/v3vID2bY
 nHT/YVeNRbrc+Zn6T2dZvQjGoWJHCQdWO6+sLRzZx7cvYXn7eZHP9GeYHt9V+g==
Date: Sun, 30 Jan 2022 14:53:28 +0100
To: yegorslists--- via buildroot <buildroot@buildroot.org>
Message-ID: <20220130145328.4192c53e@windsurf>
In-Reply-To: <20220130105459.19339-1-yegorslists@googlemail.com>
References: <20220130105459.19339-1-yegorslists@googlemail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add entry for libqmi and
 libqrtr-glib to Yegor Yefremov
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, 30 Jan 2022 11:54:59 +0100
yegorslists--- via buildroot <buildroot@buildroot.org> wrote:

> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  DEVELOPERS | 2 ++
>  1 file changed, 2 insertions(+)

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
