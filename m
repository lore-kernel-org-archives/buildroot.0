Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1322BC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F67082333;
	Tue,  6 Feb 2024 12:57:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nihA722ZcC-P; Tue,  6 Feb 2024 12:57:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 842D682355
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 842D682355;
	Tue,  6 Feb 2024 12:57:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7265D1BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4675A60B9D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4675A60B9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G_0hiZBrqQSE for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:57:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41C4960B9B
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41C4960B9B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84DFEFF806;
 Tue,  6 Feb 2024 12:57:22 +0000 (UTC)
Date: Tue, 6 Feb 2024 13:57:22 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240206135722.4bc82ab3@windsurf>
In-Reply-To: <20240110040343.1025210-1-james.hilliard1@gmail.com>
References: <20240110040343.1025210-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707224242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tHvnQa6ofHGzM7/KlIAPe7peifAApfog3QMCT3kjWXU=;
 b=Haxk7sIIwkwn+QIdrOtUG50nCMerh7nqxlP0RNX75tnK8Ot5+z+IYUMi3ThCvkNtGFUj5z
 DUAY33ncpDPF2BSQrCRrN3Lvh695Z6THh/O0bA2Se4yTzOdBNKj5CT/YdpiBTVJ0UBmK1F
 MIr95pdKwG1s3ZYsK4uDo8cZSDp5NO2HFW83Nc7TPQ2uEyunBdQ87M4ut/gvuqPM4xItlp
 tBd7xc1h//4vEV5+9RZpPS2yK8AfY5813PvG7qlM1JGsl9tr7aJ4QkRhBY9Rthda3v5Gpu
 9BKOfSOugjvLgGC4Jg+vdS2MlAYKUcF9+RzLPZ+vIPzyN9NcUVxmhIDXqxOqmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Haxk7sII
Subject: Re: [Buildroot] [PATCH 1/1] package/python-more-itertools: bump to
 version 10.2.0
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

On Tue,  9 Jan 2024 21:03:43 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-more-itertools/python-more-itertools.hash | 4 ++--
>  package/python-more-itertools/python-more-itertools.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
