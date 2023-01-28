Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BED7C636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 22:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA81841634;
	Sat, 28 Jan 2023 22:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA81841634
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b5ILNfdUM3lW; Sat, 28 Jan 2023 22:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A17E341615;
	Sat, 28 Jan 2023 22:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A17E341615
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04A651BF44C
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D22EF81DFB
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D22EF81DFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJVq0LaMCSQ3 for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 22:27:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C3EB81DFA
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C3EB81DFA
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 22:27:19 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 98BB960002;
 Sat, 28 Jan 2023 22:27:16 +0000 (UTC)
Date: Sat, 28 Jan 2023 23:27:15 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230128232715.3a2960d6@windsurf>
In-Reply-To: <20230117041610.3236462-1-james.hilliard1@gmail.com>
References: <20230117041610.3236462-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1674944836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abm7G+Jx5MpaM59RN+xGjXkz61r4qNEIUkMLhEiri54=;
 b=aH1qQbINV7FeGBLXxn1yyH4WOQ3pFZGIQ4rcd5QNYAKQXfe0DuLY8RTCffmU7Ocrp9IsR8
 nFOV0SgefTipnvrox465bUoRQmtoBLwYiLvHk+s13OqR+GME9sqn/80gm7OhNNACLicZa6
 ijyWBnMzqKt3ODJlj4itOW/py0FJIR7fxWtHVTXMDkQ5Q5qVfdIqTuXGcibEOPYZ/dCDA2
 4h/86DlDahWkd5Tm6Y++wvFsVWa2++AIboNWzYqagDysirae5cm5fzccKI+mlMu5iFcYJd
 p+0eOEm3IdUHxS7sVOs4kOxRmYs0+iJvDJiK2T/p1MGvZeZOFTX/nPWPj/XT5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aH1qQbIN
Subject: Re: [Buildroot] [PATCH 1/1] package/python-uhid: new package
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

On Mon, 16 Jan 2023 21:16:10 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> This package requires CONFIG_UHID kernel support.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  DEVELOPERS                           |  1 +
>  package/Config.in                    |  1 +
>  package/python-uhid/Config.in        |  6 ++++++
>  package/python-uhid/python-uhid.hash |  5 +++++
>  package/python-uhid/python-uhid.mk   | 20 ++++++++++++++++++++
>  5 files changed, 33 insertions(+)
>  create mode 100644 package/python-uhid/Config.in
>  create mode 100644 package/python-uhid/python-uhid.hash
>  create mode 100644 package/python-uhid/python-uhid.mk

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
