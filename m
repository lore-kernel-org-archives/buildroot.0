Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6781BC433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 20:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18E1840D78;
	Sun,  5 Jun 2022 20:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MxnDS4wby7w2; Sun,  5 Jun 2022 20:26:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45CA240222;
	Sun,  5 Jun 2022 20:26:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D0711BF3A8
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C21D417DA
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 20:26:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x4bNqXel5qwU for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 20:26:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AA8141B75
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 20:26:53 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3032E200003;
 Sun,  5 Jun 2022 20:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654460811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OGlCuMn9m5YklrVCxp/HgRW/lLSLpGmmtGVG4oiybuQ=;
 b=Jg9afY7rKOXULHK54vcaXYX5mmjCppXc7B2BVJ7Pn9SDpyEh8aitf6cPdlLp5qOHp+v19k
 SEoDziJE5GQMFZwWvPCUs7gTyAfE5IXVaQ3D2eVazmRZ7Okqz7xBzFd6PDgUpLHd7zwb/k
 QQ3jTIOZnSlz1zkeXr+hstUO1+5BbE1cJ59cu5FhHy65T4denH7qfgrsXlGnBGMVfjPwS3
 uuiwoatuZ5uMccYnqsjyF4VBCdHBPJxjiXUqiQVK2UW3fukAOaeKWD60+Yd+ZdoYVnpwXW
 1BsRByuAdusfAGZsL+jO7xEq/U/usxCec+cbyN6YpynrjRH0a8ubhaAGGhpIkQ==
Date: Sun, 5 Jun 2022 22:26:50 +0200
To: Kyle Harding via buildroot <buildroot@buildroot.org>
Message-ID: <20220605222650.7662b0d9@windsurf>
In-Reply-To: <20220603134003.1419956-1-kyle@balena.io>
References: <20220603134003.1419956-1-kyle@balena.io>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.16.0
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
Cc: Kyle Harding <kyle@balena.io>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri,  3 Jun 2022 09:40:03 -0400
Kyle Harding via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Kyle Harding <kyle@balena.io>
> ---
>  package/unbound/unbound.hash | 4 ++--
>  package/unbound/unbound.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
