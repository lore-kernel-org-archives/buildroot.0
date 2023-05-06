Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63561C77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB0784001;
	Sat,  6 May 2023 15:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AB0784001
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XGkmeZshhjTC; Sat,  6 May 2023 15:17:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 159F583FBF;
	Sat,  6 May 2023 15:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 159F583FBF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 689991BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41CF883FBF
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41CF883FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9FpEKzTl4CW for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:17:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BDB48224A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2BDB48224A
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:17:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6C6F6B00565;
 Sat,  6 May 2023 17:17:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 17:17:43 +0200
Date: Sat, 6 May 2023 17:17:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20230506151743.GB252090@scaer>
References: <2120646ed4f19a45b5fab83a212413f79be91448.1680094918.git.stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2120646ed4f19a45b5fab83a212413f79be91448.1680094918.git.stefan@agner.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683386267;
 bh=E4yY59gC7zoO83w/DXU4vt59z9VOQyn/NwQUPP42RqI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FVzpNP9yiSCm7ilXJ7VdeHA7jpKgulSovujoCCvqOD4t1DVhsJX8bZigGKPRRBDFh
 bnI+vE7PXHrKsZEVC/t8slzJc1nNmJG/SQKYBDGSB/8tquuubX+ihE1U06ShbSaGvz
 ytLwX8+d6MnVu+8A2nVWRXMqwRaesEqR2FznMxbsozqeXvN/VEey8BA5yEJ13ioC6a
 RYrGodl68wFHGfprS4V0VA75tnfd9vpjJnwMuwumRXa9iTHkv0vxt1SiX3uFAhYEiR
 o/1pgEGnQEnAH3vNTy++0RWlDp+brL+KiaMxtsoQI7HhWDhfbdw8zOlr3zZtO1kHSp
 2bqO2gsIkKrkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FVzpNP9y
Subject: Re: [Buildroot] [PATCH v2] package/gptfdisk: fix another runtime
 failure with popt 1.19
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stefan, All,

On 2023-03-29 15:02 +0200, Stefan Agner spake thusly:
> Fix the following runtime failure raised since bump of popt to version
> 1.19 in commit 895bfba93f6e5535f2132aeea144d2cd87ebc71b:
> 
> Segmentation fault (core dumped)
> 
> Fix the issue by backporting a fix found in upstream git repository [0].
> 
> [0] https://sourceforge.net/p/gptfdisk/code/ci/f5de3401b974ce103ffd93af8f9d43505a04aaf9/
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  ...ence-when-duplicating-string-argumen.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
> 
> diff --git a/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
> new file mode 100644
> index 0000000000..1642343d06
> --- /dev/null
> +++ b/package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch
> @@ -0,0 +1,43 @@
> +From f5de3401b974ce103ffd93af8f9d43505a04aaf9 Mon Sep 17 00:00:00 2001
> +Message-Id: <f5de3401b974ce103ffd93af8f9d43505a04aaf9.1680094621.git.stefan@agner.ch>
> +From: Damian Kurek <starfire24680@gmail.com>
> +Date: Thu, 7 Jul 2022 03:39:16 +0000
> +Subject: [PATCH] Fix NULL dereference when duplicating string argument
> +
> +poptGetArg can return NULL if there are no additional arguments, which
> +makes strdup dereference NULL on strlen
> +
> +Signed-off-by: Stefan Agner <stefan@agner.ch>

    $ make check-pacakge
    package/gptfdisk/0003-Fix-NULL-dereference-when-duplicating-string-argumen.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)

That's a check that was added after you send your patch, so I added one:
    Upstream: https://sourceforge.net/p/gptfdisk/code/ci/f5de3401b974ce103ffd93af8f9d43505a04aaf9

And of course, I borked it and pushed before I did ammend the commit...
Anyway...

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +---
> + gptcl.cc | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/gptcl.cc b/gptcl.cc
> +index 0d578eb..ab95239 100644
> +--- a/gptcl.cc
> ++++ b/gptcl.cc
> +@@ -155,10 +155,11 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
> +    } // while
> + 
> +    // Assume first non-option argument is the device filename....
> +-   device = strdup((char*) poptGetArg(poptCon));
> +-   poptResetContext(poptCon);
> ++   device = (char*) poptGetArg(poptCon);
> + 
> +    if (device != NULL) {
> ++      device = strdup(device);
> ++      poptResetContext(poptCon);
> +       JustLooking(); // reset as necessary
> +       BeQuiet(); // Tell called functions to be less verbose & interactive
> +       if (LoadPartitions((string) device)) {
> +@@ -498,6 +499,7 @@ int GPTDataCL::DoOptions(int argc, char* argv[]) {
> +          cerr << "Error encountered; not saving changes.\n";
> +          retval = 4;
> +       } // if
> ++      free(device);
> +    } // if (device != NULL)
> +    poptFreeContext(poptCon);
> +    return retval;
> +-- 
> +2.40.0
> +
> -- 
> 2.40.0
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
