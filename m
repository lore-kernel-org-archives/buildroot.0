Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A48C83F12
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 13:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA03182090;
	Tue, 29 Aug 2023 13:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA03182090
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fgkpXml5jyEt; Tue, 29 Aug 2023 13:03:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04F4C8213C;
	Tue, 29 Aug 2023 13:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04F4C8213C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 25D981BF46A
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E27F82052
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 13:01:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E27F82052
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kDYKjj8H2PK5 for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 13:01:29 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A0EB82047
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 13:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A0EB82047
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9362ED18FC
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 12:57:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F6251C0009;
 Tue, 29 Aug 2023 12:55:30 +0000 (UTC)
Date: Tue, 29 Aug 2023 14:55:29 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20230829145529.5c964b6f@windsurf>
In-Reply-To: <d8ac1eb110bb5c6b9026175c2e52a3cdfa036b7a.1693125341.git.baruch@tkos.co.il>
References: <d8ac1eb110bb5c6b9026175c2e52a3cdfa036b7a.1693125341.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693313732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlgmYoCCt1DXUN0d3wrdocyrcdjoJhMgwvjkXke+4D0=;
 b=dWSCJF0CJoF48TzL8SD7n6p7+U0XzZDn6droiW8J8l6LIYw1bU7Iu2bowJpY9D3/QQ4PO9
 w0IEZUsXTiVHRQ7xuqR2zfSaOlunnoz13J4gaQR36iwYjALyOuRPn3B4rCFiMoyXQhFoYp
 2GW/Rkwf0KUpF6ycsIxgUpGnwrDaCWT+Zys8esMQBv4RuKlra4sWF/fYP3iYhQjjy4Q0Lo
 t8SqBxj8fN3pPMgbmYcRS5AUt8YK3aOyB2YQMrvwvS1IBeXElRXpCqq/l/dQy1xPcErisZ
 yMYx+DtUKSETFUzEszb4F4E7fCMW9ilC1ahN+HMYJ6b7Gtw1DdASYqKDVOKQ1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dWSCJF0C
Subject: Re: [Buildroot] [PATCH next v2] package/daemon: bump to version
 0.8.4
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

On Sun, 27 Aug 2023 11:35:41 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> Update license info. COPYING hash updated because of added reference to
> additional licenses. Licenses for local snprintf and getopt
> implementations do not apply, since this code is not used for Linux
> targets.
> 
> Add Tatu Ylonen Permissive license of the code in pseudo.c.
> 
> Add LGPL-2.0+ license text file.
> 
> Rename BSD-3-Clause text file and update hash because of text formatting
> change.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
