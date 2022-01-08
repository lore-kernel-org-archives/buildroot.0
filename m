Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E61C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3A5A410B8;
	Sat,  8 Jan 2022 10:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u2E2KF6BlSFg; Sat,  8 Jan 2022 10:04:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64106409A3;
	Sat,  8 Jan 2022 10:04:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B3D31BF84C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38C3860A9F
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZ0ACPNFNIlC for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:04:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2082C60810
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:04:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3844924000F;
 Sat,  8 Jan 2022 10:04:16 +0000 (UTC)
Date: Sat, 8 Jan 2022 11:04:14 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Joseph Kogut <joseph.kogut@gmail.com>
Message-ID: <20220108110414.69f9fb65@windsurf>
In-Reply-To: <20200518051112.33798-1-joseph.kogut@gmail.com>
References: <20200515183353.4183611-1-joseph.kogut@gmail.com>
 <20200518051112.33798-1-joseph.kogut@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/alsa-lib: disable versioned
 symbols only when unsupported
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Joseph,

On Sun, 17 May 2020 22:11:12 -0700
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> Some libraries such as CEF depend on versioned symbols from alsa-lib,
> and the build fails during linking with versioning disabled.
> 
> Symbol versioning was originally disabled because some C libraries, such
> as uClibc, don't support versioned symbols.
> 
> This patch conditionally disables versioned symbols when unsupported by
> the toolchain, leaving them enabled otherwise.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  package/alsa-lib/alsa-lib.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Sorry for the delay. I have applied with a much more detailed commit
log, and also after enabling versioned symbols only with glibc
toolchains, as musl only has partial support for symbol versioning.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
