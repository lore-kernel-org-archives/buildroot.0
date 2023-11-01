Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6DDC4167B
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 113C4401AD;
	Wed,  1 Nov 2023 21:38:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 113C4401AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Te738-7xa8wb; Wed,  1 Nov 2023 21:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F22724313E;
	Wed,  1 Nov 2023 21:38:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F22724313E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B6771BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 146C684D6F
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 146C684D6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-RL9-PVZERX for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:38:20 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBE8D84D6B
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBE8D84D6B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C0561C0002;
 Wed,  1 Nov 2023 21:38:18 +0000 (UTC)
Date: Wed, 1 Nov 2023 22:38:17 +0100
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20231101223817.4c355102@windsurf>
In-Reply-To: <20231016200055.1175594-1-troglobit@gmail.com>
References: <20231016200055.1175594-1-troglobit@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698874698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N71yM4bwkZgSYYgLl7W579RIWXokW+LujSwcTht2LwY=;
 b=mJe5R1UokNVxbj0m3dOcPJEf8zzx3TLn5a8sMlHkejYR3Axafrvkhpg0qYc7zv0SN3eltq
 Y40LqzhhNEJB87Hierwq+R21iKYhDgtvnyJ2HOwSgys5R0in+ssd/YiO5DaGCbckIAOZzT
 54k2wneArL7guWKtr+L/EuDfera3TlEVk8ECaXgKW1Q9cd1rwgvV4kwV/fd3hhAkZmyZ7x
 bROi1mFYdho9o9NTGez/zfuebJw6Z/FnntsqHXMUCPl1iFwv3gaVNfHj1dQYmsnaIZjzkY
 +r4EFCG7ogVpfvFYzOQVITMp5W6U/f9QH6NJ1BPYFRZjjZyuh4PqisDzFyTq8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mJe5R1Uo
Subject: Re: [Buildroot] [PATCH 1/1] package/libnet: bump to v1.3
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
Cc: Joris Lijssens <joris.lijssens@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 16 Oct 2023 22:00:55 +0200
Joachim Wiberg <troglobit@gmail.com> wrote:

> Changes:
>  - Major upgrade, no API or ABI breaking changes (that we know of).
>    https://github.com/libnet/libnet/releases/tag/v1.3
> 
> Packaging:
>  - Verified builds on *all* test-pkg archs & toolchains
>  - Verified test-pkg also with ngrep, suricata, and mz
>  - Drop backported int64_t patch
>  - Disable doxygen (html docs) in build
>  - sha256sum of tarball now generated upstream
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  ...d-of-__int64_t-for-mingw-cross-build.patch | 31 -------------------
>  package/libnet/libnet.hash                    |  6 ++--
>  package/libnet/libnet.mk                      |  3 +-
>  3 files changed, 5 insertions(+), 35 deletions(-)
>  delete mode 100644 package/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-cross-build.patch

This change raised 3 check-package warnings:

WARNING: package/libnet/libnet.hash:2: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)
WARNING: package/libnet/libnet.mk:17: unconditional override of variable LIBNET_CONF_OPTS
WARNING: .checkpackageignore:712: ignored file package/libnet/0001-Use-standard-int64_t-instead-of-__int64_t-for-mingw-cross-build.patch is missing

I fixed then and applied to master. Thanks!

(Perhaps you can add "make check-package" do your usual testing of your
changes)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
