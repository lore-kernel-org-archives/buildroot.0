Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247F6C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 10:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B37A7404F4;
	Wed, 24 Aug 2022 10:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B37A7404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6W0r4a3s9QtD; Wed, 24 Aug 2022 10:18:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D11A340105;
	Wed, 24 Aug 2022 10:18:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D11A340105
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A4DB61BF592
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 10:18:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FDDB40105
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 10:18:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FDDB40105
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bFoPnLMrKUjv for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 10:18:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64920400FB
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64920400FB
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 10:18:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B7A7D240005;
 Wed, 24 Aug 2022 10:18:38 +0000 (UTC)
Date: Wed, 24 Aug 2022 12:18:37 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20220824121837.42e2af73@windsurf>
In-Reply-To: <20220824075542.3637678-1-jesseevg@gmail.com>
References: <20220824075542.3637678-1-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1661336319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQ8xKiKLLteovZBY1Pxt8vJHEh34cvQE7aMuvq8CSwk=;
 b=WThVxDP+zsPyFpCbcwrHJcYwFBm8pakgzzafFpmHPZVQmLcAiJDSDgibhzrSv33eT7n5Ti
 79Z/I9exhQfYhw9BjNo8l3x4IAJ5aMiFYRmMwBF2vguCeHaoOo4rhO069SdhnA0cF5FIMU
 uypKL63xHQzSu6m5yrbBu5NSg2qFVGxV1uLy3rkvX0QU5241PrNeFMY1MNMxRgQ3J/CGWS
 4igXNqwjfF16hTuAMVMxuh5glqgkmkyhMMoONzdR4xn4hLzBJHW+a/WzqwAA1pe+2T+QGb
 PkApJjs1A4cV5BlhGG1iGhTJRSBeeiWxOPGEpKGQd+I6uXjGnmGJGONkRcUTtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WThVxDP+
Subject: Re: [Buildroot] [PATCH 1/1] package/jquery-ui: bump to version
 1.13.1
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
Cc: Simon Dawson <spdawson@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jesse,

On Wed, 24 Aug 2022 09:55:42 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
>  package/jquery-ui/jquery-ui.hash |  4 ++--
>  package/jquery-ui/jquery-ui.mk   | 17 ++++++-----------
>  2 files changed, 8 insertions(+), 13 deletions(-)

Thanks, I've applied to next. What was missing in the commit log are
some explanations about the changes in the license file. We have a hash
of license files precisely to make sure we notice when the licensing
terms are changed, so such changes should not be silently made. See my
updated commit log:
https://git.buildroot.org/buildroot/commit/?h=next&id=86ec2b57f48f90b0d7625c4b2cb25ef7c0047a05

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
