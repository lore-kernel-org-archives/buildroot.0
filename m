Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69928EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 22:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D99B641FE7;
	Thu, 27 Jul 2023 22:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D99B641FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5RCyIwBusiUo; Thu, 27 Jul 2023 22:11:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E504741FD7;
	Thu, 27 Jul 2023 22:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E504741FD7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C61E1BF3D4
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46DA683FFA
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46DA683FFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OHPrBzAqrNxR for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 22:11:51 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31F4A83FF9
 for <buildroot@busybox.net>; Thu, 27 Jul 2023 22:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31F4A83FF9
Received: from relay1-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::221])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id B4E07C9F96
 for <buildroot@busybox.net>; Thu, 27 Jul 2023 22:01:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 53028240002;
 Thu, 27 Jul 2023 22:01:21 +0000 (UTC)
Date: Fri, 28 Jul 2023 00:01:20 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20230728000120.1acf25b6@windsurf>
In-Reply-To: <20230521081610.3495-1-guillaume.bressaix@gmail.com>
References: <20230521081610.3495-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690495281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6um2zX17LZ3jZO4NPHFFlWR7im6AxBOtX8/+gb95tgY=;
 b=DZ/ZuDxKpDCFNWxpxXR7MmBvAUtnIzhwFSoliKYorfiGF/hD05ghfk/YYtzCCORExjXYub
 JaZs9HzJo5ulVVO3JunIUaEk+JGlcwR+nK0AabWtEuZjDrn9EpuBgSvqvMG4P3n8Byid0V
 XcYr8/G/bz9BfK97P7WWF4T/JHocCH2J/JS+Zg7bPjUqOiup9bM6+x7fLqaeNFGYygnajb
 EvEasajVs0py0P4euMA1TsuFwtnqnP1IZWQrWSnIv/Dq4h08zM/cX+WImzgh4hp1AByMTt
 a+3o09yHVJv5C9snStYG15JSRjr4pnAeMCwO4oaEZNsd6QRVFiOAGVdsrJvtCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DZ/ZuDxK
Subject: Re: [Buildroot] [PATCH 1/1] package/libxcrypt: bump to version
 4.4.33
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

On Sun, 21 May 2023 10:16:10 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  package/libxcrypt/libxcrypt.hash | 2 +-
>  package/libxcrypt/libxcrypt.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
