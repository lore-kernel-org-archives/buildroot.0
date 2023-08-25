Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A666DC3DA6F
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 17:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E5CA600CC;
	Fri, 25 Aug 2023 17:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E5CA600CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Le-y-SnTXgaO; Fri, 25 Aug 2023 17:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BAA661068;
	Fri, 25 Aug 2023 17:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BAA661068
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E47191BF35E
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9FBB83C69
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 17:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9FBB83C69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oaaDDRCm9LfL for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 17:18:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC22D83CD0
 for <buildroot@busybox.net>; Fri, 25 Aug 2023 17:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC22D83CD0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76498FF806;
 Fri, 25 Aug 2023 17:17:56 +0000 (UTC)
Date: Fri, 25 Aug 2023 19:17:55 +0200
To: Bagas Sanjaya <bagasdotme@gmail.com>
Message-ID: <20230825191755.56ed4108@windsurf>
In-Reply-To: <20230825124238.294533-3-bagasdotme@gmail.com>
References: <20230825124238.294533-3-bagasdotme@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692983877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qduP35HXIa9/A0kqqD+Z/ui6DHTvAj5coF2HINR2TxA=;
 b=H7VL2nGPc0PwvMkXQ9KGtJEbWYXo4EKBVfcKP3yV8Cz+MWnZ2ZtjJDjjQSQIQnaQxJWxhP
 RzBBVf51jdK9cJF121EktPai280rNjJU8TWIZmqGeMOEScKsQmSO9xdipz9KM0VYfS22ar
 ss/w6/dBAbQm/VC06gOw2E+4QeUipcqljk0Nbq0/LNhw1yBmXuu9ujO2WrUMry+vett7nH
 5wFKfiBrGhTUmv9V7zcbxddrYGyAvs26VcecDk64cMNsE9Cy6eki3Ei82kIsocpa4tHKm9
 9OoKu8vCyCpoE4s8QfrjJRHX7o/K+O52HBZuYhIp7bQXEj+c2AGG2oZ9qzViNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H7VL2nGP
Subject: Re: [Buildroot] [PATCH] package/git: bump to version 2.42.0
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
Cc: Buildroot Development <buildroot@busybox.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 25 Aug 2023 19:42:40 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> Bump the package version to 2.42.0. For the full changelog, see the release
> announcement at [1].
> 
> Link: https://lore.kernel.org/git/xmqqr0nwp8mv.fsf@gitster.g/ [1]
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  package/git/git.hash | 2 +-
>  package/git/git.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
