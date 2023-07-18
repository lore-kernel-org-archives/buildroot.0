Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A21EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39176417A9;
	Tue, 18 Jul 2023 21:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39176417A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3BtORxT11Hb; Tue, 18 Jul 2023 21:15:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0627A417AD;
	Tue, 18 Jul 2023 21:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0627A417AD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59D371BF8C7
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 338CD409AD
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 338CD409AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lpFmgvyGljHd for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:15:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2215640280
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2215640280
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:15:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48A37C0005;
 Tue, 18 Jul 2023 21:15:18 +0000 (UTC)
Date: Tue, 18 Jul 2023 23:15:16 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230718231516.7b895121@windsurf>
In-Reply-To: <20230716155625.373549-1-bernd@kuhls.net>
References: <20230716155625.373549-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1689714929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x5oX/sobhBLFesE5wFfm6jXtOEWGVXuLqwB/3jum6kQ=;
 b=m876W3ULxTwryJbeshwITIHzQybqv60xtPx0gTVutYzjLFjvFk86ZorYvg08Yhj9AG54Re
 dWfZ4v5a+lgfMIxfYNkOg6oBjIkCHjwa0A0X0AGXqRdlFMm+yD7YRofEqVOM0b6nTxfrEp
 Wa9HB+Kxubs6Qn2Xe6PRFpn3fYoX16Nl5PY+zUzeVdmnm1eqSEHyWq2FW2EwuuQtk7UseQ
 sgwY1LqpkY2e5cYQYpkK1EkHqzLhzC3sJlcH1YZW1k4ATULwi0gwW71+VbZ3SDgbIyK2jz
 c+DqQciPigQqQ7nNwjk8900yLvFi9bpRqGsvbHY1Q2J2R/yUA8XiNRMx+uKZJw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m876W3UL
Subject: Re: [Buildroot] [PATCH 1/1] package/pound: bump version to 4.8
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

On Sun, 16 Jul 2023 17:56:25 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Original upstream ended the development of pound 2.8 in 2022:
> https://groups.google.com/g/pound_proxy/c/O8xaIIODw18
> 
> Switch project to use a maintained fork at https://github.com/graygnuorg
> and remove all patches, they are not needed anymore.
> 
> Follow the rename of the license file:
> https://github.com/graygnuorg/pound/commit/223b4276ac7a71583e0983f7d0d920f70e6c1abe
> 
> Release notes: https://github.com/graygnuorg/pound/blob/master/NEWS
> 
> This bump includes compatibility with OpenSSL 3.x (since version 4.0)
> and added optional support for pcre2:
> https://github.com/graygnuorg/pound/commit/a797374f220c5958f20a4f630083294dae4165b8
> 
> Fixes:
> http://autobuild.buildroot.net/results/1ca/1ca31debd709f634e65492bee0806ca81bcf9ee5/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .checkpackageignore                           |   2 -
>  package/pound/0001-fix-openssl-1.0.2.patch    | 127 -------
>  package/pound/0002-fix-openssl-1.1.0.patch    | 334 ------------------
>  ...bressl-coexisting-with-openssl-1.1.x.patch | 140 --------
>  package/pound/Config.in                       |   2 +-
>  package/pound/pound.hash                      |   4 +-
>  package/pound/pound.mk                        |  15 +-
>  7 files changed, 13 insertions(+), 611 deletions(-)
>  delete mode 100644 package/pound/0001-fix-openssl-1.0.2.patch
>  delete mode 100644 package/pound/0002-fix-openssl-1.1.0.patch
>  delete mode 100644 package/pound/0003-Support-for-libressl-coexisting-with-openssl-1.1.x.patch

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
