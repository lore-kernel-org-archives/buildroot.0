Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E81C0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07DD380E3B;
	Fri, 28 Jul 2023 19:18:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07DD380E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JqJ4Uj4kSWc6; Fri, 28 Jul 2023 19:18:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5310B80CD0;
	Fri, 28 Jul 2023 19:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5310B80CD0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED8D01BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C653B42172
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C653B42172
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1sxvpJ9F67S for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:17:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67BCF42171
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67BCF42171
Received: by mail.gandi.net (Postfix) with ESMTPSA id 16C7120002;
 Fri, 28 Jul 2023 19:17:44 +0000 (UTC)
Date: Fri, 28 Jul 2023 21:17:44 +0200
To: Christian Stewart via buildroot <buildroot@buildroot.org>
Message-ID: <20230728211744.09250704@windsurf>
In-Reply-To: <20230727232235.449788-1-christian@aperture.us>
References: <20230727232235.449788-1-christian@aperture.us>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690571865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5MFhrmmuw/Zv3gUK3Vn97vglJLFvB6Zo3SFeyzom0UE=;
 b=UJqKyc6zHVWxpyTXdtQNXXRN+dOGRbTmP+7oZbxdj0sVJXwGQN/fljk05UoeTdShx7NNPH
 xMJO8v/FlXNeGWAm7W9rhxBhSOJ//ZMx2q8W6qwngsTGFvrTY310shE8rZjy+Gbf2BR6Oo
 tNr1RnUu0cL51c8L788+F8gKbnQ8zMzeHGcfEQMQO48uc+1yDUcqC9b8hO6RUr8t0I8AhC
 5fXmeYesWuRw5HiMlRDP5bGxUzZ0mOPXsTs2T5smc9TzaNCi74lkfVPRtnHBEGf26T6Q+Z
 36xWShFwN7s5ZVzf7GwSFKr9mNZDJW4qusetw62IfDlmsjs2lkW9Z6TgTClZbQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UJqKyc6z
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.6.22
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jul 2023 16:22:35 -0700
Christian Stewart via buildroot <buildroot@buildroot.org> wrote:

> Bugfixes and updates.
> 
> https://github.com/containerd/containerd/releases/tag/v1.6.22
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>
> ---
>  package/containerd/containerd.hash | 2 +-
>  package/containerd/containerd.mk   | 2 +-
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
