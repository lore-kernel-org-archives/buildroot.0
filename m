Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048EDC433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0D6360BF2;
	Sun, 30 Jan 2022 14:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQkmxldPLokI; Sun, 30 Jan 2022 14:00:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0408F60B45;
	Sun, 30 Jan 2022 14:00:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6169D1BF592
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4217760B45
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b7nRtn6ttWuC for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:00:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14AEE60B15
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:00:20 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 08B921C0004;
 Sun, 30 Jan 2022 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1643551218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c+jPjnk71GN+8PGktnthl3b+vRq5z5O48jTTP+ybXQI=;
 b=MNzjP6TvusdO6/CprFRowyckkkLV6U/lEKF+LniFnri9KpiQVB1aWJBTYwUKIddhYpp4UU
 ARxiGyiviGAmwMgNPbIlwThGSQPhbvk0UrBTJMtQ+wa2MuFkxgCvn6pNhwUoTRrc4mMVdP
 OoEWecYalHkeZI2EdZG6TIX+b/wzyVhqmk4aPNxqybpyoemY+IgRotLt+5H0861ixLLogA
 pQWI51ty31AHbRgv7ZG2i90XASWwhcrNH/GQ64dVqwIL4z/SSJ56EryZ46OO8KElo9g5ai
 pJQMXRL1zD/SimR+HvErzz67ITths3Hb+CMv9hXxG7xwK5nYXaJaCdK9gBiheA==
Date: Sun, 30 Jan 2022 15:00:17 +0100
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220130150017.5914a95a@windsurf>
In-Reply-To: <20220129224651.1282263-1-romain.naour@gmail.com>
References: <20220129224651.1282263-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] package/efl: bump to version 1.26.1
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

On Sat, 29 Jan 2022 23:46:47 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> This is a bug-fix release.
> 
> See: https://www.enlightenment.org/news/2022-01-03-efl-1.26.1
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/efl/efl.hash | 4 ++--
>  package/efl/efl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
