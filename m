Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AAAC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B0DE81350;
	Sun, 11 Dec 2022 13:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B0DE81350
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uhl_PC4o3iGP; Sun, 11 Dec 2022 13:19:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9139F81397;
	Sun, 11 Dec 2022 13:19:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9139F81397
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C7991BF2BD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77C33605E0
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77C33605E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NHyE4jLwkp37 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:19:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 069AA605A9
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 069AA605A9
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:19:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BD1CD40003;
 Sun, 11 Dec 2022 13:19:22 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:19:21 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221211141921.78b14add@windsurf>
In-Reply-To: <20221211110908.1948270-1-peter@korsgaard.com>
References: <20221211110908.1948270-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670764763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FtzRgvgveJH5m98o8i98hd8OT5JVOx3gt4f5rff/mp4=;
 b=aLKJjyITb9b0CcjWwLhS59TkJJKm6KU3e2qDAKDA9iBT1uup0mPl9+pNKfCdydsfKrJJ52
 XUVltqwNeSQBZ31g6YUrlT1I0AVRy81Wql7P51QkUduNg4fG84KHPjMsACL3gfhkXXM0gP
 vRCYITBU54zAPCAL5kQn6wz/2q4nmqB5JWiWbSSq11A8XpxyZqvfON0NRwxjZULEbp4xwm
 K1A8FLJ7qDKLulZ8lNcL4XD9kfqgTkyr0TomzndHgV3zEthzvxFaULtWnelE0NAzerIYM7
 Uf0C15beHji1fRkWbHYO+9KlXuGz+V6QhvqsQXQMdCGeTux2Jt5SLKvmC/ReeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aLKJjyIT
Subject: Re: [Buildroot] [PATCH] package/xserver_xorg-server: add upstream
 security fixes for CVE-2022-355{0, 1}
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

On Sun, 11 Dec 2022 12:09:07 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security issues:
> 
> - CVE-2022-3550: A vulnerability classified as critical was found in X.org
>   Server.  Affected by this vulnerability is the function _GetCountedString
>   of the file xkb/xkb.c.  The manipulation leads to buffer overflow.  It is
>   recommended to apply a patch to fix this issue.  The associated identifier
>   of this vulnerability is VDB-211051.
> 
> - CVE-2022-3551: A vulnerability, which was classified as problematic, has
>   been found in X.org Server.  Affected by this issue is the function
>   ProcXkbGetKbdByName of the file xkb/xkb.c.  The manipulation leads to
>   memory leak.  It is recommended to apply a patch to fix this issue.  The
>   identifier of this vulnerability is VDB-211052.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...ntedString-against-request-length-at.patch | 35 +++++++++++
>  ...possible-memleaks-in-XkbGetKbdByName.patch | 60 +++++++++++++++++++
>  .../xserver_xorg-server.mk                    |  7 +++
>  3 files changed, 102 insertions(+)
>  create mode 100644 package/x11r7/xserver_xorg-server/0002-xkb-proof-GetCountedString-against-request-length-at.patch
>  create mode 100644 package/x11r7/xserver_xorg-server/0003-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch

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
