Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEA3C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A790408EA;
	Wed, 27 Jul 2022 13:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A790408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2GwO8lxcyojC; Wed, 27 Jul 2022 13:25:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8521408DD;
	Wed, 27 Jul 2022 13:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8521408DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FE251BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A94C260C0A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A94C260C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRJg0XjqgADf for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:25:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43FE860BDD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 43FE860BDD
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:25:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ABC5E1C0006;
 Wed, 27 Jul 2022 13:25:34 +0000 (UTC)
Date: Wed, 27 Jul 2022 15:25:33 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220727152533.49408da8@windsurf>
In-Reply-To: <20220727101902.1087257-1-fontaine.fabrice@gmail.com>
References: <20220727101902.1087257-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658928335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r5vne1uWXQxHB2AIF9pFuBiKQ+wub23+AW3SdIQAlH8=;
 b=l0hW0DFut1xV8yrV7S92kJBFqnNp4QO4zmMYNcwCkUyE94qM5hKOe4aAEHnTyS05IZ6OLY
 lcw2UffjG8VHIpVDwpielAv4YGAqysmO375xQlzhD4q9LBtOmxAEkl7Um8MbC1rtVwkkeq
 +lhGjugEHlBCJ9YkxSN9wDdqYYu2EpHYEdV3oVUeCbteTby4+ztPa5Ppj7MZ+GISwWKz4+
 ZK46Kf1yEGCnDLBhdiEeMFnqsRieuV8IHRbwsEMgnscwH5zjBrAuEyW20F39YBg8R+uz6P
 IP4IMBrw9FOmLYgqeqIGqSI1lX721eYLwp9CkL3DRjXTzRWK3xFxZL6t6giVbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=l0hW0DFu
Subject: Re: [Buildroot] [PATCH 1/1] package/pulseaudio: improve dependency
 handling
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 12:19:02 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Use explicit options
> - speex is optional, not mandatory
> - lirc-tools and valgrind are optional dependencies (enabled by default)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/pulseaudio/Config.in     |  1 -
>  package/pulseaudio/pulseaudio.mk | 65 ++++++++++++++++++++++++++++----
>  2 files changed, 58 insertions(+), 8 deletions(-)

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
