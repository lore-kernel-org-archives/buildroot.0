Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4AFC433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 06:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 780A060FCB;
	Tue, 31 May 2022 06:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DLPMWXnTJlDq; Tue, 31 May 2022 06:54:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 967CC60FA1;
	Tue, 31 May 2022 06:54:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 967AA1BF368
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 06:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9413983F24
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 06:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hW98xn-knkaA for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 06:54:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2668D83264
 for <buildroot@buildroot.org>; Tue, 31 May 2022 06:54:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 175C440003;
 Tue, 31 May 2022 06:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1653980069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tmKlU3awHT0P395OBU1rlt+q85NESoglCc9gDW7ZBws=;
 b=FTB26IqX9gaBGPTQq1hPv7KuEKXpr5hzVdz2I+Raskfo7GFe5pAGK2xO9061MN62dXwgxL
 wDe7YgZ7jsBNeo+yWNR/IiR+b0LXtcU6ynM1DuwRn0ZpYX//h1WYmeUv9NACQiXGgfoD9d
 rS9+ey0IBlrN5NDFeb9OdyI+bxz18QgY0zHTQz3qTlPYOOQzbmDXctNDPtVdPc+w3tJHEF
 eArQYVvAiMBF/W6riZP4YiKoM5loTfT5YZJLZze69FLWn+5nPE4dNpqYPoOnUIt+ObaJa7
 1EVuAWmQNdlNqymq0GXd5JneqUcoGgRSs1F8fcQ30IDa+qinr2I2tdFEvA4aUQ==
Date: Tue, 31 May 2022 08:54:28 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220531085428.1c94bc71@windsurf>
In-Reply-To: <20220530220141.1445578-1-aperez@igalia.com>
References: <20220530220141.1445578-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: security bump to
 version 2.36.3
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

On Tue, 31 May 2022 01:01:41 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Bugfix release, mostly with build fixes, media playback improvements,
> an important fix for when using threaded rendering, and security patches
> for CVE-2022-26700, CVE-2022-26709, CVE-2022-26717, CVE-2022-26716, and
> CVE-2022-26719.
> 
> Release notes:
> 
>   https://webkitgtk.org/2022/05/28/webkitgtk2.36.3-released.html
>   https://webkitgtk.org/2022/05/18/webkitgtk2.36.2-released.html
> 
> Accompanying security advisory:
> 
>   https://webkitgtk.org/security/WSA-2022-0005.html
> 
> This also imports a build fix which has not made it into the release.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...en-cross-building-for-64-bit-ARM-htt.patch | 32 +++++++++++++++++++
>  package/webkitgtk/webkitgtk.hash              |  8 ++---
>  package/webkitgtk/webkitgtk.mk                |  2 +-
>  3 files changed, 37 insertions(+), 5 deletions(-)
>  create mode 100644 package/webkitgtk/0001-Build-failure-when-cross-building-for-64-bit-ARM-htt.patch

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
