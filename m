Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51449C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CCE7420E3;
	Mon,  6 Nov 2023 21:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CCE7420E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1dOPzHVQ2Ja; Mon,  6 Nov 2023 21:44:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42C1B41805;
	Mon,  6 Nov 2023 21:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42C1B41805
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA10B1BF3A6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 806BB401CC
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 806BB401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BEK6jjubU2qg for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:44:31 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A792415BD
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A792415BD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6699CE0005;
 Mon,  6 Nov 2023 21:44:29 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:44:28 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106224428.032eb873@windsurf>
In-Reply-To: <20231105182255.477909-1-fontaine.fabrice@gmail.com>
References: <20231105182255.477909-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699307069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1kBchQxa7Y8mMfHQt+Sp4y9J1WmuVvxpi5P6y3qa75c=;
 b=Jt8XzY0zzLI7IszhTGhIGU0BgS24mx+ZWjDjSjm/p84j/8T1RYVZ7yn/yq0gSdCN9/6Y0X
 1vvmYFia8GbfyyDVcMvRBqeAnmVJ+i/DNveclyRgu5nEmHXLVVJ0NLH8MdiLgOG2gYiCq8
 b831YDl+MILQYvvFFS6kwoYz5+LsYrtvdzs8/5c3qV+ADIvOnNR3DIaJnFG5Io6YGF+gYN
 FZVoOnVpkkfNUv6Qs077Ac9FO7sk/NExenmdmSH36lkj9QG50ATBsHtjBFlmNl15cPUuYR
 tlZopVZdYn69f90AFNvCm7gVeNpZ1fXjGa40f7ow4Ij2ZWZ167x7HY3qxiC2pQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Jt8XzY0z
Subject: Re: [Buildroot] [PATCH v2,1/1] package/vde2: bump to version 2.3.3
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

On Sun,  5 Nov 2023 19:22:55 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch to github to get latest release
> - Drop first and second patches (already in version)
> - Drop third patch (not needed anymore)
> - Drop BSD-3-Clause and COPYING.slirpvde (slirpvde removed with
>   https://github.com/virtualsquare/vde-2/commit/eda0a1bc1d14061588459676fe6f0a048b7dbd1c
>   https://github.com/virtualsquare/vde-2/commit/14e1c9e06f4dbdddc6fe4e85fc72a1d583b049ad)
> - python removed with
>   https://github.com/virtualsquare/vde-2/commit/2c57c25075fa2d351b8f181d2764af61c4e47de0
> - kernel switch removed with
>   https://github.com/virtualsquare/vde-2/commit/b196ecd5b774f1c85041ce6d2334702911cbd8f3
> - parallel build has been fixed with
>   https://github.com/virtualsquare/vde-2/commit/7dd9ed46d5dca125ca45d679ac9f3acbfb0f9300
> - openssl has been replaced by wolfssl with
>   https://github.com/virtualsquare/vde-2/commit/8599321526d0a31925fe55cabbe132b752cb268a
> 
> https://github.com/virtualsquare/vde-2/releases/tag/v2.3.3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Replace openssl by wolfssl

Thanks a LOT for the detailed commit log. This is very good! Applied,
of course!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
