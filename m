Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1948DC433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 21:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99B278205D;
	Tue, 22 Nov 2022 21:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99B278205D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HznK2GkRlVP6; Tue, 22 Nov 2022 21:35:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB95B81FD6;
	Tue, 22 Nov 2022 21:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB95B81FD6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 905FB1BF38C
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7905461166
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7905461166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4edsLJxkt5Yo for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 21:35:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7786460FFE
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7786460FFE
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 21:35:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6C67960006;
 Tue, 22 Nov 2022 21:35:26 +0000 (UTC)
Date: Tue, 22 Nov 2022 22:35:25 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221122223525.3d833030@windsurf>
In-Reply-To: <20221031174959.604094-1-james.hilliard1@gmail.com>
References: <20221031174959.604094-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669152926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C7TH+bAsv5VGXBqxaGAUjnD9EIWNLRe0/kGrmjB+MEI=;
 b=DpXh+HXg/2CEhGTohcLHpUuSwhXCjKA8kxs2JKL/xwhJq00/9LVfOGUBFmJ7d7JDvoiGyY
 oZX2nsQID/Xo6xvCcPbd6nduvLOyf2tey5vaW64fpdpxUh7Y7ZFG2OcyXnWTeyiTfsXwQ9
 qnt0dYa60mQCwwXMk2/7EfzELuFXzDY0BFsS4VNwtOa1QmboARHgLWN6rfWh2552Fy4y+H
 HzJcl+Yh64/Dn0g2swt2jUrMXeWBG/a09Dkiw/JBVDalCL5i0Q8Qxz2OzA/Uc5VlAVoLLt
 5xsEJBh5FA2V4TuzMlYaSvaIDBHfuY//MNaCKZPzYjCPJ1+s7KP9zr/WNZRTNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DpXh+HXg
Subject: Re: [Buildroot] [PATCH v3 1/1] package/iwd: add dbus compile time
 dependency
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

On Mon, 31 Oct 2022 11:49:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> In 5b3b2d80f4cf586d360ff696c3dacbd4cb48fdc4 we dropped dbus as a build
> dependency, however we still need it when building with systemd so
> that the service directory is available via pkg-config.
> 
> In addition we can drop --with-dbus-datadir by unconditionally
> requiring dbus as the datadir will then be fetched from pkg-config.
> 
> Fixes:
> checking D-Bus bus services directory... configure: error: D-Bus bus services directory is required
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v2 -> v3:
>   - always depend on dbus
> Changes v1 -> v2:
>   - depend on dbus when depending on systemd
> ---
>  package/iwd/iwd.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to master after adding a reference to the autobuilder failure.
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
