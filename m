Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37C2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 20:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75F7440196;
	Thu, 13 Jan 2022 20:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x52Dx2546x5I; Thu, 13 Jan 2022 20:39:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84D2340125;
	Thu, 13 Jan 2022 20:39:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 563B71BF3ED
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 524FF6FB7D
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ICGeNzmupTr5 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 20:38:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5794760D9C
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 20:38:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9EA4F60002;
 Thu, 13 Jan 2022 20:38:56 +0000 (UTC)
Date: Thu, 13 Jan 2022 21:38:55 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220113213855.24e00974@windsurf>
In-Reply-To: <20220104205213.1367539-1-james.hilliard1@gmail.com>
References: <20220104205213.1367539-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: use backported
 ICU patch from upstream
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
 =?UTF-8?B?R2HDq2w=?= Portay <gael.portay@collabora.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  4 Jan 2022 13:52:13 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Use backported upstream ICU fix instead of adapted downstream patch.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...ion-ICU-68.1-no-longer-exposes-FALS.patch} | 35 +++++++++++++++----
>  1 file changed, 28 insertions(+), 7 deletions(-)
>  rename package/qt5/qt5webkit/{0001-Fix-ICU-related-compile-failures-from-capital-bool-d.patch => 0001-WinCairo-PlayStation-ICU-68.1-no-longer-exposes-FALS.patch} (86%)

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
