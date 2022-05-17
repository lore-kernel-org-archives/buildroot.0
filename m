Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F39FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 21:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D86058405D;
	Tue, 17 May 2022 21:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ceEQaZkUvXyT; Tue, 17 May 2022 21:03:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD5A88404D;
	Tue, 17 May 2022 21:03:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E9341BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B12340191
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:03:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWKthEitRwkE for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 21:03:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E18B400FB
 for <buildroot@buildroot.org>; Tue, 17 May 2022 21:03:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 65D8340003;
 Tue, 17 May 2022 21:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652821402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+LKW0C30UwrQCjauoLWaDs5C717aIptcX+8VDUUJ30=;
 b=UzKGwKdv37VxNr7jLB3aSeD68z1pT6dQcN48fCjwF38FnBEnuKEb65Fi37+AIV7czzOn3x
 tKEmZYUih/G4JVmnlC4480Z/+db0bvA1EU3g+5Oc12nC70HKOjgwjlcqk606n3GDgO/KbY
 KGPMbUSdZ+wMpJfKKoWMfOXzHMC8kXBQ7peqwrs7YjcW/d9X/7xuUjQjp15/7UZ7pf3o0e
 4wLXtSjesj5zaNQCDLbM1R1hK/aYjJVp0tmDUZMal3Bf1O/rsVIC0wCC/H0NGXQR0cNnew
 1VVeI2Pbgixeo9fl325nejye1Ichcg4mHpiuu42K9IGC4wpFtjuV/ITFTNpP/A==
Date: Tue, 17 May 2022 23:03:21 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220517230321.46c89a9d@windsurf>
In-Reply-To: <20220514220347.1288504-1-james.hilliard1@gmail.com>
References: <20220514220347.1288504-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pango: propagate reverse
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 14 May 2022 16:03:47 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> It appears some pango reverse dependencies aren't propagated properly.
> 
> Fixes:
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_PANGO
>   Depends on [n]: BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=n]
>   Selected by [y]:
>   - BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML [=y] && BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BAD [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y]
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in  | 2 ++
>  package/gstreamer1/gst1-plugins-base/Config.in | 3 +++
>  package/weston/Config.in                       | 1 +
>  3 files changed, 6 insertions(+)

I've applied to master, but after adding the necessary updates to the
Config.in comments, which you had also forgotten in this patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
