Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F99C27C40
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 18:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C7C341605;
	Thu, 24 Aug 2023 18:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C7C341605
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fheJ0QAKzQfE; Thu, 24 Aug 2023 18:57:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E5A4415B9;
	Thu, 24 Aug 2023 18:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E5A4415B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF2281BF853
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C767860F77
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C767860F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6S-ttsoja8Ur for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 18:57:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4ADE460F69
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 18:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ADE460F69
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D97D1BF204;
 Thu, 24 Aug 2023 18:56:59 +0000 (UTC)
Date: Thu, 24 Aug 2023 20:56:56 +0200
To: Frank Vanbever via buildroot <buildroot@buildroot.org>
Message-ID: <20230824205656.23594903@windsurf>
In-Reply-To: <20230823145300.1499071-1-frank.vanbever@mind.be>
References: <20230823145300.1499071-1-frank.vanbever@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692903419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GmbknuZecC76dXuIExRSQBhJOHpD7YKclq9hgcEqufU=;
 b=j72dk1Pj6ZLsYHRJu0yIUOyKNF/k/fRI6il2m+25cCM6v0i7SzBN3O2NdrBB2absIvU1FQ
 aun0WsE9aZb7OdgMQAW1l5MyO+Pzj9MJCZUI4fA9tzAoGAULT8P3exkg5T7pFY5y68jHOu
 /lPdGTbUyeotr95svjh+OHg7Eyppd9lQ/LOQg4kQ/y9uUIdbNVqdM9OxbCxM4getRE74g9
 9uoOBV4i0/9KKom+E4Bc8Z6XqGccNogklpOkQLPDdKTbbaIfZmWI5VfqT6nywwvKfqb476
 l31Je8MzuKf8Lw73uxyQ94d/+p7qwr0ZXwFglJjkMzJGDdlEtMuUdHNFNOcwxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=j72dk1Pj
Subject: Re: [Buildroot] [PATCH 1/1] package/libmodsecurity: security bump
 to version 3.0.10
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
Cc: Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Frank,

On Wed, 23 Aug 2023 16:53:00 +0200
Frank Vanbever via buildroot <buildroot@buildroot.org> wrote:

> - Fixes CVE-2023-38285 [1]
> - Adapted 0001-configure.ac-drop-usage-of-git-at-configure-time.patch due to
>   upstream moving to autoconf portable shell constructs.
> - Added missing Upstream comments

I've applied to master, but after dropping this part. Indeed, I think
adding "Upstream: N/A" to "resolve" the checkpackage warning is really
not useful. What's useful is to submit the patches upstream :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
