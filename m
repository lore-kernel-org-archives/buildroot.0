Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376EBCCA480
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 12:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC7CC61288;
	Wed, 20 Jul 2022 12:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC7CC61288
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hmE33hgojzOy; Wed, 20 Jul 2022 12:48:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9C1361263;
	Wed, 20 Jul 2022 12:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9C1361263
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2587B1BF5A8
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 12:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD57561263
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 12:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD57561263
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sziRcQk6htcO for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 12:48:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61FF261261
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61FF261261
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 12:48:40 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2D40124000B;
 Wed, 20 Jul 2022 12:48:37 +0000 (UTC)
Date: Wed, 20 Jul 2022 14:48:36 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220720144836.3cf998c0@windsurf>
In-Reply-To: <20220705064119.1041728-1-bernd.kuhls@t-online.de>
References: <20220705064119.1041728-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658321317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=quf8uHGjsDaebV1+XkZVATIWmvRB/yT+qg5tWU1f/wo=;
 b=mkRq/Z3E1TsTz50MAuYnipwe5umZXyS8Kf606pIByE4qYMIsDPGqVda/84l0xamgKB73ph
 v6NsRSjbKEeyGvEHko+0gjaPOR3E34AkEpAanwIoC+RFED4hrEZVG2j5xldIY9xLGSOS0m
 TbySAaA/tU7PltVDr8qwlWWSRM1hvqHftR6zmHDax5hFoZLrPc7B0iA42AOtddR7NNPYrO
 PRTNM4nQWRsdU4ArJZK8vBD2/qh57szGbgfYst8H8kPnVLMTcFK5oVISOpLmgG3lNhDsYb
 DoGknTd6gj0cQu1+mvfRfdXUZxSZpU+mb+I8FI++HIRJUh7TrZPQqxdTurKEbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mkRq/Z3E
Subject: Re: [Buildroot] [PATCH 1/1] package/libpsl: require libiconv if
 !BR2_ENABLE_LOCALE
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  5 Jul 2022 08:41:19 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes build error
> 
> Checking for function "iconv_open" : NO
> Header <iconv.h> has symbol "iconv_open" : NO
> 
> output/build/libpsl-0.21.1/meson.build:101:4:
>  ERROR: Problem encountered: iconv implementation not found
> 
> using this defconfig:
> 
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_PACKAGE_LIBPSL=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libpsl/Config.in | 1 +
>  package/libpsl/libpsl.mk | 4 ++++
>  2 files changed, 5 insertions(+)

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
