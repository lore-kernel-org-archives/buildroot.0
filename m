Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50EFC19F2B
	for <buildroot@archiver.kernel.org>; Thu,  4 Aug 2022 08:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D2CF8142F;
	Thu,  4 Aug 2022 08:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D2CF8142F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 62-TWKUAGhOY; Thu,  4 Aug 2022 08:02:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7E5B81409;
	Thu,  4 Aug 2022 08:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7E5B81409
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3397A1BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 08:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BCD581409
 for <buildroot@lists.busybox.net>; Thu,  4 Aug 2022 08:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BCD581409
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5iMaYnJtlby8 for <buildroot@lists.busybox.net>;
 Thu,  4 Aug 2022 08:02:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD3CB81405
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD3CB81405
 for <buildroot@busybox.net>; Thu,  4 Aug 2022 08:02:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5E2CC60014;
 Thu,  4 Aug 2022 08:02:47 +0000 (UTC)
Date: Thu, 4 Aug 2022 10:02:46 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220804100246.354814ca@windsurf>
In-Reply-To: <20220804071504.4062-1-guillaume.bressaix@gmail.com>
References: <20220804071504.4062-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659600167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4ICFbZb8maML4wyTMJ6MluoczEd/Z72KAuJdQmBxeM=;
 b=XGE88U407j4PeFOn+V4wVwCtCbWFx8TT3EhsHtYXUQMFvpNu3IgrojuRsR2efwqdB6YvB+
 iFI6onay+ATckow/zRDMkfabTq9cidP1Oxg8bTcP9XhG/0yebTtIIJV8fWyfb6L84kQ24y
 v6oUxA9Q3pAhoSoOH9qgcT5+tYIJqwq0vJEaQqV86YVBW/RjWd9QD+/FuH1fcgfGvdmIvi
 PBfFv7lEg6Vm7eNOyZdp4EFuCW/CkyoTZXWPoRUN9nKYlhsCudWacscfPTpvioJqaD4DtO
 R3WvgWOrAp1ydWH9wHO0cLtklJxcdxnYiWyLsIvfOjXxNLbCS/lJs0GDPXAroA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XGE88U40
Subject: Re: [Buildroot] [RFC v2 1/2] package/pkg-meson: scipy needs fortran
 cross compilation
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

Hello,

On Thu,  4 Aug 2022 09:15:03 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> ---
>  package/pkg-meson.mk                   | 2 ++
>  support/misc/cross-compilation.conf.in | 3 +++
>  2 files changed, 5 insertions(+)

This needs a non-empty commit log + your Signed-off-by line.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
