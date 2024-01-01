Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CCFC4706F
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 20:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CF560D88;
	Mon,  1 Jan 2024 20:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6CF560D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rsw-b6_2Gggx; Mon,  1 Jan 2024 20:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A6C860B74;
	Mon,  1 Jan 2024 20:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A6C860B74
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 806E51BF405
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5653C401CA
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 20:33:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5653C401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2tbhaeqbWuaL for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 20:33:37 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90E1A40104
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 20:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90E1A40104
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5732F40004;
 Mon,  1 Jan 2024 20:33:33 +0000 (UTC)
Date: Mon, 1 Jan 2024 21:33:32 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240101213332.681062eb@windsurf>
In-Reply-To: <20231229215306.23834-1-fontaine.fabrice@gmail.com>
References: <20231229215306.23834-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704141213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6/3AhaCZwk/kbSMEI7fwcqXQlRCOlWWu+fmdjI9pzg=;
 b=N+RbhP2JrPho18z+yJVW3qtNl12c67rSZJNdb0+UIvJTiNRA68KssRSPlYqLmqCQBAtlGV
 8ut5wXX6PmeJu4aRpynkAdoo5VsxML/FDiS4jnyFqt9raRYhZrUt6G0hl3q7i058xmV2t9
 g15v2L5DEjdTqQj5DO4AKz3AlkDo0w5g4xOK0sqckA+M4grJVPebGk8VvTGG9tzN91aeL9
 6LUgt8i4Np1yE5sSoaZG0ahTmD+KDzsw4tfVJ5+A2QxDB45VkPdrYmxGZnb68SiDxOetI8
 lnOUjt+adz9Jaq4RlvFmJ0TkRoKCX2kWR0PfOSYkfV2w42EIoRHhXZladz5AaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N+RbhP2J
Subject: Re: [Buildroot] [PATCH 1/1] package/nbd: bump to version 3.25
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 29 Dec 2023 22:53:06 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Switch site to github to get latest release
> 
> https://github.com/NetworkBlockDevice/nbd/releases/tag/nbd-3.25
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nbd/nbd.hash | 6 +-----
>  package/nbd/nbd.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 7 deletions(-)

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
