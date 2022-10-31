Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF530FA3740
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6ECC60BC9;
	Mon, 31 Oct 2022 12:20:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6ECC60BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mtMtUNiMszZf; Mon, 31 Oct 2022 12:20:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C71D360BBC;
	Mon, 31 Oct 2022 12:20:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C71D360BBC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CC001BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC567607F4
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC567607F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MRVWfnMnUnvZ for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:20:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1D54605AB
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1D54605AB
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:20:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EE270FF806;
 Mon, 31 Oct 2022 12:20:17 +0000 (UTC)
Date: Mon, 31 Oct 2022 13:20:16 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221031132016.5c6c03ba@windsurf>
In-Reply-To: <20220918162850.25720-1-fontaine.fabrice@gmail.com>
References: <20220918162850.25720-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667218818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8yGxf7oQjxCesCzSPjSydlpPSp46I50MC3fvIuO+UA=;
 b=dI/k5LZqyii9sDsKILYyeFvYozaM/uBhCv4O2y9H2vTu2hlsjHsPC9leqaRh9xjVZdlqY+
 aM5PJJgVqjgKZZ28V0129BKvBpMyHNxUi/IfAH9ABpOKcdqveZXLK67xw5UQhVtNJldIXN
 xssSTyL8F5oxfUod9JQ+YYL0wDhcX/sRYf7YCWoj9Dav5wvBYo4kH9Ccf/h36TDBUjroXS
 I7KpB8eEGFtYj5h+UTLFhshyBT6vIbpNuLbqdcKIigDtjPaLXcs6GClvhsXJRyfzZxp4JN
 1VjzchT2FlvB2fB4czGKFHkMyxELlqMhRU0cLX4Cd4xgR7/CUGKnwQtQ3nh/iQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dI/k5LZq
Subject: Re: [Buildroot] [PATCH 1/1] utils/genrandconfig: handle a10disp
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

On Sun, 18 Sep 2022 18:28:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> a10disp will raise the following build failure with a mainline kernel:
> 
> cp: cannot stat '/home/autobuild/autobuild/instance-0/output-1/build/linux-5.17.15/include/video/sunxi_disp_ioctl.h': No such file or directory
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/1f2607d6adece4d5dfe17fbdb032a2d228fc030f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  utils/genrandconfig | 2 ++
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
