Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A60C04A94
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 12:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEB8381E82;
	Sun,  6 Aug 2023 12:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEB8381E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4vGwmLx21xs; Sun,  6 Aug 2023 12:06:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 457AD81E5A;
	Sun,  6 Aug 2023 12:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 457AD81E5A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12E251BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D96DA8176E
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 12:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D96DA8176E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQfqtbM-V4hn for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 12:05:47 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD26280BA2
 for <buildroot@busybox.net>; Sun,  6 Aug 2023 12:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD26280BA2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90B03E0002;
 Sun,  6 Aug 2023 12:05:43 +0000 (UTC)
Date: Sun, 6 Aug 2023 14:05:42 +0200
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230806140542.44d4c66d@windsurf>
In-Reply-To: <20230805080752.84001-1-francois.perrad@gadz.org>
References: <20230805080752.84001-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691323544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sb2xGjK891OXsUHpE890MsPvTrSAeV/HEhTbDd4mbIc=;
 b=lTydEpAXA4P2p3DY36QO6suEqOqEXw9517kkX1u97NbJFznB7Kbwb2QNJo6jNuyPzjggOs
 WydvksiWCornwx51GB9sqwsxP19r9zZL+gPt3dfjvbh5Wa2OPGUk4yEPa2yeTS+w5hyoLk
 mkx4pMiV4+wK7SryhMH5ikhJkaqf5Um/haPHaAIoMyaNsW3iT41KaYytzr9FB6N4RQzO7P
 i9+31gpCma+vNu+JHdKoJlS3mNdh/U8mqRt7BqJ0L7J4W/6WVyX7a3sMzuDistb9kKENN9
 8bR5crQWsu++O2fPlW0WL0IeayYcwlUlGM15cggT3SCQ5o8HNnJdvJ275gXgIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lTydEpAX
Subject: Re: [Buildroot] [PATCH] package/lua-rotas: bump to version 0.3.0
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

On Sat,  5 Aug 2023 10:07:52 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lua-rotas/lua-rotas.hash | 4 ++--
>  package/lua-rotas/lua-rotas.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
