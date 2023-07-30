Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDCDC001DF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D37360B9C;
	Sun, 30 Jul 2023 10:27:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D37360B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2W4NZA9QyXel; Sun, 30 Jul 2023 10:27:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE4F860B99;
	Sun, 30 Jul 2023 10:27:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE4F860B99
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D6C41BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6E1481E16
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6E1481E16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MUTN-0XJRS6J for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:27:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCCF381E0F
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:27:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCCF381E0F
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88212E0002;
 Sun, 30 Jul 2023 10:27:27 +0000 (UTC)
Date: Sun, 30 Jul 2023 12:27:26 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230730122726.7ce47fcf@windsurf>
In-Reply-To: <20230708200447.3919009-4-bernd@kuhls.net>
References: <20230708200447.3919009-1-bernd@kuhls.net>
 <20230708200447.3919009-4-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690712853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fd5OdAW5gKw6uik7mHDNNGRcF9FpGPHIDG5rPUCZTK8=;
 b=cZuze7iA7DWtEWC6xO8gbegJAMvAMUnt0gp1TXIfhwHcZ7hiy4a/U1OXrAsIqetllOQ/VF
 q5XhI+6lrxdCwd1N3W87BGVfULdIsR3mYcS5oHq8fEu4VxjclzLClEBPzcuaOTuGnedRP3
 8KvEy+IE5z/QhF9tziXE06vlLZmRYF8GGYkuNAA6TcHDvPLxvRT5210mjG+vWIG71V7qOx
 49SZh23tyTodZ3ybRBLFvNt3LNgf0r6E7Syg8gSTb34pkXFc75q/1ETuILAqwYqRvKSkTF
 f+3e3ZTssU3W2WNsQpGuTnrbUiKP+beOPku0q2YR/sHo5OPjxCZ5JAiZT/xRMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cZuze7iA
Subject: Re: [Buildroot] [PATCH 4/7] package/imagemagick: add optional
 support for libheif
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
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  8 Jul 2023 22:04:44 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/imagemagick/imagemagick.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

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
