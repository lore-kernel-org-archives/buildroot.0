Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138F1C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA3D6405F5;
	Mon, 25 Dec 2023 20:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA3D6405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u141kNX6ZEkr; Mon, 25 Dec 2023 20:46:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8AC140649;
	Mon, 25 Dec 2023 20:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8AC140649
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 601351BF94D
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39F2380F57
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39F2380F57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YoTDmCpy582D for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:45:44 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A71780EC9
 for <buildroot@busybox.net>; Mon, 25 Dec 2023 20:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A71780EC9
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CD5E20003;
 Mon, 25 Dec 2023 20:45:42 +0000 (UTC)
Date: Mon, 25 Dec 2023 21:45:41 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20231225214541.6e48d925@windsurf>
In-Reply-To: <20231225193901.88004-1-francois.perrad@gadz.org>
References: <20231225193901.88004-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703537142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cn22OLmSfSfMVCMoNP/Rq0iG3WTUb5q27txccPY6U5s=;
 b=LwW36n+4pSO/s+ZIDTvbv9ZgAJPgzjrvyzLDIkE+WYMTQughaMhIlmn1rpGh/CObUZjAqL
 HILjjkjeLzUVOv9YKpgcQ/Tpv/dK0QX6Y45IkjWpNkEkhzmQBrwv6ir4y28UFqYJnItD6p
 /gvx+pDzz48yDHhhFbemXENjGViOnpNbMmKITYIYA3Z/sLruTYQsc2unwUZlmY7KDXzAJd
 DWPJoq0jrAfXCsFhDVywrXyMxTGewyQYfm8YmNZqQVD//vurUNFMX0b8tltUo7ApSJ/oZE
 PYHDKdSTwtQAkLJZ+wSLRvjENaBSnFc8YQIq3pJFMEh4AZ55wEnWlYVCrUbydA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LwW36n+4
Subject: Re: [Buildroot] [PATCH] package/lsof: bump to version 4.99.3
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

On Mon, 25 Dec 2023 20:39:01 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/lsof/lsof.hash | 2 +-
>  package/lsof/lsof.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
