Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3A5C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 20:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B0DB401D8;
	Wed,  3 Aug 2022 20:00:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B0DB401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yRH2on_U24Uj; Wed,  3 Aug 2022 20:00:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D07C64018A;
	Wed,  3 Aug 2022 20:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D07C64018A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4184D1BF5DC
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B318608B7
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B318608B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V4CaGZ12JeAy for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 20:00:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8662607F9
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8662607F9
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 20:00:26 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7A06F1BF208;
 Wed,  3 Aug 2022 20:00:23 +0000 (UTC)
Date: Wed, 3 Aug 2022 22:00:22 +0200
To: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Message-ID: <20220803220022.439d0eef@windsurf>
In-Reply-To: <20220727072500.3019487-1-buildroot@heine.tech>
References: <20220727072500.3019487-1-buildroot@heine.tech>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659556824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vle+AWimfGXB1+DYhRQ4GNCIZptcTi8IcyHDIIlVudk=;
 b=TgTHlp3fnU7AHTijTKhx8g0bSwhLBqVFvmDuo/LRv2/8iehRGBqHx0SI7ffUr0vDranfIM
 Qiji0oWZLHbW7TWTjBo4DDxRv4GNWTEGrMg8WJrW3fAfp7GQBX61R85LUrZdt9rNmcxDdh
 7AKxKv6H30+frIkerBzl9F9KS1QPC7W7+ez4VVH+enG4WX2sd5lCoPle+GWSOSs53Pbule
 8X+bG26jLiRZkP0hWH24ohwHQu9P9wzWo1cT69uy+GH25VD3vNd/t96GKVvE2yR882r0gu
 PL11qjh6vHmdJnRomqYGMlJ66u8FfgeJL8BgssZDkaif3re65Lkx8EDgdBLaXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TgTHlp3f
Subject: Re: [Buildroot] [PATCH] package/{python-}protobuf: bump to version
 21.4
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
Cc: Julien Olivain <ju.o@free.fr>, Matt Weber <matthew.weber@collins.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 27 Jul 2022 09:25:00 +0200
Michael Nosthoff via buildroot <buildroot@buildroot.org> wrote:

> protobuf changed it versioning scheme [1]. The Release version is now only the
> Minor.Patch version of the language specific version.
> 
> C++ stays on Major version 3, but python got bumped to 4. So the handling in
> the .mk files changed to reflect that.
> 
> python-protobuf changed it version to 4 because of some breaking changes,
> see[1].
> 
> [1] https://developers.google.com/protocol-buffers/docs/news/2022-05-06
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> Tested-by: Julien Olivain <ju.o@free.fr>
> 
> --
> 
> chhanges from patch 21.3 -> 21.4:
>   - package version number for both packages is now the protbuf version
>   - Major version is contained in the SOURCE variable of the packages
> 
> python-protobuf runtime tested by Julien
> ---
>  package/protobuf/protobuf.hash               | 2 +-
>  package/protobuf/protobuf.mk                 | 4 ++--
>  package/python-protobuf/python-protobuf.hash | 2 +-
>  package/python-protobuf/python-protobuf.mk   | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)

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
