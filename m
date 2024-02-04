Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF37C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 12:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C76240158;
	Sun,  4 Feb 2024 12:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C76240158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5AhyNo0YH1nc; Sun,  4 Feb 2024 12:32:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 377A4401B2;
	Sun,  4 Feb 2024 12:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 377A4401B2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 930D61BF36F
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 12:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B6F785135
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 12:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B6F785135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ebT-GROWIv7 for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 12:32:33 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 477B085132
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 12:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 477B085132
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C90D8B004FF;
 Sun,  4 Feb 2024 13:32:27 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Feb 2024 13:32:27 +0100
Date: Sun, 4 Feb 2024 13:32:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zb-D2-ZahrrTCVnJ@landeda>
References: <20240204103204.1415592-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240204103204.1415592-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707049950;
 bh=ycUS3PMgQOP+fAUb0lUPAKiC+ITCPORoJZyuVXteRy0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hU7dsL2X2qOA+647atqvqjBuLTDwcWTaz9OjDv5nCq+dEpEaOg+ZyU3A9I4YdiUKi
 KtEK6cC8aa+7N+qqN9BrgLakPMnR1ViyigqRxsMSILKucObHxq54cWSim3hpPDln/D
 YmIjSOGEYB/nMcRUUxb1ZxkhNcKvT2Lp7lKpn1P82cHblnkQqgxlhYEqwPBQZ+XHmB
 hZpn4EESmVAOU5naZwRYv+buh0L5srZ1zE4yRQVbcFvShTjDxqYvc6Ycza1Y1TtXTW
 0ji/czrm12MCNIdtQ7VG/vTmT3pq9S8YAfOfbEIoeoidZGCmjOfDSFUjAt0B9QMPUW
 2op+aocugfKjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hU7dsL2X
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus: drop DBUS_CPE_ID_PRODUCT
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

Fabrice, All,

On 2024-02-04 11:32 +0100, Fabrice Fontaine spake thusly:
> Commit 363b4ebf1aaf4821c0c49713eba71937bd5639ca set DBUS_CPE_ID_PRODUCT
> to dbus but this is not needed as DBUS_CPE_ID_PRODUCT will be set to the
> package name (i.e. dbus) by default

Ah, right. Applied to master, thanks.

Maybe it would be good to add that check to utils/checkpackagelib/, so
that it detects and reports the "FOO_CPE_ID_PRODUCT = foo" case.

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dbus/dbus.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
> index d610846ddb..097b89205e 100644
> --- a/package/dbus/dbus.mk
> +++ b/package/dbus/dbus.mk
> @@ -12,7 +12,6 @@ DBUS_SITE = https://dbus.freedesktop.org/releases/dbus
>  DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
>  DBUS_LICENSE_FILES = COPYING
>  DBUS_CPE_ID_VENDOR = freedesktop
> -DBUS_CPE_ID_PRODUCT = dbus
>  DBUS_INSTALL_STAGING = YES
>  
>  define DBUS_PERMISSIONS
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
