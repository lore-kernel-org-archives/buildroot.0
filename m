Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9089C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6412D84D02;
	Wed,  1 Nov 2023 17:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6412D84D02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQPl-Rn1Q4O0; Wed,  1 Nov 2023 17:53:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC06884D54;
	Wed,  1 Nov 2023 17:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC06884D54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CEC01BF280
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5440F431CB
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5440F431CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ZfJFSmCOAvV for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:53:44 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25FA0431BD
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25FA0431BD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 322DE40002;
 Wed,  1 Nov 2023 17:53:41 +0000 (UTC)
Date: Wed, 1 Nov 2023 18:53:40 +0100
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20231101185340.082af24e@windsurf>
In-Reply-To: <20231031230709.60348-1-brandon.maier@collins.com>
References: <20231031230709.60348-1-brandon.maier@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698861221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MzS+wm03xFmVJ3lVM9+RW49RUNqizB6WcqFPDxE5RGA=;
 b=aCLrFnhiW8XRI7c6eZRQDNQwdqi9fphBc+eqwvzkXIYmDpTvSh5g3DnmxF9pDHa2l+1+3M
 YIPtzb7gK/YuVs/gte5tySvSLROqQchtEPzTCyBH4i4/wi6ZXtp9iLUbOFjSHx9Y9d5L3P
 R9fwoLR9xqniUgAZRrhwosVz07ldBIe2eXFewjD5w+DgFaYHap+SESYIO9hdts3ryWNVHL
 lLBaP2pAogpUre0XH8xO09fRKRYAbFNU8MoQM4GoSdvwG7heL+7pXJX4Nj0glYR0NY2rMS
 q23/q1o9DHq9nR8g05KGl0NXswcnjEMP1eh08TAt6WyRYdsWQIOipitSQAvkBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aCLrFnhi
Subject: Re: [Buildroot] [PATCH 1/1] package/libgdiplus: bump to version 6.1
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
Cc: Kalpesh Panchal <kalpesh.panchal2@collins.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 31 Oct 2023 23:07:09 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> From: Kalpesh Panchal <kalpesh.panchal2@collins.com>
> 
> - bump to version 6.1
> - updated makefile to download source from
>   https://download.mono-project.com/sources/libgdiplus/
>   instead of github to avoid submodule build error
>   from ./update_submodules.sh
> 
> Signed-off-by: Kalpesh Panchal <kalpesh.panchal2@collins.com>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  package/libgdiplus/libgdiplus.hash | 2 +-
>  package/libgdiplus/libgdiplus.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
