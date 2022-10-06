Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DF2C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2CCC40D7B;
	Thu,  6 Oct 2022 18:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2CCC40D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Og2S7zp_mNn; Thu,  6 Oct 2022 18:47:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D44640BA5;
	Thu,  6 Oct 2022 18:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D44640BA5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BE6C1BF3D2
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 18:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 378B683F82
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 18:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 378B683F82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wSROhl2mT7Cl for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 18:47:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2F5783F7C
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2F5783F7C
 for <buildroot@busybox.net>; Thu,  6 Oct 2022 18:47:31 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E314C100002;
 Thu,  6 Oct 2022 18:47:29 +0000 (UTC)
Date: Thu, 6 Oct 2022 20:47:29 +0200
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20221006204729.54665188@windsurf>
In-Reply-To: <20221004073233.1665-1-mf@go-sys.de>
References: <20221004073233.1665-1-mf@go-sys.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1665082050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CaYqn+0xEH2LfQDacoLrCa00qGKjBEPksmvnl8RDeQ8=;
 b=gaHcFQapDBf9lvlsHkGm5ccoTl6O+GPJ21nUfJKPm9YE+cArXXExDmANQXGDMXfCUxvGOu
 hAq78Cjbr0b3X6z2R8X39LZlk+1Oeyxbo/4gilUrsGR+wHUHQRv0cAlKeLzxue0lzP8psI
 Grqfwp40eCr8XSUcSVT0kcCOFvvjoLefxJmBEE2/mWjxSvCYSUApF752ZyLc6B88IfZOdx
 uN0jTUVobPHg2DaU7pKFKdT2I5k+p6iknknVS3v6tJNkOm8zxG/QJ1swtTkQxaVTBof/r6
 ZGlXXF9OC4dnMqabsoCCZRi64MMwCAXxtpyZ863X2VO+LU/fY56xX7+uRuk55g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gaHcFQap
Subject: Re: [Buildroot] [PATCH 1/1] package/gnuplot: bump version to 5.4.5
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

On Tue, 4 Oct 2022 09:32:33 +0200
Michael Fischer <mf@go-sys.de> wrote:

> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/gnuplot/gnuplot.hash | 8 ++++----
>  package/gnuplot/gnuplot.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
