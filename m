Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27454C4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 12:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B30EA8210F;
	Sun, 14 Jan 2024 12:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B30EA8210F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54NQ1osPn2zH; Sun, 14 Jan 2024 12:02:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D6D882160;
	Sun, 14 Jan 2024 12:02:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D6D882160
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 276291BF2A3
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 12:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2A9B417B9
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 12:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2A9B417B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 12pUVOPVLS6u for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 12:02:19 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D8E2F417A9
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 12:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8E2F417A9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EC1FD13F8B3;
 Sun, 14 Jan 2024 13:02:12 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Jan 2024 13:02:12 +0100
Date: Sun, 14 Jan 2024 13:02:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <ZaPNRFHggbqe4DNM@landeda>
References: <20240113183715.404990-1-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240113183715.404990-1-thomas@devoogdt.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705233736;
 bh=cjPMBOBmS+QLPf9qJCrhU3V39OKZNYylpUpqvUt1KgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sJmkCew+rGuTlMxfvVIBBsbkIyN8YD+gkjmjnGihZDkjlK+CAQ3VVrfdqLCnyy8Kf
 uBwRrib8EvDNjWHUaGlrhpEX3AMl2nwCJuG84oitt1tgMPUsVdyozLyrfET7pT0IgZ
 kU98QRqE1OXIYF1gpRwT5W+oH+EkwZ8rnODOU3VcftH0tXOWqg4T8mcECQ/eoPB9Kt
 ILPCb2QbhWjwWprjZ6Gukfj15fLR2T9wNIvaMwq3cUrOApxZDrbsX+ZnnBDJ/71fHE
 1mJGyz+bujxhgmNGWfMgQL4XMw/uLUVQtJ/tYh0OhDN3t+uoPYOrN7udSgazjLqMT2
 YZg9ki++D7i7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sJmkCew+
Subject: Re: [Buildroot] [PATCH v1] package/libglib2: fix libintl support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-01-13 19:37 +0100, Thomas Devoogdt spake thusly:
> Commit 12ba3563655e3ebab252e52daa6c710864fa869f disabled
> support for wrap downloads, which is used to fetch a
> fallback libintl implementation if needed. So add one ourselves,
> the files are fetched from https://github.com/frida/proxy-libintl/tree/0.4.

Isn't the fix jsut a matter of passing;
    -Dnls=$(if $(BR2_SYSTEM_ENABLE_NLS),enabled,disabled)

in the _CONF_OPTS ?

See the review of the 2.76.4 bump:
    https://patchwork.ozlabs.org/project/buildroot/patch/20230726171923.334017-1-bernd@kuhls.net/

> Fixes: http://autobuild.buildroot.org/results/04d/04d9a17e64503e0bece7bad33549ef3ad4b237c9/build-end.log.
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---

Regards,
Yann E. MORIN.

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
