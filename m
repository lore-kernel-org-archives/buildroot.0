Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32300EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D59EB61026;
	Sun, 30 Jul 2023 21:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D59EB61026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M2bc67MsbtJa; Sun, 30 Jul 2023 21:34:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D7C6101E;
	Sun, 30 Jul 2023 21:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17D7C6101E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B5451BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 151C581375
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 151C581375
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VqMTfyYYO9BN for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:33:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 091BB81365
 for <buildroot@busybox.net>; Sun, 30 Jul 2023 21:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 091BB81365
Received: by mail.gandi.net (Postfix) with ESMTPSA id D379140002;
 Sun, 30 Jul 2023 21:33:55 +0000 (UTC)
Date: Sun, 30 Jul 2023 23:33:54 +0200
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20230730233354.3248ac6b@windsurf>
In-Reply-To: <20230521083342.12228-1-guillaume.bressaix@gmail.com>
References: <20230521083342.12228-1-guillaume.bressaix@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690752836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJ/iMxkB5s94VwiGHftx/ZgQUipVWkJV9zRm8VOtpig=;
 b=k/Lxzly0zYnyplacSKGC24dNz4DuiQTgUJQ6zcdjXla03ZfpLm90lMDDJfg6WKPVgwiVdY
 De9mlGqJH6csvStn+Gp4iKA1u7AWK8i1EOk6K+QDixIc0emN4Dj37Ox7YihqzRlI2/mvvu
 zsP4xlFkwCn3+1fSCEs6WDFQZBRI8+P2Mwd74aFjCoaTMlgMCDgd9aOElWRNGOH7WNw0v1
 Cyf3UnitD8FW3cKozmBQVVJsLgSDMtSt91ZigzP/768WjP+hjY4LFsRSSTOSwgg4FM16wk
 Y4I0CbgtoRr4W9n3U4Y0DEoHnRpManciFFpjTQlLgInerNsT7IcmF5okORepng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=k/Lxzly0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pythran: bump to version
 0.13.1
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

On Sun, 21 May 2023 10:33:42 +0200
"Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:

> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  package/python-pythran/python-pythran.hash | 4 ++--
>  package/python-pythran/python-pythran.mk   | 4 ++--
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
