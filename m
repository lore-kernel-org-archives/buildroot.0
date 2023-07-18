Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF95EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 808B060C2E;
	Tue, 18 Jul 2023 20:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 808B060C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WnS50OZfYTpV; Tue, 18 Jul 2023 20:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B74BC6102C;
	Tue, 18 Jul 2023 20:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B74BC6102C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C95511BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A308240589
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A308240589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NAR51vPZcQAk for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:40:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7198A40280
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7198A40280
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:40:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C394C0003;
 Tue, 18 Jul 2023 20:40:35 +0000 (UTC)
Date: Tue, 18 Jul 2023 22:40:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230718224034.5346aab7@windsurf>
In-Reply-To: <20230716110124.3810298-1-bernd@kuhls.net>
References: <20230716110124.3810298-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689712836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yuy4zBtZx9vddgo7ciri+SzrOXEe7i8/V4LscV/NtJs=;
 b=XhJ7Lpj+/CvjvzHnv3FA8t2SVkj9JkOOours3D4pfG1Xo0dVxg6eTwkFT5niGFGKtfEfH6
 JtoIcGUqPdgtMjxtiUoKFq3aWHfzAj+TYHOsKkJdhsw44RZJgzac0ZFycyru//yD1Ce2EA
 q+bMrfxc58RHihcn48WiVXSA855qUuSH+WXJUuu5cViDTkM3ifM+FMvjOIdGCeIIqRNkOV
 U0Xw5xr2ROMLjoGkxzwhj5AdRbwJv03QsP0mK453xc+IeWtADnSnb5ewETlLC5o9+KYVgA
 WN2CiPRCQGrX2pIVe4kjT16L0be6pfxmtxnZBE3b8ROJZpfKavnuaB+/4aRD6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XhJ7Lpj+
Subject: Re: [Buildroot] [PATCH 1/1] package/git-crypt: fix build with
 openssl 3.x
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

On Sun, 16 Jul 2023 13:01:24 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fix was proposed upstream: https://github.com/AGWA/git-crypt/issues/290
> 
> Alpine Linux uses a similar fix:
> https://git.alpinelinux.org/aports/commit/community/git-crypt/APKBUILD?id=25b42ad7711b08c63aaf3c24af80a4bcd7607817
> 
> Fixes:
> http://autobuild.buildroot.net/results/dfb/dfb5da218bb323edc57cc609c2b75d5fbc6e1fd1/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/git-crypt/git-crypt.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

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
