Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260E8EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB1C8407B;
	Thu, 27 Jul 2023 21:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEB1C8407B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aPCmw7CTGfBk; Thu, 27 Jul 2023 21:29:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DB1B8407A;
	Thu, 27 Jul 2023 21:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DB1B8407A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DDF51BF414
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 318FE41EE5
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 318FE41EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mO-oZrQDsfDA for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:29:29 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF15241EC2
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF15241EC2
Received: by mail.gandi.net (Postfix) with ESMTPSA id E87671C0003;
 Thu, 27 Jul 2023 21:29:21 +0000 (UTC)
Date: Thu, 27 Jul 2023 23:29:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230727232921.111c85f6@windsurf>
In-Reply-To: <20230727162425.3304117-1-bernd@kuhls.net>
References: <20230727162425.3304117-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690493367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sdFONa6gYmh0Ay4F3YNTshmMRUh84n4c1AvrdomnSqk=;
 b=HmqOiMMbVAU2hPXy/AYR3c6yEFz67BEoJ90JbHpS85IC7BvCa2GvZ36sG4r4Zun4pfBHyC
 /YQYK4f7fyb2x3td57bdpAEIfn7whoo7D5J8B6TUV3iDlXV2SimnsQHctr84NoD/x271fh
 SmVQxuUvL0biofWnmfseVlQXhSjYVPbAtJTCaE4aPihzFGKkfKJ9cHcq3Wl6sqgK1oziFR
 YOb8zi4mDkCNn7FPB1Lwxl6JK29F7ab4fAspDH1GXs33W/E9Xr0EAUvEP79uInXQmZv0SM
 pS/TiyWs2Ufvd3AsZGKwpYkRrylWXcEtZOfwnvnnqjNvLMVUuFd6TifioPsFXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HmqOiMMb
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: bump version to 8.2.1
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 27 Jul 2023 18:24:25 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog: https://curl.se/changes.html#8_2_1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libcurl/libcurl.hash | 4 ++--
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
