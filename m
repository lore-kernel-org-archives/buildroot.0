Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E1FC83F01
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 20:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AAEF81ED5;
	Sat, 26 Aug 2023 20:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AAEF81ED5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0drT6bqgOD7; Sat, 26 Aug 2023 20:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2EEA81EA5;
	Sat, 26 Aug 2023 20:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2EEA81EA5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5FC61BF471
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 20:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C56A81EA5
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 20:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C56A81EA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNw6Lb4O9Gib for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 20:09:15 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 888E981E9E
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 20:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 888E981E9E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3962A1BF205;
 Sat, 26 Aug 2023 20:09:10 +0000 (UTC)
Date: Sat, 26 Aug 2023 22:09:09 +0200
To: James Knight <james.d.knight@live.com>
Message-ID: <20230826220909.54b81153@windsurf>
In-Reply-To: <SN4P221MB0682A6E723BF55D3807B1BBBA0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
References: <20230429181205.3620-1-james.d.knight@live.com>
 <SN4P221MB0682A6E723BF55D3807B1BBBA0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1693080552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6PwgMIX0LnrDX3Wo6NZue+feBFaX9l2RoahXGrZoIpw=;
 b=kO2/r8zq4BYt/9Rsfg7NmJ+JPmQ/ch8pid+36FpzuPuab8h4G/dR6e88LoumU3RdanK/hr
 lDoC8XASxcynUbMHhp4nPzpZcC7FAgPm7+88KZyzvym1mx7bz9UDtr8saH7fwLICYbuflO
 k6K/C7yIuQVF775EvweCpxjPmm4awINvu1YyDmkfyx92gkBmj0kld6OApzROzXtsDXYhdp
 zivrissROcLTCtkZZ56owSBBXyzKVOQjSI7Xfp1DEkOlyYD9kONLQqalcEs9eZOA37W6Xo
 AONG8JR/qfVIzS1K5z5g0t1aO4cMxL3bAZ4At0kVOymjBTKk/8kdRKgWhbrGPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kO2/r8zq
Subject: Re: [Buildroot] [PATCH 1/4] utils/check-package: cleanup line
 reading
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sat, 29 Apr 2023 14:12:02 -0400
James Knight <james.d.knight@live.com> wrote:

> Cleanup the implementation for reading lines by having files processed
> in context managers and utilizing the iterable file object for line
> reading (instead of needing to call `readlines()`).
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  utils/check-package | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/utils/check-package b/utils/check-package
> index 83b9750f5a9c181dc96dcba508682776a600aac5..db3a00b524bc2c2aa663d3621c94fb11a6db7cb3 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -229,16 +229,18 @@ def check_file_using_lib(fname):
>          nwarnings += warn
>  
>      lastline = ""
> -    for lineno, text in enumerate(open(fname, "r", errors="surrogateescape").readlines()):
> -        nlines += 1
> -        for name, cf in objects:
> -            if cf.disable.search(lastline):
> -                continue
> -            warn, fail = print_warnings(cf.check_line(lineno + 1, text), name in xfail)
> -            if fail > 0:
> -                failed.add(name)
> -            nwarnings += warn
> -        lastline = text
> +    with open(fname, "r", errors="surrogateescape") as f:
> +        for lineno, text in enumerate(f):
> +            nlines += 1
> +            for name, cf in objects:
> +                if cf.disable.search(lastline):
> +                    continue
> +                line_sts = cf.check_line(fstate, lineno + 1, text)

This variable "fstate" doesn't exist as of PATCH 1/4. I wanted to apply
only this patch for now, as I'm not sure about PATCH 2/4 to PATCH 4/4,
but PATCH 1/4 on its own doesn't work. Could you have a look?

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
