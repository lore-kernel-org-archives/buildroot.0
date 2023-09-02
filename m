Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B86CA0FF6
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB28C404F9;
	Sat,  2 Sep 2023 07:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB28C404F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmXRTcKLeYvW; Sat,  2 Sep 2023 07:43:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3809D416F9;
	Sat,  2 Sep 2023 07:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3809D416F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09C3D1BF861
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4FCD416DD
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4FCD416DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KG5tpTAY_2TX for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:42:49 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C6DF404F9
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C6DF404F9
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA3621BF205;
 Sat,  2 Sep 2023 07:42:45 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:42:44 +0200
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Message-ID: <20230902094244.0251e004@windsurf>
In-Reply-To: <7af21f66-d3c5-e42f-03e5-8a1f6b370520@mind.be>
References: <5969347.lOV4Wx5bFT@kilian-aisec>
 <7af21f66-d3c5-e42f-03e5-8a1f6b370520@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KqFoWs5DBAt2HsPb4n/Em9TFUeaisV2qy+lt2I2XWEM=;
 b=UmQkSpvvCQ2uZpThQY15xZmplvYTeOhXxnuUUIx+0tgZddxA+bQX4LPS/sEMAMkxNVxGb1
 P1c5PggTTpaB/b/7+iew/w/yyVY7Vpmvk/nYF/FTIQuildGTACuW2+HDIppG427LGiB/J2
 bazif2FhZ5BG8TxhlsodX34QQMO+Jbsb7PFlU4m323H7Yp1msh9IDLQ+Va50mAsBiev8GQ
 sZGKN0Qmd9zikqroszuM964Z+by2QOwIUMWQf2DG4ejIn0FEKLRepZt5Y8dhHjfoDuhGNO
 k9ARj/Lhybemx3DfSYXj3l2tL7c5UuQZ7GnJW6dsCytZ8SQICO4r/qcnVO4M9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UmQkSpvv
Subject: Re: [Buildroot] Buildroot docker image
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 1 Sep 2023 09:19:02 +0200
Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:

>   First of all, the one on dockerhub is no longer updated. The images we 
> actually use are on registry.gitlab.com/buildroot.org/buildroot/base
> 
>   But even those images are not really "for user consumption". They are the 
> images we use for CI, and they therefore have a bit more stuff in them than 
> really needed, e.g. qemu. They are also not updated (on the OS level) - no 
> security updates or anything are applied on it.
> 
>   It would probably be better if we would also create a small image that people 
> can use for just building in their CI. A small image based on e.g. Alpine or 
> Arch, and that is updated e.g. daily on dockerhub. However, nobody ever 
> contributed such an image so we don't have it.

Yann has been working on and off on a set of Docker images for
Buildroot. See his branch at
https://gitlab.com/ymorin/buildroot/-/commits/yem/dockers/. I indeed
shared with him recently on IRC that it would be nice to have a really
minimal image, separate from the image used in CI (which has more stuff
enabled, most notably python3).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
