Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25068C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 22:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C824D81E5B;
	Sun, 17 Dec 2023 22:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C824D81E5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Is7R0Iht75Xm; Sun, 17 Dec 2023 22:16:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E86E81E45;
	Sun, 17 Dec 2023 22:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E86E81E45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14E771BF425
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 22:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D33EA812D8
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 22:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D33EA812D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKxx_-yDepZQ for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 22:15:58 +0000 (UTC)
X-Greylist: delayed 1960 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 17 Dec 2023 22:15:57 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B605581409
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B605581409
 for <buildroot@busybox.net>; Sun, 17 Dec 2023 22:15:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2415240003;
 Sun, 17 Dec 2023 22:15:54 +0000 (UTC)
Date: Sun, 17 Dec 2023 23:15:53 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20231217231553.49fbc9db@windsurf>
In-Reply-To: <20231204174119.678774-1-francois.perrad@gadz.org>
References: <20231204174119.678774-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1702851354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lVF7YAdrbZp5xMO20FTQrSZ66orwlmZOseYWIupJ1vE=;
 b=P5mG4+2QymlFwoO1jMvj9Nb/j5KQN5ywG2QmQrFLLWwYv8h+P2fIrpi8QgLOokBlCBSsHL
 YKh0WKdCejXy9qLZmD0gHbsl9l7GZdZhk/bvr7ML+Se+Vh7eqpCCwRYBFj5fx/oUYBzP07
 93k8YOM+WxzkOqJ+cMGrCS+jC1t2UP3UMBu1u/KfKnR1heQBE4f7+QZx0vZY0sEsaSV0Qf
 DyMJvBEyjfrOBdwJsQvazS7Fl9O4q94nygbEU7EUnbmzR0ekjAG3ba4qKYvERr2bs+mumv
 Sq7b1oOjRAT3hjGkXz7v9QJujkjb84K8Xe18VpGxGtQhuwIsefaotnXKkg4Q5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=P5mG4+2Q
Subject: Re: [Buildroot] [PATCH] package/perl: bump to version 5.38.2
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

On Mon,  4 Dec 2023 18:41:19 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl/perl.hash | 10 +++++-----
>  package/perl/perl.mk   |  4 ++--
>  2 files changed, 7 insertions(+), 7 deletions(-)

Applied to master with an extended commit log that explains why the
README file hash has changed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
