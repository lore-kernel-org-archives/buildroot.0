Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E23BC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EEE6606C0;
	Mon,  1 Aug 2022 20:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EEE6606C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7gFzUkTOsND; Mon,  1 Aug 2022 20:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C00906059D;
	Mon,  1 Aug 2022 20:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C00906059D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE8D51BF25B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AF3A408D0
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AF3A408D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D1c1iutAvfsl for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:40:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4572F408CF
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4572F408CF
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:40:58 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E9C661BF209;
 Mon,  1 Aug 2022 20:40:55 +0000 (UTC)
Date: Mon, 1 Aug 2022 22:40:54 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220801224054.740d6ace@windsurf>
In-Reply-To: <20220731112542.92591-1-bernd.kuhls@t-online.de>
References: <20220731112542.92591-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659386456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2opRchjW+41h893hgFR5CwajEka/fZuwLfekkevzblY=;
 b=bdIeKkHSbxhMe5tieOBb2+FCY8RV5VME6KwHmBVwmk0axt+HkWZVhfFavauQ4tzpDURb4O
 OLfx/6fVbeKTZ0U7FMptzA4DXippJAUpPYv9JVilYRI8+ps+CeTIijW1l2gSdjHGgrYCwp
 GdF2bPE6VO+iAGysBRTKA/M5ZxpVKoZ4Wpq7L1fdHqYqVYO/akIaQBxzxnMndeivAkEbMx
 PjG2mTAYTHpbNWGUuEAPoYcE/z6lpvEMN0tWUmtvBNPSf5QlsTD0rqXHJwPWr739svAZrO
 jRYgH3wGMkrdx3fzUtDcvBlsnqZxQvNpGmY8EOXqBZkvgSUME3w95KhfA3kqOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=bdIeKkHS
Subject: Re: [Buildroot] [PATCH 1/2] package/clamav: ignore CVE-2016-1405
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

On Sun, 31 Jul 2022 13:25:41 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/clamav/clamav.mk | 2 ++
>  1 file changed, 2 insertions(+)

Both applied. I am not sure why your PATCH 1/2 was marked as "Handled
Elsewhere" in patchwork, this looks odd, we rarely use this state (if
ever?), so I assume this was a mistake.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
