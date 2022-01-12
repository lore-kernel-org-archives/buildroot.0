Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E80C433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 10:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7073E83E9D;
	Wed, 12 Jan 2022 10:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUSqgyQVO4xi; Wed, 12 Jan 2022 10:37:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3FF683E75;
	Wed, 12 Jan 2022 10:37:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 199761BF831
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 10:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA251410B5
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 10:37:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZugK9lcn4vx for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 10:37:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1F7B428E3
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 10:37:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 6C8B4FF807;
 Wed, 12 Jan 2022 10:37:47 +0000 (UTC)
Date: Wed, 12 Jan 2022 11:37:46 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220112113746.2fe95d2c@windsurf>
In-Reply-To: <20220112012537.1362197-1-james.hilliard1@gmail.com>
References: <20220112012537.1362197-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gobject-introspection: bump to
 version 1.70.0
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

On Tue, 11 Jan 2022 18:25:37 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Rebase patches.
> 
> Backport a patch to fix a build error on latest meson.
> 
> giscanner/scannerlexer.l license hash change due to add float types:
> https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/60b0cf2fc2fdc74d13832d1fdde21cfdc813b84e
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../0001-disable-tests.patch                  |  10 +-
>  .../0002-Add-rpath-links-to-ccompiler.patch   |   6 +-
>  ...error-return-codes-from-ldd-wrapper.patch} |   7 +-
>  ...04-build-Avoid-the-doctemplates-hack.patch | 221 ++++++++++++++++++
>  .../gobject-introspection.hash                |   6 +-
>  .../gobject-introspection.mk                  |   2 +-
>  6 files changed, 238 insertions(+), 14 deletions(-)
>  rename package/gobject-introspection/{0003-ignore-error-return-codes-from-ldd-wrapper.patch => 0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch} (90%)
>  create mode 100644 package/gobject-introspection/0004-build-Avoid-the-doctemplates-hack.patch

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
