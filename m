Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DCB1C83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 19:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD65781F55;
	Sat, 26 Aug 2023 19:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD65781F55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cGVVDGNtH7ww; Sat, 26 Aug 2023 19:51:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A1DE81F47;
	Sat, 26 Aug 2023 19:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A1DE81F47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A1A11BF82C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4355981F69
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 19:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4355981F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R1kZo3Htlrcm for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 19:51:03 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C50081F77
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 19:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C50081F77
Received: by mail.gandi.net (Postfix) with ESMTPSA id B17E9C0002;
 Sat, 26 Aug 2023 19:50:59 +0000 (UTC)
Date: Sat, 26 Aug 2023 21:50:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230826215058.7afe2f04@windsurf>
In-Reply-To: <20230809181925.1345919-1-bernd@kuhls.net>
References: <20230809181925.1345919-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693079460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9iYlMQBAfKaUDCLxmBvDceDFwaW0PeVHfI39VTJgOjo=;
 b=NTLbL7fHcMWdcXjlisTTBkpJ7K+KEWHlC0gvJotE0/HQvPMaQXUOH9jbCUuayPRw9jrmod
 IoVnXxGbAlBR4FxhKjINpgE0/IcWbWaddoUIIRyb7tUrgqvPFgz1mAey7ucJm3l0BhLU6o
 W1N+7TYRiBkBPWRHYLVZtQPqBWWbZe39/ZlbzYHW1zvInik8vX69e5141W/0BMkC8fwabo
 KXpHYmuyHtMqwCFbqHn10KLkoON+7AE53bmNUKnOZWHJopXmT7o8FwsE9f/h1ns0jUIRVs
 1cbovMgYWJ89SL+ALLBjTVypd2dYA2smfAtObDv3vaPegEquwAKVZ6YH+pz6uA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NTLbL7fH
Subject: Re: [Buildroot] [PATCH/next 1/1] package/i2c-tools: switch python
 support to setuptools
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  9 Aug 2023 20:19:25 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Add upstream patch to make package compatible with python 3.12.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...-Use-setuptools-instead-of-distutils.patch | 38 +++++++++++++++++++
>  package/i2c-tools/i2c-tools.mk                | 10 ++---
>  2 files changed, 43 insertions(+), 5 deletions(-)
>  create mode 100644 package/i2c-tools/0001-py-smbus-Use-setuptools-instead-of-distutils.patch

Applied to next with a slightly improved commit log, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
