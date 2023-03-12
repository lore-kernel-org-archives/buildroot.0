Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD09C6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFB2440281;
	Sun, 12 Mar 2023 22:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFB2440281
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxpH-TxQUN8c; Sun, 12 Mar 2023 22:07:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D3D4029F;
	Sun, 12 Mar 2023 22:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D3D4029F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12FF41BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1CF9408CD
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1CF9408CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnlWnj-j-hZw for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:06:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B56264061D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B56264061D
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:06:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BCEFD1C0002;
 Sun, 12 Mar 2023 22:06:40 +0000 (UTC)
Date: Sun, 12 Mar 2023 23:06:40 +0100
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20230312230640.1fef9a18@windsurf>
In-Reply-To: <20230306155252.476859-1-heiko.thiery@gmail.com>
References: <20230306155252.476859-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1678658801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zACh5HLcE8AGHosx/HhcejbcAcO7GEbKHl80Ypv7sHQ=;
 b=VCPkENjmc+157MqAlyct4wDOms8xt4oCDAShZAPk7nbt5s11uZb0tGIFEMaH4fCxr06eJ8
 bw6NKp3Sd6GhOEL2nwBPfAU6olz9PHz247scdr/uaSz0PjAp2O+lB4hKqbOibuNaPvkdTa
 +PBxldB8mPLdZWirMFwHOWVTLsbcmkZRjORVykesChKMHV8E98VQk2vNjNKe+2FbarXVh2
 CFoBOhiL280iIITYuLfQvkPoMqfl7N7U55gRSzNYKtlyP5H/xxiGKcis5I1LoiUzyX2PRF
 F/8y1hzsuBOuhPLeyoeBa/NOW33V/Hkz0guloP+dEaUuHZEHHvxovMBBwi/TuQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VCPkENjm
Subject: Re: [Buildroot] [PATCH 2/3] package/rauc: switch to meson build
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Andrey Yurovsky <yurovsky@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  6 Mar 2023 16:52:53 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/rauc/rauc.mk | 36 +++++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 17 deletions(-)

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
