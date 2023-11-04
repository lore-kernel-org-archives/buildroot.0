Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43157C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5BAE60DF9;
	Sat,  4 Nov 2023 21:21:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5BAE60DF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zWGEntxGVwIZ; Sat,  4 Nov 2023 21:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4987B60DE5;
	Sat,  4 Nov 2023 21:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4987B60DE5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7D31BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 050A460C17
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:21:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 050A460C17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iux5wQUmlxq5 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:21:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9A4160BAF
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9A4160BAF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34B761BF204;
 Sat,  4 Nov 2023 21:21:09 +0000 (UTC)
Date: Sat, 4 Nov 2023 22:21:08 +0100
To: Takumi Takahashi <takumiiinn@gmail.com>
Message-ID: <20231104222108.2fa46247@windsurf>
In-Reply-To: <20231003163614.1177692-1-takumiiinn@gmail.com>
References: <20231003163614.1177692-1-takumiiinn@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699132869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0FedK6Bw1vqJY+mPGw41GtwMwch35/znq1xz0M28uo=;
 b=jHYFBvjJWJ52C5WBLCP+DwcxY2J6CSsg477REI/kq82b8xDn7NITyjv13Yo5wQGkTQzUKa
 O8CKBd7lsISjCCyCxhq/pd54Ux3eeZmoPfh7fReQ9s3bwXC7TSv8u5nXctLZwfKMlFIOaJ
 5Yqd+Cn+WXQUuUKENJovpexq4SLz493SStZ32LnvyMugKl59ZINMRvdc11G862Fvmc6TA1
 vXeNQqQKkuMne9dinMzEb2YaDhifc1NgBvZpCnMGg4bfHGZ/j6CrlqFkPqee0pJwN1oGgZ
 WbNAadMOPAXj7bkUgQ5YIItG3Tn228Oq7vxHemxaUpyfbjCKA8cvUNiY8vAwDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jHYFBvjJ
Subject: Re: [Buildroot] [PATCH] package/gsettings-desktop-schemas: bump to
 version 45.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Oct 2023 01:36:13 +0900
Takumi Takahashi <takumiiinn@gmail.com> wrote:

> This update is required to install the latest version of the GNOME desktop.
> 
> Currently, only gvfs depends on this package, and we have confirmed that
> gvfs can be built.
> 
> Signed-off-by: Takumi Takahashi <takumiiinn@gmail.com>
> ---
>  DEVELOPERS                                                    | 3 +++
>  .../gsettings-desktop-schemas/gsettings-desktop-schemas.hash  | 4 ++--
>  .../gsettings-desktop-schemas/gsettings-desktop-schemas.mk    | 4 ++--
>  3 files changed, 7 insertions(+), 4 deletions(-)

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
