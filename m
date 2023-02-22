Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D231C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 21:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F153613BA;
	Wed, 22 Feb 2023 21:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F153613BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6IFllmgaqEbp; Wed, 22 Feb 2023 21:03:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68CF26139A;
	Wed, 22 Feb 2023 21:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68CF26139A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 886471BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 21:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61096613B8
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 21:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61096613B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tE9F_7eZlh6W for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 21:03:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F81C61395
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F81C61395
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 21:03:52 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6B2321C0007;
 Wed, 22 Feb 2023 21:03:50 +0000 (UTC)
Date: Wed, 22 Feb 2023 22:03:49 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230222220349.3cb1cbc5@windsurf>
In-Reply-To: <20230101143232.187601-1-yann.morin.1998@free.fr>
References: <20230101143232.187601-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677099830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rapB4iWlSG4+cOMjz+wPEGlqO+Ygm5Ivm/buGxCMEis=;
 b=Fm0p+LzVBHERdukfXUc/YJMCHNInE8F+LaetMF119STBTxGFN7Mw52DblzFpgIjt0Yf1Jv
 38+DZqgJdNiqpn5Qaz9RVHhHXINJsxypAxaYbf5LD1ZvXudpVpUlMaZr+6H3gby/fiSQfR
 37H50R7GfqUhvCJc2pFiGLeltJbkjm8AGVH0rg5Z/W/aMIiQT2Qo0JGR3+AUV8IjZyo0Bj
 4ok7a+gLCtP/hl2spspgLy98iFFOEp4KGeNMi3GlTfSW1GgHo13FWCPG/pWG6ZfJitCFwx
 0WUe5kr65on5FlY4ymN/fOm7NJw0wWQZYCmHwoL2hODi2ayMDS0FhJVTG4yF5Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fm0p+LzV
Subject: Re: [Buildroot] [PATCH] package/qemu: add option to install blobs
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

On Sun,  1 Jan 2023 15:32:32 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Binary blobs are BIOS of some sorts for the various machines emulated
> by QEMU. There is no option to individually install blobs; it's an
> all-or-nothing option.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/qemu/Config.in | 11 +++++++++++
>  package/qemu/qemu.mk   |  6 ++++++
>  2 files changed, 17 insertions(+)

Applied to next, thanks. Should we install them unconditionally in the
host variant?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
