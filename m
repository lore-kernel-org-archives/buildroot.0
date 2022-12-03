Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ACBC352A1
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 14:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E9518191E;
	Sat,  3 Dec 2022 14:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E9518191E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pzrdLqCMNcLw; Sat,  3 Dec 2022 14:47:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57931818DC;
	Sat,  3 Dec 2022 14:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57931818DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C77341BF36A
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93CC240866
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 14:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93CC240866
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LmTBjH4nC9Dk for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 14:47:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A1D14069B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A1D14069B
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 14:47:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1D923FF803;
 Sat,  3 Dec 2022 14:47:49 +0000 (UTC)
Date: Sat, 3 Dec 2022 15:47:46 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221203154746.2f8ced10@windsurf>
In-Reply-To: <20221202214451.415808-1-bernd.kuhls@t-online.de>
References: <20221202214451.415808-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670078870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RZyl3CAFRKLg/3woikHKPYbMwi+eqnpqhnnfARSPeRg=;
 b=V29faymrhdJ3i7DyY0DtGuJlfR+c8nEZogvq47BbvRjK4p6+Fyovxr2gHsQaHRY6TGJB2H
 bHOzIuUBB6SQeU+qtSChXMMS0mHEqPY+BLoCrCC2kZFOtfkh7qZzF8tYyoo9nuJ5wt3iAk
 u6ICxnPLu7J0Hn5P2whEPqpfRYTXmJjH2bxP1saCfMiB2qiEeR8Twg32pDa2CdajoKzfUS
 nRJhDRmJOv8j/BkdDa8hV9ZXbhj12ggMVCL9f96pin2YYwWLKDAaRPvYNROnDhjLL/7gl/
 E+QUiSwdSZNYYm75JGTabDIq0wxXerjcD8iL5mb2BJp/gnN1qgCF5VK8gDGFBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V29faymr
Subject: Re: [Buildroot] [PATCH/next 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 22.3.0
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

On Fri,  2 Dec 2022 22:44:51 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed xmvc support due to upstream removal:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=22.3&id=8cc766d8f7eac26b7c029a2fac1bdfdba4776c29
> 
> Removed comment concerning gallium-xlib due to upstream removal:
> https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=22.3&id=5bed3d4ad659c30cb0ef4b40172f1aab877ccc98
> 
> Rebased patch 0004 due to upstream commit:
> https://cgit.freedesktop.org/mesa/mesa/commit/src/util/macros.h?h=22.3&id=c0b891ecca2b92c9ef2945440c77f45345df3290
> 
> Please note that patch 0004 can be removed when buildroot toolchains are
> updated to uClibc 1.0.42:
> https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?h=v1.0.42&id=03fbd941e943976bb92cb392882c2ff7ec218704
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  Config.in.legacy                           |  8 ++++++++
>  package/mesa3d-headers/mesa3d-headers.mk   |  2 +-
>  package/mesa3d/0004-Fix-uClibc-build.patch |  4 ++--
>  package/mesa3d/Config.in                   | 18 ------------------
>  package/mesa3d/mesa3d.hash                 |  6 +++---
>  package/mesa3d/mesa3d.mk                   | 10 +---------
>  6 files changed, 15 insertions(+), 33 deletions(-)

This patch does not apply on the current next branch: the change on
package/mesa3d/0004-Fix-uClibc-build.patch causes a conflict. Could you
have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
