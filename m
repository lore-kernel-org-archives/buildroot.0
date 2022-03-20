Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D216DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 17:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D5AE817AA;
	Sun, 20 Mar 2022 17:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GL3_G90YDE-V; Sun, 20 Mar 2022 17:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B12D281770;
	Sun, 20 Mar 2022 17:08:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 157AC1BF983
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FF9981308
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 17:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2PtR9P-JZngB for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 17:06:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4910812A0
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 17:06:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 70657FF807;
 Sun, 20 Mar 2022 17:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647796012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=miWw8Q/XgKJ9eom0DXr+4oBOSvIQlDK5Ip9Yb6VCL2Y=;
 b=gUEoZlr+TKjUgO6fiwdafwZMwkUwcJsIiDKI4wKzu0KJJ1TyPTMpg6nVKBOuDELyCljAxp
 XhFhdb5PGwMDw08jHEC0uLlmo7Ixqi4FUUkeJjT2tqeHek5uDBN95fDxDL4SWpzM9KpSu5
 scItEjkYxXF3J/ctiGhp7S5ZV4AAkbPM9F26xXhKGNHK7UF/cxb0h3LFW6Rom7hIfTu4NU
 3rkgbQoQ0lYuTAF33TR1F/BaU4EgU4NBLkVnaE3yYlTzr9o99MSXrv0NKDR086ImqiRhjB
 m2G5E+hgtJoolbtJCBfNGEsLzjRpIsVZZGwzhqktbWLD/TWllPrBsS7jXCuWCQ==
Date: Sun, 20 Mar 2022 18:03:53 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220320180353.65a64989@windsurf>
In-Reply-To: <20220320123354.443457-1-bernd.kuhls@t-online.de>
References: <20220320123354.443457-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to
 6.4.29
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

On Sun, 20 Mar 2022 13:33:54 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Updated license hash due to OpenBSD-related upstream commit:
> https://sourceforge.net/p/fetchmail/git/ci/c4419bdd2557321b268f6e105d511923b9a35936/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/fetchmail/fetchmail.hash | 6 +++---
>  package/fetchmail/fetchmail.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
