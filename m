Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BA3C3DA6E
	for <buildroot@archiver.kernel.org>; Mon, 25 Dec 2023 20:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D750840643;
	Mon, 25 Dec 2023 20:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D750840643
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zTmq_WEP3zFp; Mon, 25 Dec 2023 20:44:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2343408B4;
	Mon, 25 Dec 2023 20:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2343408B4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B08291BF94D
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BCAC40636
 for <buildroot@lists.busybox.net>; Mon, 25 Dec 2023 20:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BCAC40636
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gO0dvyVva2WY for <buildroot@lists.busybox.net>;
 Mon, 25 Dec 2023 20:43:46 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A214C40119
 for <buildroot@buildroot.org>; Mon, 25 Dec 2023 20:43:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A214C40119
Received: by mail.gandi.net (Postfix) with ESMTPSA id A227320002;
 Mon, 25 Dec 2023 20:43:42 +0000 (UTC)
Date: Mon, 25 Dec 2023 21:43:41 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231225214341.2325a0ec@windsurf>
In-Reply-To: <20231214165420.181703-1-james.hilliard1@gmail.com>
References: <20231214165420.181703-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703537022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Chhxi9ck2nYOC55LYUdxpKxDBlpkLZ/W4ySEzWS6Hxg=;
 b=OMPiK9rXpbvUVjsbdOQ9v+YY6GJwA4jPM6H0gJ8in3u72BTco72ICFFDKjCIlBqY2vyqxG
 tKhoEEjblBq9Fm1FOYYKujW+whONoM3IZRQ91u4n8KPqNhbOII3ju8MHRzeBJcqjKGDlmZ
 PiB+93fU9u7yjRFtSceQhiga7ttb1e7ebozSgB3SJzocndRBC+2+cSBJ8W0AXlgdpvQDgs
 7phLpQauDnW6hiedybFfSEeuxjkQHOwauMza3m2XPRiaHmEDMzMGVJa2O/euslTuM/5VMi
 aHYwUBfS1SO3XlpBRTPVh8oe6PDJJP63zgQ+CgAJbaaI55D0O96j5sXX8A+1BA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OMPiK9rX
Subject: Re: [Buildroot] [PATCH v3 1/8] package/python-typing-extensions:
 bump to version 4.9.0
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
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 14 Dec 2023 09:54:13 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../python-typing-extensions/python-typing-extensions.hash  | 6 +++---
>  .../python-typing-extensions/python-typing-extensions.mk    | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Thanks for the contribution, entire series applied!

Ideally, one thing that I would really like to see are test cases in
support/testing/ for all those Python packages. It's usually not much
effort to write one, by just taking a simple example from the python
module documentation, and throwing it into a very dump and simple test
case. But this allows to ensure that all runtime dependencies have been
accounted for, at least for a minimal usage of the package.

Thanks a lot again!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
