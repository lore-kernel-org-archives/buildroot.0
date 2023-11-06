Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21042C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 22:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC203410BA;
	Mon,  6 Nov 2023 22:34:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC203410BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jAlGa1--ZT4R; Mon,  6 Nov 2023 22:34:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEEFC42179;
	Mon,  6 Nov 2023 22:34:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEEFC42179
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33E521BF271
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B1E6415C3
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 22:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B1E6415C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09mac7eEMdbH for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 22:26:07 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1101415CB
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 22:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1101415CB
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED18360006;
 Mon,  6 Nov 2023 22:26:04 +0000 (UTC)
Date: Mon, 6 Nov 2023 23:23:31 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231106232331.0cd856d4@windsurf>
In-Reply-To: <20231105075313.2889997-1-james.hilliard1@gmail.com>
References: <20231105075313.2889997-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699309565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/hUf3TLba6NS93L1J9pbq3IptixgRp1hsFCLsSVuCek=;
 b=Ert8ufc5MSrOnsYSe0MGqWVhjdLaodTwKczoVXo4EZk7URAvbADhtgJEWhHXzuxKDq5+/v
 PaBtzdPrHrS4OzOMMVKRQqeq1dwdzwUpL/zQ3M/PEfGQMb7CD0HMr4jOlznb38PFUIuptx
 htgfHX8BUWxvVZ9SbjZB+l4luIDTl6veTacdkHif/tPW19ZRhvcEtUoFWmtwzPPXr2944v
 GpLw5yaT7h1Fb6CRw15rWJuJfoAAn2YElNAGLWKt3vLTuONDEADi9fIi4q7KtrH5rQXct+
 t5grkbQVW6d39YpSjd5oZcFgYKUwFdeEHOtMCY71N30NYz75sCTgj9RUfgLMSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ert8ufc5
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.17.2
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  5 Nov 2023 01:53:13 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Drop no longer applicable CVE-2023-24816 ignore.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-ipython/python-ipython.hash | 4 ++--
>  package/python-ipython/python-ipython.mk   | 6 ++----
>  2 files changed, 4 insertions(+), 6 deletions(-)

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
