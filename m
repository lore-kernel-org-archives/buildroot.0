Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF345CA0FF7
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 10:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6901A60E73;
	Sat,  2 Sep 2023 10:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6901A60E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GTTdmJPg58d3; Sat,  2 Sep 2023 10:02:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C10F960C16;
	Sat,  2 Sep 2023 10:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C10F960C16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2AA81BF419
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88D244011D
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 10:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88D244011D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xgNVl6CZGJdm for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 10:02:06 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81A404010C
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 10:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81A404010C
Received: by mail.gandi.net (Postfix) with ESMTPSA id E168CE0008;
 Sat,  2 Sep 2023 10:02:03 +0000 (UTC)
Date: Sat, 2 Sep 2023 12:02:02 +0200
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230902120202.53573737@windsurf>
In-Reply-To: <20230830195446.3958486-3-aduskett@gmail.com>
References: <20230830195446.3958486-1-aduskett@gmail.com>
 <20230830195446.3958486-3-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693648925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vEglCtBKFAl84I15Gdijs8UqVC5rYiNJqxWKONeQYvM=;
 b=HquolwLTyNiVVCFGilWb+gSvwrua/7p8h4jE3svWnAvnpqXJRn85VoDa2ugIpkeF4JUuVX
 7h2W/W5gd3swG87PcPG6OSlZPAWdXXUEQkgnLRvVAsY9ZEmBKCe7Vh1gfATkn80rw5Vs9d
 svU67yzdCfs3ugk6XrD8GsORzEcRSbUBtbR+Q7cTJsYGhRV24q9/DvfkaArXAp3YIcrM7Q
 Is1ql5nxR8kV9LZkzPLp6z+Kk5Ab6CLNjy0yZykGpjdfoQOG2gTwJhhAWdXMPbwgIeXXiF
 Y1CtYL/8uJ+SbiLrhWp0xcMoMPu+X11lRwxsoJBUbv2CfIc8AkvR/SvE4X/uqw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HquolwLT
Subject: Re: [Buildroot] [PATCH/next 3/7] package/vulkan-tools: new package
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Samuel Martin <s.martin49@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 30 Aug 2023 13:54:42 -0600
Adam Duskett <aduskett@gmail.com> wrote:

> Use $(VULKAN_HEADERS_VERSION) for VULKAN_TOOLS_VERSION as the vulkan packages
> need to all be the same version.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/vulkan-tools/Config.in         | 17 ++++++++++
>  package/vulkan-tools/vulkan-tools.hash |  3 ++
>  package/vulkan-tools/vulkan-tools.mk   | 47 ++++++++++++++++++++++++++
>  5 files changed, 69 insertions(+)
>  create mode 100644 package/vulkan-tools/Config.in
>  create mode 100644 package/vulkan-tools/vulkan-tools.hash
>  create mode 100644 package/vulkan-tools/vulkan-tools.mk

Applied to next, thanks. I was initially surprised that only vulkaninfo
gets installed but indeed you disable everything else (cube, icd, etc.).

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
