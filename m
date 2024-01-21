Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5086C47422
	for <buildroot@archiver.kernel.org>; Sun, 21 Jan 2024 10:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D6F3404FE;
	Sun, 21 Jan 2024 10:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D6F3404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7d6cns5Jwinb; Sun, 21 Jan 2024 10:22:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50663404AE;
	Sun, 21 Jan 2024 10:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50663404AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78E3F1BF3F3
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51316418F7
 for <buildroot@lists.busybox.net>; Sun, 21 Jan 2024 10:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51316418F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7n2MHVtg2_Co for <buildroot@lists.busybox.net>;
 Sun, 21 Jan 2024 10:22:18 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 605D4418F5
 for <buildroot@buildroot.org>; Sun, 21 Jan 2024 10:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 605D4418F5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B03D613F88D;
 Sun, 21 Jan 2024 11:22:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 11:22:14 +0100
Date: Sun, 21 Jan 2024 11:22:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZazwVs9enBPuoH0f@landeda>
References: <20240116182026.284510-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240116182026.284510-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705832536;
 bh=Mrw4Kp74RuGf9evsaRNwvtnUri6BvlT+QMF40FA3YSk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HsBz3iqWi8wph9a8GUgSffY74ju8Lm7Vwpd1RJHG1Zyrspi2sRy7RfqFIYfT5aZNM
 25ldQWsMjnmuJNDPq0FQEliS/4NXdWYU22CAJ8VXmgHrONgCJr8u4Bd9Icj3hlsiRa
 4hXlaI3tUIuzANF3BinspUaPq+zrzk0ueJpWuw66nTvcRMxxeFU91VrId1XZIMSHTt
 y1/icrWEdxjTHYA+6jmUN0cr6xjYAIzboFDXFcjXRO786RHGzv5mbBvNVuV1UnN5XP
 +HlbxRY1sCyrnHGkI7/BorKZWlLmF+F9X0lxA8580JiGhad3kYPjW0+IKwPZFCYGZL
 c1wk7SY6vF1Iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HsBz3iqW
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: new bc runtime test
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2024-01-16 19:20 +0100, Julien Olivain spake thusly:
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
[--SNIP--]
> +        # Test a basic output base conversion of a large number.
> +        hex_str = "DEADBEEF0000ABADC0DE0000CAFEBABE"
                                              ^^^^^^^^
I've changed that to 8BADF00D.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +        hex_base = 16
> +        value = int(hex_str, base=hex_base)
> +        bc_expr = f"obase={hex_base} ; {value}"
> +        cmd = f"echo '{bc_expr}' | bc"
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[0], hex_str)
> +
> +        # Test a floating point computation by estimating Pi. Since we
> +        # use the bc arc-tangent a() function, we need the '-l'
> +        # option.
> +        bc_expr = "4 * a(1)"
> +        cmd = f"echo '{bc_expr}' | bc -l"
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertAlmostEqual(float(output[0]), math.pi, places=16)
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
