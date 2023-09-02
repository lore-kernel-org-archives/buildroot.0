Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DABCA0FF8
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42E92404D4;
	Sat,  2 Sep 2023 07:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42E92404D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0LiYfUvWgm3z; Sat,  2 Sep 2023 07:41:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AF21404F9;
	Sat,  2 Sep 2023 07:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AF21404F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 401841BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AE7A41FF0
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AE7A41FF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pebsv2dKezP4 for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:39:17 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6F4741FEE
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6F4741FEE
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0344D240002;
 Sat,  2 Sep 2023 07:39:14 +0000 (UTC)
Date: Sat, 2 Sep 2023 09:39:13 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230902093913.3c7006e3@windsurf>
In-Reply-To: <20230901205555.16734-1-ju.o@free.fr>
References: <20230901205555.16734-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693640355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=urTVzcGiFs2t1TY/ZbXCtLtqiuA5TfTKe4gwtxSsnIQ=;
 b=kCMfRMpfB7/nReUcUNJHqIBSVMgM7Gdhp8aFkUSt6NeTQUDHzteNi1uqfBS/tSpwI61pHC
 B2GfKLDAjQQU4YaSXtymKv0UA7F1PEUN8Msy/Cyh4z8m8hULPvZwurbwZka9O2P65HDpyX
 eEMqK1Wgptx2jcP/L8VERbZEtz/UbC8Bvdum5Gros5Z2L2lB2j4KBSvPZjvMmKUlgXb5nl
 QHLhshBWd1GGlJ5IKeZe/76kkgMEe9lbsnpTVXXo3GflDwC6JEeqngSRKSlgso0FF2V+T2
 sMeTi1CIvY0b0l5zV1lEYh6Kje4xy+mti9QlyYZcvw5mLmKoDMVQRdGYxz92LQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kCMfRMpf
Subject: Re: [Buildroot] [PATCH next 1/1] package/ed: bump to version 1.19
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

On Fri,  1 Sep 2023 22:55:55 +0200
Julien Olivain <ju.o@free.fr> wrote:

> See release announce:
> https://lists.gnu.org/archive/html/bug-ed/2023-01/msg00000.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/ed/ed.hash | 4 ++--
>  package/ed/ed.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

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
