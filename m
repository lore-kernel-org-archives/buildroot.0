Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E385ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E009B60A90;
	Sun, 30 Oct 2022 20:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E009B60A90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fE9cbUgjh11f; Sun, 30 Oct 2022 20:37:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2454C60803;
	Sun, 30 Oct 2022 20:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2454C60803
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9439A1BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FDD060803
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FDD060803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LGSf86_SvsKI for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:36:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4458F60670
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4458F60670
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:36:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0734640005;
 Sun, 30 Oct 2022 20:36:55 +0000 (UTC)
Date: Sun, 30 Oct 2022 21:36:54 +0100
To: Lang Daniel via buildroot <buildroot@buildroot.org>
Message-ID: <20221030213654.354999c4@windsurf>
In-Reply-To: <VI1P190MB0493163B9AD3A02AB50F3EF99F299@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
References: <VI1P190MB0493163B9AD3A02AB50F3EF99F299@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667162216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ldu2jwQFcDaS2DBq+mfkNM1l0wghMonMq9Cj3e+7O/E=;
 b=VlU7trIc3ExDZfQ9GLPwiU4hj7Ge5QszPGxKVNGjFVLpog8yiSBrpjUnxQ+ivuqOJlFPh2
 rjZVtX38jXcaMjruPFDaQZoiNxCy9QALfWJwP+l1/d8YI7z2Pz/j3xC3xqPYgie/tOw2MK
 dJJ8FU+y94f42Dt418eIoNVr1NiTlqZSe9bVgZB0hKGgF1pYb/whK9Wlz+54hsG39mY3wr
 yYGDktHsMlKwVHHy3UDyCyyKuDmS8XmM11yYWwFAZRjGi8gOh1VBvqEvubqGYirT1sWnZE
 F51VRegRuwZwOFJC81+vgTZs7d/U72PAGqN6A3T2j7G+2MF2YAXVtn/GmBX8aQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VlU7trIc
Subject: Re: [Buildroot] [PATCH v2 1/1] package/iwd: drop dbus check
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
Cc: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 17 Oct 2022 06:21:18 +0000
Lang Daniel via buildroot <buildroot@buildroot.org> wrote:

> Since 6f5f6bc dbus is selected when iwd is selected.
> It is only a runtime dependency, so drop the build
> dependency.
> 
> Signed-off-by: Daniel Lang <d.lang@abatec.at>
> ---
> Changed v1 -> v2:
>   - dbus is only a runtime dependency, drop
>     the build dependency (thanks Yann).

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
