Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE37C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 19:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C02736FC61;
	Thu, 13 Jan 2022 19:45:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tj14e-F-Xygf; Thu, 13 Jan 2022 19:45:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2112460782;
	Thu, 13 Jan 2022 19:44:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19C011BF5B3
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0860A6FC5F
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 19:44:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nvtq_XuYoXT1 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 19:44:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07DC66059D
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 19:44:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E2B8940026;
 Thu, 13 Jan 2022 19:44:51 +0000 (UTC)
Date: Thu, 13 Jan 2022 20:44:51 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220113204451.23849f67@windsurf>
In-Reply-To: <20220112203939.606775-1-james.hilliard1@gmail.com>
References: <20220112203939.606775-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: disable broken
 qmake sysrootify
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
Cc: Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Wed, 12 Jan 2022 13:39:39 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Currently the qmake gcc sysrootify path logic causes issues with
> per-package directories, disable automatic gcc sysroot for qt5base
> install and override all qt.conf paths manually to point to their
> correct locations.
> 
> Redirect HostData to STAGING_DIR as mkspecs need to be available there
> instead of the HOST_DIR for cross compilation to work.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/qt5/qt5base/qt.conf.in | 18 +++++++++++++++---
>  package/qt5/qt5base/qt5base.mk |  2 ++
>  2 files changed, 17 insertions(+), 3 deletions(-)

Do you have a bit more details on what this changing, i.e how this is
making things better?

I have no doubt that it can make things better, but it would be useful
in the commit log to have extra details on what specific
details/aspects it is fixing/improving.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
