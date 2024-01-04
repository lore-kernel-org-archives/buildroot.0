Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D82C47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABD7561B2C;
	Thu,  4 Jan 2024 21:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABD7561B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LGlFJxf8bO0; Thu,  4 Jan 2024 21:44:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17C9561AEB;
	Thu,  4 Jan 2024 21:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17C9561AEB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B360E1BF859
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D2EF42C37
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D2EF42C37
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I3slnM-mR6l1 for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:44:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89E5C428BE
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89E5C428BE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53CB320003;
 Thu,  4 Jan 2024 21:44:45 +0000 (UTC)
Date: Thu, 4 Jan 2024 22:44:44 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20240104224444.76c7800d@windsurf>
In-Reply-To: <7bf9e3705b3b2bfe8d7796551156abd2ddb8ea26.1704300546.git.baruch@tkos.co.il>
References: <7bf9e3705b3b2bfe8d7796551156abd2ddb8ea26.1704300546.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704404686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBE50wVunfrfUefxATsVuqvVlqkA79TvHx8QrCLSmOw=;
 b=BzvlRTTLsEW1dwCBYuPQAo9WE82vP1WcH5b/1Vq3T2rCv99n0qe34C5nPD92H/zhbV3i6/
 DhMjCPQGyYS67JPOea7Y6GLxR6gj4EEGO9OY5twNaeVkb32aj3UNtVJp7Wl/0lFTdUy4bE
 ZVw8MlsPL3ImcQ103nV8vq87U9MlJmFneYPlTCtDkVgSULG6VvxId8SybYPBEu1g21ktg7
 T9gNAshTPGvn7CwNYeq5pBuClRpBC9phTpNUx28x1B+djFXw7u0jO5IetTIHWJHwUH12GJ
 nGiqulnblkOAqEg9Pleq/B5r+oC2aGCXFB92IN+rJd/04Ny0b1VpFuEjSoD1WA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BzvlRTTL
Subject: Re: [Buildroot] [PATCH] package/picocom: bump to version 2023-04
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  3 Jan 2024 18:49:06 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> Switch to new upstream.
> 
> Drop upstream patch.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .checkpackageignore                           |  1 -
>  ...-with-libc-s-without-cispeed-cospeed.patch | 49 -------------------
>  package/picocom/Config.in                     |  2 +-
>  package/picocom/picocom.hash                  |  2 +-
>  package/picocom/picocom.mk                    |  4 +-
>  5 files changed, 4 insertions(+), 54 deletions(-)
>  delete mode 100644 package/picocom/0001-Compile-with-libc-s-without-cispeed-cospeed.patch

Applied to master, thanks. However, it looks like release-monitoring
isn't aware of this new upstream, at least based on
https://release-monitoring.org/project/3634/. Perhaps something you
could contribute to release-monitoring.org?

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
