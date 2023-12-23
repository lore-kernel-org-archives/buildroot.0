Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5036EC3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 20:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0281E40015;
	Sat, 23 Dec 2023 20:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0281E40015
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q6ULXOcy75JK; Sat, 23 Dec 2023 20:37:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61BAC418AB;
	Sat, 23 Dec 2023 20:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61BAC418AB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96FBE1BF47E
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FB8E418AB
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FB8E418AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1rn0kwUTTl8 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 20:37:43 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7138E4086D
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 20:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7138E4086D
Received: by mail.gandi.net (Postfix) with ESMTPSA id 998D8C0002;
 Sat, 23 Dec 2023 20:37:40 +0000 (UTC)
Date: Sat, 23 Dec 2023 21:37:39 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231223213739.0227e2b1@windsurf>
In-Reply-To: <20231204211622.12687-3-bernd@kuhls.net>
References: <20231204211622.12687-1-bernd@kuhls.net>
 <20231204211622.12687-3-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703363860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ERetoD9OegC00nOOWNUxRty/BYZmXqpJAIOXoVx1heY=;
 b=UTPwMJ2WnUAj2p5liHEGN5wj3UEugVYMoa2HWfGrwQDXqkMMrmK5jgDvaujSvmgLXUkeID
 B3KDR6vqf8sVMnBLe3+F9SU/FNfT+27ULT65Ho7JPVS5HNXXOUgaO6t0U67vA8fae8WhT1
 hZAb8oN0X6gnv56iMoFahuyxZjiTHylLOuLRv3JXodaD42aw6yXMaiW/0UopKa4MZQHP6a
 5mzb6XHbpkq3ypK2gGSGEvxdAYtm19PhMAHZGId5ZxoqOOFiE+GL6pDvdMTWKhNpkw9HY2
 aGQmG9j0eYL3OCfZOEDoGdGXT1ogYjMafvzPB2zvbDFhkSZR8RCsYmZ7uvIdtg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UTPwMJ2W
Subject: Re: [Buildroot] [PATCH 3/3] package/libxml2: bump version to 2.12.1
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  4 Dec 2023 22:16:22 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Updated license hash due to upstream commit
> https://github.com/GNOME/libxml2/commit/4a513d5667d7690998f01b9048c56c4f1f50f6a5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libxml2/libxml2.hash | 6 +++---
>  package/libxml2/libxml2.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

I see you fixed both squid and xmlstarlet before this bump, but
obviously a concern is whether other packages will be affected. How
much build testing did you do after this version bump? There are indeed
a myriad of packages using libxml2.

Of course, the autobuilders will tell us, but I was wondering how much
breakage we might be seeing. If you could keep an eye on the
autobuilders in the next few days for possible issues related to this
version bump, it would be nice!

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
