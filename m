Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDC3C6FA83
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8BEF41A35;
	Fri, 23 Sep 2022 21:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8BEF41A35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jbwcMXJmVV_w; Fri, 23 Sep 2022 21:37:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6AF6410BD;
	Fri, 23 Sep 2022 21:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6AF6410BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97AFF1C2744
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6368C60E7B
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6368C60E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hQNVQ0vUjRsh for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:36:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A51D608D8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A51D608D8
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:36:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DC37EFF802;
 Fri, 23 Sep 2022 21:36:13 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:36:12 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220923233612.398a3d8f@windsurf>
In-Reply-To: <20220921213835.373860-1-fontaine.fabrice@gmail.com>
References: <20220921213835.373860-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663968974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UXPWGKPTR4VN00+ig43i5w+21LBA/RaS/DK//PttxMM=;
 b=MnFJ7wg0zxQmnlzDTCO7CzRyZ29ClkahjMd5qSt4tr+YsQuUhGnNmFby5/GceRqlPy5sar
 e+hGlWh9AlB4GGZjdCMzcOPqUsTZki1cSkF3kCnPpVB0tpbTyIX/5DwdMeJh34b4x3cFi7
 VvHTBvDclCv5/a4rH0qyWg3cmGLcSYv+C/j7XpxzquabAx/8hiDZaryK7hEPbd11rRf3xZ
 cdw2PiDzvk/FzzVA9JDEzcXNbSvDT+zNJlQJ7upf8jv0UiN+F/AtyItOprV2tUz95pmmoz
 bFhbE83OKy0/RYGclOUe2/MvrEEGIgGS0jUjHGKN0CUXutNIpZIydiW8ILsV8w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MnFJ7wg0
Subject: Re: [Buildroot] [PATCH 1/1] package/xtables-addons: bump to version
 3.21
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 21 Sep 2022 23:38:35 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> v3.21 (2022-06-13)
> 
>     xt_ECHO: support flowi6_to_flowi_common starting Linux 5.10.121
> 
> v3.20 (2022-04-10)
> 
>     Support for Linux 5.17
> 
> v3.19 (2022-02-01)
> 
>     bumped minimum supported kernel version from 4.15 to 4.16
>     xt_condition: make mutex per-net
>     xt_ipp2p: add IPv6 support
>     xt_ECHO, xt_TARPIT: do not build IPv6 parts if kernel has IPv6 build-time disabled
> 
> v3.18 (2021-03-11)
> 
>     xt_pknock: fix a build failure on ARM 32-bit
> 
> https://fossies.org/linux/privat/xtables-addons-3.21.tar.xz/xtables-addons-3.21/doc/changelog.rst
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b8f5f65cec1bd5c859f4a1fae4508900df362add
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/xtables-addons/xtables-addons.hash | 2 +-
>  package/xtables-addons/xtables-addons.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
