Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD211C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 14:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F064607AA;
	Sat, 22 Jan 2022 14:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id By-Znkf8jPwq; Sat, 22 Jan 2022 14:02:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAD1C6076A;
	Sat, 22 Jan 2022 14:02:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3D521BF3D5
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 14:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2DE7408D9
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 14:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vhx-i2ZpoYuo for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 14:02:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 910664089B
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 14:02:23 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7069FE000A;
 Sat, 22 Jan 2022 14:02:20 +0000 (UTC)
Date: Sat, 22 Jan 2022 15:02:19 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20220122150219.49061424@windsurf>
In-Reply-To: <20220117020553.749592-1-festevam@gmail.com>
References: <20220117020553.749592-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/mx6sx_udoo_neo: Select
 BR2_TARGET_UBOOT_NEEDS_OPENSSL
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

On Sun, 16 Jan 2022 23:05:53 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Select BR2_TARGET_UBOOT_NEEDS_OPENSSL to fix the following build
> error:
> 
> include/image.h:1178:12: fatal error: openssl/evp.h: No such file or directory
>  1178 | #  include <openssl/evp.h>
>       |            ^~~~~~~~~~~~~~~
> 
> Fixes:
> - https://gitlab.com/buildroot.org/buildroot/-/jobs/1970083907
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/mx6sx_udoo_neo_defconfig | 1 +
>  1 file changed, 1 insertion(+)

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
