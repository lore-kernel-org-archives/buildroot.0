Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF994C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 10:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61636607FE;
	Sun, 30 Oct 2022 10:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61636607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BKIEOhRxfud3; Sun, 30 Oct 2022 10:45:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA636606EC;
	Sun, 30 Oct 2022 10:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA636606EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FA341BF2B7
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1935D606EC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 10:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1935D606EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0h5mRjMlijH for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 10:45:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB15960644
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB15960644
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 10:45:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2D4E860004;
 Sun, 30 Oct 2022 10:45:30 +0000 (UTC)
Date: Sun, 30 Oct 2022 11:45:29 +0100
To: Tan En De <ende.tan@linux.starfivetech.com>
Message-ID: <20221030114529.607f4e73@windsurf>
In-Reply-To: <20221015084757.277050-1-ende.tan@linux.starfivetech.com>
References: <20221015084757.277050-1-ende.tan@linux.starfivetech.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667126731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/U+/QGYqbGUuEXnyzWrkcFOea3h1cN/gzQdPtay/oU=;
 b=PycR8r0EgL0Dw4XHL4kDWTHgSL5SUcmQ4nQR1A36D4WbstGW0g5Pfz3HvEsdiYnH+C/1wR
 a1D3gl4o/+ELPPobwsXIA7vo4Dc1p38js6qC+4lHh9d9t2XancD1azfT87tJWYcv6S7MuY
 sgehUzYOkDqleK74b1OEuVusWU/tMahQ77T+0Kb82jiBMNspeH7u0ThdZlbnFmI8yhMs+7
 K6qjMbh2uMIzyfHRsu6FlOn6Bh+d5xqTSbtmeKm662gHAFgekeGLmjwkxU1C2jdsCzTb7W
 Lps9O0/QvH9Lcz01e+KYGhz05e9UerR3hzwQHMPcjlzWp3qbUN0hc5iln1Ge9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PycR8r0E
Subject: Re: [Buildroot] [0/3] package/libkcapi: bump version to 1.4.0 and
 add Kconfigs
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

Hello Tan,

On Sat, 15 Oct 2022 16:47:54 +0800
Tan En De <ende.tan@linux.starfivetech.com> wrote:

> Tan En De (3):
>   package/libkcapi: bump version to 1.4.0
>   package/libkcapi: support building kcapi-dgst application
>   package/libkcapi: support enabling lib-asym and lib-kpp

Thanks a lot, all 3 patches applied. I did some minor changes on PATCH
2/3 and 3/3:

 - Alphabetic ordering in Config.in and libkcapi.mk

 - Improvement of the prompt of the options, moving the discussion
   about kernel patches into the help text of each option instead of
   inside the prompt (which would otherwise be too long)

Also, I see we have nobody in our DEVELOPERS associated to the libkcapi
package. If you're a user of this package, would you agree to be listed
in the DEVELOPERS file for this package? This way, you would receive
notifications when we have build failures affecting this package, and
you could help us maintain its support in Buildroot moving forward.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
