Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F3FEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 20:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6260C83611;
	Tue, 11 Jul 2023 20:07:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6260C83611
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vfKEnSBurwLm; Tue, 11 Jul 2023 20:07:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F7A9835A9;
	Tue, 11 Jul 2023 20:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F7A9835A9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5ABDD1BF420
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 20:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 344B041508
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 20:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 344B041508
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3pd-eLTKhXSk for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 20:07:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20433402A7
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20433402A7
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 20:07:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DFE8C0002;
 Tue, 11 Jul 2023 20:07:38 +0000 (UTC)
Date: Tue, 11 Jul 2023 22:07:38 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20230711220738.0f55c872@windsurf>
In-Reply-To: <20230710211519.3247870-1-giulio.benetti@benettiengineering.com>
References: <20230710211519.3247870-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689106059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MdtNxpn42KtGVvTcTjLeW7SPjKwxt5nCzF37xgeDV14=;
 b=XkVSOSPe8BfZeKP9Onhfcjz+OCJil4i0WTYdUdr/KVQn2z57ZGLY8JZ4v3/SAhbwU2VSj4
 DzqDXV0QBx1r84LBpVv7We745EUqjBH8fQLlRnKp1AnTDyf97Gec8EwBg5Qg62aNXzQKM0
 TkUg5aar5McUKFTME+2qdaiOHQubQQEfRhYe7QBjGH1/X+QOT1rGU7HFlB6zzx2AYVBcsP
 6oWjnv8ArKw79ncBv+ZcQPmGcBtq0juAOtJH9qIecBjsIPfb5UW1UKxldsqsZESKM02uSP
 8K+AcKseohcHv8fnLFwO9kRntiHb9eghZhA/cRa1Vm7oDczV7Ts1d9zsPbtUTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XkVSOSPe
Subject: Re: [Buildroot] [PATCH] package/mali-driver: bump version to
 2023-07-10
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

On Mon, 10 Jul 2023 23:15:19 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This version fixes build failure with Linux 6.2 and 6.3
> 
> Fixes:
> http://autobuild.buildroot.net/results/0c043a6978fc5ea51b2c7a862de288223589926e/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/mali-driver/mali-driver.hash | 2 +-
>  package/mali-driver/mali-driver.mk   | 2 +-
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
