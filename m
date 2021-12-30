Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB90BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 14:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B209441507;
	Thu, 30 Dec 2021 14:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DS2aXF8uvv4S; Thu, 30 Dec 2021 14:08:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1594241505;
	Thu, 30 Dec 2021 14:08:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5F52F1BF2BC
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 355EF4017E
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 14:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uhsUWfzdCafm for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 14:07:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F2BC0414E5
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:07:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C3A39C0009;
 Thu, 30 Dec 2021 14:07:51 +0000 (UTC)
Date: Thu, 30 Dec 2021 15:07:50 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211230150750.2487ec4d@windsurf>
In-Reply-To: <20211230135621.2255847-1-romain.naour@gmail.com>
References: <20211230135621.2255847-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/7] package/supertux: bump to version 0.6.3
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

On Thu, 30 Dec 2021 14:56:15 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Remove upstream patch 0001-CMakeLists.txt-compile-squirrel-with-fPIC.patch
> 
> Add new glm dependency added by:
> 
> https://github.com/SuperTux/supertux/commit/7187e3f6d7ce2ccc25bcc96e9bee25c24416d545
> 
> Add new zlib dependency added by:
> 
> https://github.com/SuperTux/supertux/commit/100bc052bc693c2e4978fffe34c9aa4376f8f8c6
> 
> Update data/AUTHORS hash since several new assets has been added since
> version 0.6.2:
> 
> https://github.com/SuperTux/supertux/commit/ec5e2f52137bba2ea7533e020cd8bf4b85e6b904
> https://github.com/SuperTux/supertux/commit/1ff490d32206289c72d31c7f78bfeca2956e136b
> https://github.com/SuperTux/supertux/commit/14ac958c711837c6cbd1e9362768ababc38effc5
> https://github.com/SuperTux/supertux/commit/392320b79006ad1fb99b3f5dd9e771d9ba6a4668
> https://github.com/SuperTux/supertux/commit/2fd5ed445c8b00e4c50d0da456543d64015a4681
> https://github.com/SuperTux/supertux/commit/e45b5f7f8635e1749eee7a74a9fc9fde13d8344e
> 
> See:
> https://www.supertux.org/news/2021/12/23/0.6.3
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...Lists.txt-compile-squirrel-with-fPIC.patch | 35 -------------------
>  package/supertux/Config.in                    |  2 ++
>  package/supertux/supertux.hash                |  4 +--
>  package/supertux/supertux.mk                  |  6 ++--
>  4 files changed, 7 insertions(+), 40 deletions(-)
>  delete mode 100644 package/supertux/0001-CMakeLists.txt-compile-squirrel-with-fPIC.patch

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
