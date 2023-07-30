Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2097C001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 14:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CADA60E68;
	Sun, 30 Jul 2023 14:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CADA60E68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZcW3Q2sNJzcJ; Sun, 30 Jul 2023 14:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A26DA60E4E;
	Sun, 30 Jul 2023 14:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A26DA60E4E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDB531BF3F2
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 14:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71AA240580
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 14:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71AA240580
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rVxc3CmkRUk5 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 14:06:36 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7257A40525
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 14:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7257A40525
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C49BC0002;
 Sun, 30 Jul 2023 14:06:33 +0000 (UTC)
Date: Sun, 30 Jul 2023 16:06:32 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230730160632.71114780@windsurf>
In-Reply-To: <50d4fcd31983bde7b248a088e983a0c7@free.fr>
References: <20230607202439.188050-1-ju.o@free.fr>
 <20230729233927.572fd26c@windsurf>
 <50d4fcd31983bde7b248a088e983a0c7@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690725993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hqmk3FOR7NNNVH5xLrvtDRtSYtxMgfJWydQOW45ptnw=;
 b=mb5TBzNlovnaPiT3p8h52JleflRRFb6c3cRM9ueMf16k+eN9vf3cgtPlsolaIY7vEVf6Jo
 HHE06j49kzMnatsNRv4Af5/edNrJM8/uKXJ713KNr3G/ic7HqgR/F5o5JfuiBP4vUD+bQR
 xte0CWIQOz7c+kiexo92+pLzdXxq7rOsWMnqbPYA3WOMZXU29OyDG/dzc1ASfUaE1bYfgq
 OpvPaCtopRQDAh0IHALDoOCGQeH0XUfQCDkvNyUS65cBxzyfPQ7UT+5GdAXpwc+zCusbGF
 Btb3x1SAOkywZU6e0hBtO+q25wxJrm+GJYOySwOU6yJWRmZ5jQdGT2b0ku9TqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=mb5TBzNl
Subject: Re: [Buildroot] [PATCH 1/2] package/glslsandbox-player: bump to
 version v2023.04.05
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

Hello,

On Sun, 30 Jul 2023 14:12:44 +0200
Julien Olivain <ju.o@free.fr> wrote:

> I hope this demystifies a bit all the hidden magic behind this test.
> I also hope to see other graphic runtime tests! ;)

Thanks a lot for all those details, very useful. Minor nit: you've put
a lot of references to link [XYZ], but you forgot the list of those
links.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
