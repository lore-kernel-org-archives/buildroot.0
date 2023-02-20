Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5B3C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6838E7030C;
	Tue, 21 Feb 2023 02:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6838E7030C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NSbOxsjPYA-f; Tue, 21 Feb 2023 02:15:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E31370326;
	Tue, 21 Feb 2023 02:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E31370326
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9153A1BF310
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5740F40C1C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5740F40C1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGGF9WjkucJ5 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 22:47:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34DC540204
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34DC540204
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 22:47:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1A33D100003;
 Mon, 20 Feb 2023 22:47:39 +0000 (UTC)
Date: Mon, 20 Feb 2023 23:47:38 +0100
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230220234738.40b492d3@windsurf>
In-Reply-To: <20230215224712.487272-1-aduskett@gmail.com>
References: <20230215224712.487272-1-aduskett@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676933259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKILSxRM3a7DPJpUmFbLt9CeG3dAK3eDmhRTiIXb1uI=;
 b=GmyTS0YUmz4rCRFRl5zT+KLO9tnLfmmP2NiW4Z6ekdaqyIeINPGl+kKruXqoVJKBz04Vws
 pVCGAgeOL6ROe4k7JYWhdZe7UBqYfk1m/Yz8KUche9mmbDC4VyreMqcC9AlnC81QYjiDSv
 Sy3inEkgEt3Rt9i6tWb4WVDTHzms37lwJkubC+hcLRF50wIfujES/gdnhmu99LqWPtFV7m
 4A12SSAE2l6VZLRtcsV4BifWFZBQYACILKv1hdOJhOH4LhOjdw3djbO8bYRzWnP26K/I6p
 GfwOpk6YtpdfKk5ha3PRd+wY/cO2SgovyBkhoQgFb89v6TqODYaWOYetPtWV0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GmyTS0YU
Subject: Re: [Buildroot] [PATCH v2 1/1] package/openjdk{-bin}: bump versions
 to 11.0.18+10 and 17.0.6+10
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
Cc: Tudor Holton <buildroot@tudorholton.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 15 Feb 2023 14:47:12 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> v1 -> v2: Add missing openjdk-bin updates

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
