Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42792C3F6B0
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D061740447;
	Tue, 23 Aug 2022 19:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D061740447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2TGRhUZni9dc; Tue, 23 Aug 2022 19:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFFD8408C0;
	Tue, 23 Aug 2022 19:34:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EFFD8408C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6654B1BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4121781410
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4121781410
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78pzA7S0Xqv8 for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:34:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99F7781349
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99F7781349
 for <buildroot@busybox.net>; Tue, 23 Aug 2022 19:34:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 641EA20002;
 Tue, 23 Aug 2022 19:34:14 +0000 (UTC)
Date: Tue, 23 Aug 2022 21:34:13 +0200
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20220823213413.4d034463@windsurf>
In-Reply-To: <20220822080829.30980-1-mf@go-sys.de>
References: <20220822080829.30980-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661283254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ExajAtbGV8FBpCGxxDNBFbcH2YJ/qF7kV20ozFQLTnY=;
 b=DQItsZ8aH3i8bqeRfaxW+NjyzlLBD1g6x+pMblBKrNQXaTFlRVG2sSH+kHOTmz9Avfm3p2
 CD4FWx7X5awNI/MADTJDwPnmmak+T/snzE0fpkXIp5kOZ0S0/8BycS8ILS2L5QMcsiBZ73
 PUoMDvJkhLwBUhfoypucNBrdDWdRErhjQizupqbtYJEHZT+LT8Q+REK3KxnA6wD4nNkjBY
 l7eCMpaDtx7O3q5us9DggpUQrvVLz+4FntVAqsWUEDFPtrSaco3OFdKHsd4PCww/v1HTOk
 Zg9ozAoSRE/jINzg3ayL0vwLJ7jOVeFfmmw5xNEJ+uwR1a0hhOsXetE++cfbNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DQItsZ8a
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2: bump version to 2.24.0
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

On Mon, 22 Aug 2022 10:08:29 +0200
Michael Fischer <mf@go-sys.de> wrote:

> New version numbering scheme, similar to GLib and Flatpak
> version 2.0.24 is now 2.24.0
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/sdl2/sdl2.hash | 4 ++--
>  package/sdl2/sdl2.mk   | 2 +-
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
