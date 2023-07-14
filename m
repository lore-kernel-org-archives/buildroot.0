Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273EDEB64DA
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D37B561409;
	Fri, 14 Jul 2023 10:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D37B561409
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 438ytyx7pwhd; Fri, 14 Jul 2023 10:23:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BD6B6144C;
	Fri, 14 Jul 2023 10:23:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BD6B6144C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2321BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74F0F605A5
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74F0F605A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SakfXr5nUFFp for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:23:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 565766144C
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 565766144C
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:23:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5142AE000A;
 Fri, 14 Jul 2023 10:23:34 +0000 (UTC)
Date: Fri, 14 Jul 2023 12:23:33 +0200
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230714122333.323ace12@windsurf>
In-Reply-To: <20230610155323.968228-1-bernd.kuhls@t-online.de>
References: <20230610155323.968228-1-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689330214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdGWmJZ///L6WTdgSkTfCHTi8DPiiFMrPh5Iad+dw/Y=;
 b=i/CYrfODkbPisr7ADzpvXVNdXlqJUVJvqe5QfDxr1gABzCvtqeGvLoMemvxXReoSr6C7nz
 BlbHs7oAHxatrtjohekW2ewTJxIJafDwnSPjxOzo+ggTZ0MP0SNB+bNZPFvkxeTWnnLf8N
 rM3KrFIuKmPeoWdv/4eLXAbB37vHux9JB4OpPfQBX6geYVC3LHAFGJiJ+7JlMiSReNba1I
 QkAc7Muwy4ViE28fFvEDJkn7zuK2jZ25LrB7zzLIS5jLmqJUS3c2J3t+Wd6blL3vpRaF9c
 JRijihfR0prdBGwoQFTdwO5One/zBkXe63USVn91i0AHDt+ceqW2sciWKm0Q7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i/CYrfOD
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: bump version to 3.8.0
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

On Sat, 10 Jun 2023 17:53:23 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Updated license hashes due to upstream commit:
> "Sync GPL/LGPL license files from Gnulib"
> https://github.com/gnutls/gnutls/commit/a39e528897184c6f6a33d245b82891a8dc8090ce
> 
> Removed configure options related to guile which were removed upstream:
> https://github.com/gnutls/gnutls/commit/100cc2a706b8e097cbeb63d08c7ea59717c906ca
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gnutls/gnutls.hash | 8 ++++----
>  package/gnutls/gnutls.mk   | 6 ++----
>  2 files changed, 6 insertions(+), 8 deletions(-)

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
