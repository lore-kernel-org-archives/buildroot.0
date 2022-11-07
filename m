Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3065AC433FE
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 22:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB6C140635;
	Mon,  7 Nov 2022 22:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB6C140635
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0SaSs8UF4Rf3; Mon,  7 Nov 2022 22:19:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EE0C4063E;
	Mon,  7 Nov 2022 22:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EE0C4063E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0149A1BF25F
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C444981A18
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 22:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C444981A18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wNir289KDr5i for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 22:17:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C018781A27
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C018781A27
 for <buildroot@buildroot.org>; Mon,  7 Nov 2022 22:17:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C81BA40004;
 Mon,  7 Nov 2022 22:17:42 +0000 (UTC)
Date: Mon, 7 Nov 2022 23:17:42 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20221107231742.028247ea@windsurf>
In-Reply-To: <20221106151746.4043006-1-james.hilliard1@gmail.com>
References: <20221106151746.4043006-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667859463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pAcKm6moEZhQaBhzvS6u/RbJMxVvu/iEpmIomfMyppU=;
 b=dj6/J465FMrG+53x01NqdnXrMU4WD91XUicvtI3TwQNqwtbdgSAy28ZdlrTMbTUaIaBUsP
 T/pNyj7RJWqe8cAIMgeE/Z307aDWbfla9mm3KhsmiqXQ2ME/IUlaqZeru1KbI5gk4sWQIx
 TIh5WVDaIG3fNcYaJoiEQs3VLy5JOmG6ARwaf6sO13/uX32392ZosLhWTNBY7a+ujLLBvr
 +XeEzvSBz+n2CpGuA9b6L3fGPm9r+NINVlc0VeWICY1RJJJwb1TuMAGWy9x1+LjBLco3B5
 1wmLs2uOdnGjzMaXrF1N12mI+i2eIuhXRCLK2YizbRAdixdjh21/lfV9eAZNEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dj6/J465
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to
 version 65.5.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  6 Nov 2022 08:17:46 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-setuptools/python-setuptools.hash | 4 ++--
>  package/python-setuptools/python-setuptools.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
