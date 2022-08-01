Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260DAC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 21:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7DE4400C7;
	Mon,  1 Aug 2022 21:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7DE4400C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WpexJTy4pt4M; Mon,  1 Aug 2022 21:04:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7A89400B9;
	Mon,  1 Aug 2022 21:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7A89400B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2334F1BF319
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 21:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F24CF400B9
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 21:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F24CF400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id htaCl1AqIDxq for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 21:04:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3939400AC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3939400AC
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 21:04:21 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D4ED9240003;
 Mon,  1 Aug 2022 21:04:18 +0000 (UTC)
Date: Mon, 1 Aug 2022 23:04:17 +0200
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Message-ID: <20220801230417.235340af@windsurf>
In-Reply-To: <20220724235301.3708271-3-ricardo.martincoski@gmail.com>
References: <20220724235301.3708271-1-ricardo.martincoski@gmail.com>
 <20220724235301.3708271-3-ricardo.martincoski@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659387859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nf/oY2WqBAQaM5+1FP23qppJ+UT/4SFeuWEGBxBx0kY=;
 b=ea3jMSng4e8Ro10V//Br+WmIsUUzOvtRBMlWE1IUTBsFoONDNevuO+0ot5ZM1R2+SPSvPf
 YDg3fkiBgQZ9B3aE0i9KMgDFQyeetqAN71oZK26zXItyJC0wJ3RIeuhli63sls12km/DfI
 VeVHc7MCXxASLsyHFlGTz0hU1Zhgpy1hFpTiqBR0LeihqrZxE5+iBVavbbyFQ5PgHR3ArK
 K7ZXMnLV8o/1P3cIvMwO71hSMXekh0KJxgVBYsRh23nE4dVBP5r/YvQVOLHeeki0FjqnhX
 p3ZKI38PVB37B5SjU8K06Se+y7n1PCryCzM9A/JMIYTcLrKU7gJGCkG0G70+ig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ea3jMSng
Subject: Re: [Buildroot] [PATCH 3/3] utils/get-developers: print error for
 correct line
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

Hello Ricardo,

On Sun, 24 Jul 2022 20:53:01 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
> index f9f84ee8e1..3383df3c9e 100644
> --- a/utils/getdeveloperlib.py
> +++ b/utils/getdeveloperlib.py
> @@ -233,21 +233,22 @@ def parse_developers(filename=None):
>      global unittests
>      unittests = list_unittests()
>      developers_fname = filename or os.path.join(brpath, 'DEVELOPERS')
>      with open(developers_fname, mode='r', encoding='utf_8') as f:
>          files = []
>          name = None
>          for line in f:
> +            linen += 1
>              line = line.strip()
>              if line.startswith("#"):
>                  continue
>              elif line.startswith("N:"):
>                  if name is not None or len(files) != 0:
>                      errors += 1
> -                    print("Syntax error in DEVELOPERS file, line %d" % linen,
> +                    print("Syntax error in DEVELOPERS file, just before line %d" % linen,

What about:

+                    print("Syntax error in DEVELOPERS file, line %d" % linen-1,

because well "just before line %d" seems a bit weird.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
