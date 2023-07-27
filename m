Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D342AC04FDF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 10:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A59D41894;
	Thu, 27 Jul 2023 10:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A59D41894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OKrd48MLWutJ; Thu, 27 Jul 2023 10:48:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 576E541907;
	Thu, 27 Jul 2023 10:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 576E541907
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 197021BF40B
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F254041907
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 10:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F254041907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E70n8u28pi8Y for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 10:48:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 344A841887
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 10:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 344A841887
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6F931BF20A;
 Thu, 27 Jul 2023 10:48:33 +0000 (UTC)
Date: Thu, 27 Jul 2023 12:48:32 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230727124832.15bc9a6f@windsurf>
In-Reply-To: <20230726102652.2291658-1-james.hilliard1@gmail.com>
References: <20230726102652.2291658-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690454914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dNpn+uYyzQzEeuPe7vIks7P1x60SGlIOTKw9bYEsVes=;
 b=WXpn96J1/zDkw77o9d/9jR3fNBkNvoifSsJH8wT6ttelZQkBGie3GdoB/ATtl4ike1WRUf
 bg4ALpxOyVwfgvj/JpxXDGuj58RQySwiZIUgMagd4449HKWd7PnjzM8Muj7M1fgmmAu6H1
 iW9+ZmUiNbEpTzW7hzPrkbd7b5JxDfRMs7h1y5ozrCnIkmPwI7c6B1Tc9M+RCFPNlWbtHX
 m4+JqEC2ewojG//vZIiLrCJG3e01zf1bVJqEd3kZL7QPwRd93kMyw4lv92ye8mjUUz/9Cv
 Ws0vJeP514MHzNjUmrwmE4pTCm3sV5OvIK2nFbfMyLhO6CjZviZhwueJTtsGHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WXpn96J1
Subject: Re: [Buildroot] [PATCH v3 1/1] package/weston: bump to version
 12.0.1
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

On Wed, 26 Jul 2023 04:26:52 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop patch which is now upstream.
> 
> Drop no longer supported weston-launch/launcher-logind.
> 
> Drop no longer supported color-management-colord config option.
> 
> Remove duplicate backend-headless config option.
> 
> Add new libgbm requirement for renderer-gl.
> 
> Add new freerdp server requirement for backend-rdp.
> 
> Add support for new screenshare feature.
> 
> Add support for new rdp as backend default feature.
> 
> Add support for new pipewire backend feature.
> 
> Always enable libseat launcher.
> 
> Disable new unsupported vnc backend.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
>   - bump to version 12.0.1
>   - add new pipewire backend option
>   - disable unsupported backend vnc option
>   - remove deprecated logind launcher support
>   - unconditionally enable libseat launcher
> Changes v1 -> v2:
>   - bump to version 11.0.1
>   - propagate freerdp-server dependencies to weston-rdp
>   - ensure we have at least one launcher enabled
> ---
>  ...ncy-on-screenshooter-client-protocol.patch | 38 -------------
>  package/weston/Config.in                      | 22 +++++++-
>  package/weston/weston.hash                    |  6 +--
>  package/weston/weston.mk                      | 53 ++++++-------------
>  4 files changed, 39 insertions(+), 80 deletions(-)
>  delete mode 100644 package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch

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
