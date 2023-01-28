Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D9BC636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED8DC408B7;
	Sat, 28 Jan 2023 21:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED8DC408B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jovw0nXX7AVm; Sat, 28 Jan 2023 21:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DB34404B9;
	Sat, 28 Jan 2023 21:44:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DB34404B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D27A31BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7FD881DAB
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7FD881DAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTD1A1q41h7U for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:43:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82E9181DBF
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82E9181DBF
 for <buildroot@busybox.net>; Sat, 28 Jan 2023 21:43:37 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4119C100002;
 Sat, 28 Jan 2023 21:43:34 +0000 (UTC)
Date: Sat, 28 Jan 2023 22:43:33 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20230128224333.6f27dcbe@windsurf>
In-Reply-To: <20230121163537.147981-1-francois.perrad@gadz.org>
References: <20230121163537.147981-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674942214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omnpmAqtcJx0Yb105A2v8ibL0pAk9AQ7lB+V/MCTdMc=;
 b=cHCmWXDxN3A5zoTdwjO/HmmXArSK7xGC4Nlk0qGuH04W7a4egoouqjF0Zlis9HQdjDznsS
 wk2lYwJzQniMth2xSDtUW5gxOoAWId8YIRL4G7rWvzSd/AKTZq7XcJvzDb5Vm58jmWxYuZ
 DJL0hpQbpSV/8E324iWWuR8WlVk/W/BNqsTKQuoXdnVRCGBJu+i6PaRgYiyBUErjKWDkHD
 kTiAQArhmwBrck/SRvz4AnQrUjoFcNdg/yZPWb4fw2dk7c5w0wntwBM9jh6FjgFzry0zRa
 DKCUMxRJLfl5DOB1wabFaIQQgiRjFt9HnxDzM9gxX2YOkiaWrc1OBui8EGb2Nw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cHCmWXDx
Subject: Re: [Buildroot] [PATCH 1/7] package/perl-data-optlist: bump to
 version 0.113
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

On Sat, 21 Jan 2023 17:35:31 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-data-optlist/perl-data-optlist.hash | 4 ++--
>  package/perl-data-optlist/perl-data-optlist.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks, series of 7 patches applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
