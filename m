Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3415BC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 16:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E46A4413A6;
	Wed,  5 Feb 2025 16:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YENW5AJ8gFdw; Wed,  5 Feb 2025 16:17:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E48C416DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E48C416DA;
	Wed,  5 Feb 2025 16:17:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7277512F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 16:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61D80610D9
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 16:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UzPsUVVtypuE for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 16:17:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33841610FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33841610FB
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33841610FB
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 16:17:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F1A1440EE;
 Wed,  5 Feb 2025 16:17:08 +0000 (UTC)
Date: Wed, 5 Feb 2025 17:17:07 +0100
To: Guillaume Chaye <guillaume.chaye@zeetim.com>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20250205171707.725b3989@windsurf>
In-Reply-To: <20250127091711.3877692-1-guillaume.chaye@zeetim.com>
References: <20250127091711.3877692-1-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeltdegvdejheegtefgueffgfelhfekvdefudevieeileetleeitdefgfeugffghfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepghhuihhllhgruhhmvgdrtghhrgihvgesiigvvghtihhmrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegvrhhitgdrlhgvrdgsihhhrghnrdguvghvsehfrhgvvgdrfhhr
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738772228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R/VuC41xTFu3qnOGQqCAm44jKQ6byu3PW7UulNEdy2s=;
 b=Jd+e0WgM1ipgor8jdwu2UA6NxoEHoRTTuGqHgBohbKJem+Yg9XTHAX/o9wb+Z+macaJFiE
 qG7e0YEOM/tC3PQURqNyh7iqPY3r7g43jMqL/8E7WyZ1dw4ucMir6OcTwRzG0fekuKB+zC
 xEYnWxiKvUAuhRX88pOPoNenXZYpMQ6Ur5J3NqX30+0uk9vr9ROccR8suDC3MWXX+2u/fX
 ZztFx5D34rkoF4+lKjwgxcf/T+HZLX1AY067c8A38vxgmhWYzZmdTMku5ClEy32aw2AtVP
 gtdCNDR5NjL/82gt3qE9wKAV1FYHMekJB2AUJhcdzskC2kVbw/6r9Y0yRb99/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jd+e0WgM
Subject: Re: [Buildroot] [PATCHv2 1/2] package/avahi: add missing dependency.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Mon, 27 Jan 2025 10:17:10 +0100
Guillaume Chaye <guillaume.chaye@zeetim.com> wrote:

> libavahi-client is not built if dbus is not installed.
> 
> Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
> ---
>  package/avahi/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/avahi/Config.in b/package/avahi/Config.in
> index 728bc4fdd1..ae53aaf156 100644
> --- a/package/avahi/Config.in
> +++ b/package/avahi/Config.in
> @@ -39,6 +39,7 @@ config BR2_PACKAGE_AVAHI_DAEMON
>  config BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
>  	bool
>  	default y if BR2_PACKAGE_DBUS
> +	select BR2_PACKAGE_DBUS

I understand your idea, but this is not what this option is about. This
option is not a typical visible option, with a prompt in menuconfig to
enable/disable avahi-client.

Instead it's a blind option that other packages can observe (but not
select!) to know if libavahi-client will be available or not.

And indeed, as soon as D-Bus is enabled,
BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT becomes true, telling other packages
that libavahi-client will be there.

So your PATCH 2/2 needs to select BR2_PACKAGE_AVAHI and
BR2_PACKAGE_DBUS, which will ensure libavahi-client gets built.

The problem with having an option is that we can't disable it. So if we
make it a visible option, and a user keeps it disabled... we have no
way to tell avahi to not build libavahi-client: as soon as D-Bus is
there, libavahi-client will be built.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
