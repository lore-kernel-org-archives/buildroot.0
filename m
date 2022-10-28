Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E478C38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 10:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E88741508;
	Fri, 28 Oct 2022 10:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E88741508
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRAXxIsqHXPf; Fri, 28 Oct 2022 10:03:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BFA3409B2;
	Fri, 28 Oct 2022 10:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BFA3409B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6AC731BF3E0
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 10:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F0FC60AC0
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 10:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F0FC60AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id STvYF0MSG-sY for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 10:03:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA10A60A9F
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA10A60A9F
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 10:03:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CF6E0100007;
 Fri, 28 Oct 2022 10:03:13 +0000 (UTC)
Date: Fri, 28 Oct 2022 12:03:12 +0200
To: Corentin Labbe <clabbe@baylibre.com>
Message-ID: <20221028120312.4e1479ab@windsurf>
In-Reply-To: <20221016080629.3354482-1-clabbe@baylibre.com>
References: <20221016080629.3354482-1-clabbe@baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1666951394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54sLIT9xpLZsUQRAYoTQGv7QZjvWqY/WEhYKgsPWlxw=;
 b=mIuitZWIre7U2v3wHaQnCHsP+xj299EQlcsSl0gqW4lOsKneE4+BoeORawVJAfgWr/UgM6
 VhKdwIsBh7dv+Ht+oX5y3HxBU6ClB8q7uwVAJgjUBU3bdi8TPvzWuIHKbuyOmUwx+4cUGx
 w6QicygPYrt8DJBfT7Q/uKYQUtGpSj4lX4vS5QVKEwc4z4moBVJq72+jbBBr+M2D5BFFG4
 MdXyh+bvpgVC6D6KmZzok+lBIyAaHMtxCC74dDot7s7wSFr8/57Rwf7lI7gbj39qVHP4/X
 L0HxIR4wzC3tuEBW5U923s4n0B8z1/lG3F2MKza23Qlu132DW46xsxnVfT6RcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mIuitZWI
Subject: Re: [Buildroot] [PATCH] package/ffmpeg: handle new SDL2 version
 scheme
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

On Sun, 16 Oct 2022 08:06:29 +0000
Corentin Labbe <clabbe@baylibre.com> wrote:

> Current ffmpeg package does not install ffplay.
> The root cause is that ffmpeg configure does not detect SDL2 due to
> version mismatch.
> The patch fixing that is taken from gentoo portage tree.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  ...peg-4.4.2-libsdl2-new-version-scheme.patch | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/ffmpeg/0005-ffmpeg-4.4.2-libsdl2-new-version-scheme.patch

Thanks Corentin for the patch. However on the same day, Bernd submitted
a patch that bumps ffmpeg to 4.4.3, which also addresses the problem as
this fix is already in ffmpeg 4.4.3.

Also, for next contributions: we want the patch to be generated with
"git format-patch", and you need to add your Signed-off-by line in the
patch itself.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
