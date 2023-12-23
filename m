Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88072C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 20:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1148F4086D;
	Sat, 23 Dec 2023 20:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1148F4086D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPZ_ABdrF2_9; Sat, 23 Dec 2023 20:35:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A304418AB;
	Sat, 23 Dec 2023 20:35:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A304418AB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2011BF47E
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA0AA4014B
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 20:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA0AA4014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NfjZOxB0b_bx for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 20:35:43 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CCDF40148
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 20:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CCDF40148
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1F0B2FF803;
 Sat, 23 Dec 2023 20:35:39 +0000 (UTC)
Date: Sat, 23 Dec 2023 21:35:39 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20231223213539.277501ec@windsurf>
In-Reply-To: <20231204211622.12687-1-bernd@kuhls.net>
References: <20231204211622.12687-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703363740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NcjEPGMo/DmtneeuJQ25BhAZxmfpgWxRkTFC31CHbEI=;
 b=JKFVhYCNOc5sjBa0xIV14PRQZsgaurQZTFNEKSxzY89gLqjXzCE1rJ4l/YeTp3P3ftdZ49
 wy7xfmpy72wa81vUuTq3j45WpbOOGK18t6hFHe745YI7Hq9GvyrMAKbnnibs+zmRk45JWA
 7nZN435qmCZ/gRlH5JpNg8L3N5kbzhtkpfjnycFVCuS6GJXLJD3m3Pw3ggWoBmxH8jRw/7
 zaSzI3iDFrgrnvq6BNWYSMDJYN0fbVG3AfFM4J+lzu7iMPH6oniriMU3CLOwf84LwaBx/t
 tfDwsKDpui6+rcNd2RrFJpUun44t33+BmQkyRZSrc/xEZiqZyGHDIVraSMha9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JKFVhYCN
Subject: Re: [Buildroot] [PATCH 1/3] package/squid: fix build with
 libxml2-2.12
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  4 Dec 2023 22:16:20 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...0001-ESI-Fix-build-with-libxml2-2.12.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/squid/0001-ESI-Fix-build-with-libxml2-2.12.patch

Applied to master after changing the patch to use the patch that was
applied by upstream (it is mostly the same, just with a slightly
improved commit log). I also changed the Upstream: tag to point to the
commit accepted upstream. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
