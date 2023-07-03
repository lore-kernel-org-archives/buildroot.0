Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63736C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11D9560BDD;
	Mon,  3 Jul 2023 18:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11D9560BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKhpvKtCzSyP; Mon,  3 Jul 2023 18:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52F8E60F02;
	Mon,  3 Jul 2023 18:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52F8E60F02
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6898F1BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41D3D405FD
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41D3D405FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oSGXHJYEkJjS for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:46:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C31B440420
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C31B440420
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:46:34 +0000 (UTC)
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-GND-Sasl: thomas.petazzoni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE9CC60004;
 Mon,  3 Jul 2023 18:46:32 +0000 (UTC)
Date: Mon, 3 Jul 2023 20:46:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230703204623.46a2cfc7@windsurf>
In-Reply-To: <20230703161812.40064-1-bernd@kuhls.net>
References: <20230703161812.40064-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1688409993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DIvINhDsyXaDDf8KChIVupWFqBgjeuDVRqRKytzGBqU=;
 b=EPKwF8dGh0Zesb1kVRmMuDPjVR6pLxd93z3uFoO7StbUw1uwWVs9LoyijKJPM+wFyml7s/
 wjrPYu11KTc07qi9nU1FE2UB2FoZs10uTvMZMf9CkWKyyytHga8f6Hj5CO+JOSIsTaRFq2
 ejQ7x+dos9D1ISMj3+/4SdoZ00SNsOaOX7nYhRBluWEkqiqayZ+AXSLe7Nb8q6fkfIyXo8
 vfxQ7WhpUCahxQ5NNfZch5oK+fDmO2Tj96p/dUU8TARDQaPe56dOkH3e7jU8dLZt/64mAJ
 V2WLuqMINgg3mmlJrxYKqnb5xo9UKRp/qaXWF0bfeE1bx3YUFqbrsfTvYYJebg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EPKwF8dG
Subject: Re: [Buildroot] [PATCH 1/2] package/libminiupnpc: bump to version
 2.2.5
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

On Mon,  3 Jul 2023 18:18:11 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Changelog:
> http://miniupnp.free.fr/files/changelog.php?file=miniupnpc-2.2.5.tar.gz
> 
> Updated license hash due to reformat of license file:
> https://github.com/miniupnp/miniupnp/commit/af812c877532f2432b0566633e1e539797ef9c13
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libminiupnpc/libminiupnpc.hash | 4 ++--
>  package/libminiupnpc/libminiupnpc.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Both patches applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
