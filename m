Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6528C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33A414240F;
	Sat, 23 Jul 2022 16:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33A414240F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElNG1FEFQ84w; Sat, 23 Jul 2022 16:32:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F363741A10;
	Sat, 23 Jul 2022 16:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F363741A10
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ABCFF1BF271
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D51360BFB
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D51360BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OjJlDEp8Gc5N for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:32:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11B6060B59
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11B6060B59
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:32:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 94BD2240006;
 Sat, 23 Jul 2022 16:32:15 +0000 (UTC)
Date: Sat, 23 Jul 2022 18:32:14 +0200
To: Min Xu <xuminready@gmail.com>
Message-ID: <20220723183214.5d1a74e6@windsurf>
In-Reply-To: <20220519074438.462-1-xuminready@gmail.com>
References: <20220519074438.462-1-xuminready@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658593936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DBLqOey6l5GX24FATRJNeYPcqlSo1q/O9yUtK2NTXJo=;
 b=LWnlHe2qx6YMpIhFthrcPNOy/qdynCxOzi/7ElLuzFabWOVAv9z/tPAQoTITjLA9z+2u+b
 rQR0ZCsW+6qgLC5byr4bpI4Mj7Itud7RrmabgoopIFq5tRJCNU+7PThIZN14TeTOVG0cyK
 Tr9GRSnAXDXAw0sSey/baAoliKpr3Txje7x0tpDL4RK/nAYOUJDRcC1KP/ihce5ESueOP3
 QXMmnIqk+8ww0raaWCHz0PU7EvpdSUdG4y+uw0t+fz/DSHwXfX7rT+C7DdI5JN8h3zW6A6
 CpItz+1ihcGKYt8bK/yHPmOl8IGID9I99F/zsX3kMHp5uniOIpDh684cVLLkOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LWnlHe2q
Subject: Re: [Buildroot] [PATCH 1/1] package/shadowsocks-libev: remove this
 package. No longer maintained.
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Min,

On Thu, 19 May 2022 00:44:38 -0700
Min Xu <xuminready@gmail.com> wrote:

> Signed-off-by: Min Xu <xuminready@gmail.com>
> ---
>  DEVELOPERS                                    |  3 -
>  package/Config.in                             |  1 -
>  ...-pkg-config-to-find-netfilter_conntr.patch | 62 -------------
>  .../0002-fix-maybe-uninitialized-errors.patch | 93 -------------------
>  package/shadowsocks-libev/Config.in           | 34 -------
>  .../shadowsocks-libev/shadowsocks-libev.hash  |  7 --
>  .../shadowsocks-libev/shadowsocks-libev.mk    | 27 ------
>  7 files changed, 227 deletions(-)
>  delete mode 100644 package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch
>  delete mode 100644 package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch
>  delete mode 100644 package/shadowsocks-libev/Config.in
>  delete mode 100644 package/shadowsocks-libev/shadowsocks-libev.hash
>  delete mode 100644 package/shadowsocks-libev/shadowsocks-libev.mk

Thanks for your patch. As there has been recent commits (25 days ago)
to shadowsocks-libev, and James has expressed that the package could
potentially be useful, I have instead:

 (1) Fixed the recurring build issue:
     https://git.buildroot.org/buildroot/commit/?id=380d9ad503d552dac2817d3a487f681530030752

 (2) Removed you from the DEVELOPERS to make sure you no longer receive
     e-mail notifications:
     https://git.buildroot.org/buildroot/commit/?id=f704ec56f85b4aebb75a76fd7dbd9db800bf1b9e

     Note that this commit is for now only in our master branch, but we
     also test older branches. So you may continue to receive e-mail
     notifications for a little while, until the update to the
     DEVELOPERS file is propagated to older branches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
