Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34661C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D322860A7D;
	Sat,  5 Nov 2022 22:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D322860A7D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzS_j3wp_ePs; Sat,  5 Nov 2022 22:05:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CBFD60AEB;
	Sat,  5 Nov 2022 22:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CBFD60AEB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FFB61BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28D70607F6
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28D70607F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zp3qlhMUC1gZ for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:05:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18B3B60A7D
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18B3B60A7D
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:05:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 33CAE100002;
 Sat,  5 Nov 2022 22:05:01 +0000 (UTC)
Date: Sat, 5 Nov 2022 23:04:59 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221105230459.2722f4ef@windsurf>
In-Reply-To: <20221105212343.353414-1-fontaine.fabrice@gmail.com>
References: <20221105212343.353414-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667685901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7lmRhSDG74T9DL0Dv1o8DcIuyZKbKvWmadKriJgMsE=;
 b=i2xLGWOUrMyL/CeNQKrQ+KNMDv4LmFlXo8TWNGZqOijuFupdRdjd9IUzj2l86tVPhNiWto
 Vo7zaa/WVdOpdf75nxqN3XjhfwFTw7CYl/TzqlA2YhyF4dJGtkQ8Pl65LpWeYJa5nzOUF5
 rNC0/pHW/RqD8/LgPJiSKI43TkBXDlImxQsxuYrEjxf5w+pqm8Ws+2Zxdb2rlziU+CgxvI
 soxvZxZUGngUpz6FrGpVLMYazMQOi7yQTUedwp4kAEATADb33BhoBsD50z691rEW+EN49I
 URF4gpx3zhqkWdrh+Gw7f96p83LWnalMQsacpG1H47iws7dQeTReUnZLK4MJzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i2xLGWOU
Subject: Re: [Buildroot] [PATCH v2,1/1] package/lxc: bump to version 5.0.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  5 Nov 2022 22:23:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> LXC 5.0 will be supported until June 2027 and our current LTS release,
> LXC 4.0 will now switch to a slower maintenance pace, only getting
> critical bugfixes and security updates.
> 
> We strongly recommend all LXC users to plan an upgrade to the 5.0
> branch.
> 
> - Switch to meson-package
> - Add an upstream patch to fix the following build failure with glibc
>   2.36 (unfortunately upstream doesn't plan to fix this for 4.x:
>   https://github.com/lxc/lxc/issues/4183 and patch is only working with
>   meson, not autotools)
> 
> https://discuss.linuxcontainers.org/t/lxc-5-0-lts-has-been-released
> https://discuss.linuxcontainers.org/t/lxc-5-0-1-has-been-released
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f77e2dc44c9a224f280e08089a890e85c302274f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Rebase patch so it applies cleanly on master

It's not great to have to apply such a big version bump in master right
now, but oh well, if it's needed to fix the build issue without
re-doing quite a bit of autoconf stuff, so be it. Applied to master.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
