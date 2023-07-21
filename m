Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E9AC001DC
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A2F441864;
	Fri, 21 Jul 2023 21:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A2F441864
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KziThoWYqV1k; Fri, 21 Jul 2023 21:35:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 953BB40639;
	Fri, 21 Jul 2023 21:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 953BB40639
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5668A1BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C2E360D4D
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C2E360D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c_BIXC55uuSe for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:35:35 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E098960C1D
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E098960C1D
Received: by mail.gandi.net (Postfix) with ESMTPSA id A559560002;
 Fri, 21 Jul 2023 21:35:32 +0000 (UTC)
Date: Fri, 21 Jul 2023 23:35:31 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230721233531.69a5799c@windsurf>
In-Reply-To: <20230717122915.3548507-1-bernd@kuhls.net>
References: <20230717122915.3548507-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689975332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rxy6XHmQ83Y1WGr0PAvzb5cPCe8Xas5XH9eZSOrecD8=;
 b=eOQoGOK/31UFs4v6wTMnJfbtq8HvvF0puslVa3vYIvkQPjf2iN6ngE2SRJZ/gX8aFznEps
 YROsx88tf7EL/aWR6xtI2H7pDY5VlFuEILG9eQxRkVprWANOvy158WsT6teHAVZfXUDVZp
 QO6low3l9bBCy/UwDn6unoVohjrvaC+9WpxgU3VOZkqc/5EVY8ihQ6WEXPQRxqttkozhwv
 rvWxCjuky19j+H3y1lUAbnzapgilKJqm9feqfQVRfiA4FK+e/3Tmz+tv4rtJ6wfgUYxZp5
 fs2Qfb+6cIgEn0MtM+5vDuyrp6DdYtBQBW43ONEFNOXYucw7jEzI1Ggg6NjhAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eOQoGOK/
Subject: Re: [Buildroot] [PATCH 1/1] package/transmission: fix gtk
 dependencies
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

On Mon, 17 Jul 2023 14:29:15 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Buildroot commit 80793107a65d95f8dfd0317a726d3a737c78ef67 forgot to add
> packages needed for gtk support:
> https://github.com/transmission/transmission/blob/main/CMakeLists.txt#L40
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/transmission/Config.in       | 2 ++
>  package/transmission/transmission.mk | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/transmission/Config.in b/package/transmission/Config.in
> index 84bd85eeff..d6567c6452 100644
> --- a/package/transmission/Config.in
> +++ b/package/transmission/Config.in
> @@ -38,6 +38,8 @@ config BR2_PACKAGE_TRANSMISSION_DAEMON
>  config BR2_PACKAGE_TRANSMISSION_GTK
>  	bool "transmission-gtk"
>  	depends on BR2_PACKAGE_LIBGTK3 && BR2_SYSTEM_ENABLE_NLS
> +	select BR2_PACKAGE_GLIBMM
> +	select BR2_PACKAGE_GTKMM3

This option has:

	depends on BR2_TOOLCHAIN_HAS_SYNC_4
	depends on !BR2_nios2

which you did not propagate. There's also tons of other dependencies,
which indeed are not strictly needed as they are already carried by the
top-level transmission option, but if they change, we will forget that
they are also needed because of the dependency on glibmm and gtkmm3.

However, one thing bothers me more than that: you select
BR2_PACKAGE_GLIBMM, but BR2_PACKAGE_GTKMM3 selects
BR2_PACKAGE_GLIBMM2_66, so we will end up with two versions of glibmm.
Are both really used?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
