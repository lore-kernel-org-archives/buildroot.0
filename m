Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE58C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 23:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B9E7404A8;
	Wed, 10 Jan 2024 23:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B9E7404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8VqxrIhiSXxn; Wed, 10 Jan 2024 23:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1761743717;
	Wed, 10 Jan 2024 23:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1761743717
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 24C471BF398
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 23:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF54E83DB5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 23:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF54E83DB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OjETsifhIQt5 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 23:23:01 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B6C183DA4
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 23:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B6C183DA4
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 52F4EB00539;
 Thu, 11 Jan 2024 00:22:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 00:22:57 +0100
Date: Thu, 11 Jan 2024 00:22:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZZ8m0SNtFlQT1_YZ@landeda>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
 <20240102235957.3072102-5-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102235957.3072102-5-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704928979;
 bh=BUYjG6RArCoakwoL8KX1cKO+gcDMm6tb7C3tuk5/OvA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a9m496+ZmEn+o3KuROZZzq9Js95eeC8ARq3gml/4Z2pXwC/JUbh7VgDXrA0jtEpa/
 RRWUGm7dWqxYFrbFSZY3uGkvGsHjk9XYAuWq/IHvneF/y82oS0IYIdolceZB9mWmCf
 96p70MmGQq7AFwAM+NkfdQoVr+8KYcl7xQNEyNP9XeDNrYoyKwMhBMnhkgUdQGr9z7
 sHd7IgbavKtG+olJpEODDcNshziR5J/ulAYqtr3oG+Oq5kIjmZdiorY5FKoe6l/Jrb
 kA3PUdEWgtH7vXTqvzyLkkGtFllvdcc6bVbhtqinPyCBK/Q80KQAPZraTykb/C4cFh
 97hYn3zecr+Sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a9m496+Z
Subject: Re: [Buildroot] [PATCH v3 04/11] package/flutter-engine: bump
 version to 3.16.5
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

Adam, All,

On 2024-01-02 16:59 -0700, Adam Duskett spake thusly:
> Flutter 3.16 includes 1,954 commits and improvements.
> 
> Flutter 3.16.0 also sets Material 3 as the default visual style for
> applications.
> 
> A brief changelog can be found here:
> https://docs.flutter.dev/release/release-notes/release-notes-3.16.0
> 
> A full changelog is provided below, which is provided at the end of the
> brief changelog page found above:
> https://github.com/flutter/engine/compare/3.13.0%E2%80%A63.16.0-0.5.pre
> 
> This package update has been tested on a x86_64 host with Docker 24.0.5:
>   - The following distributions:
>     - Fedora 39: Host system
>     - Ubuntu 22.04: Docker
>     - Debian 11: Docker
> 
>   - The following targets:
>     - BR2_aarch64
>     - BR2_arm
>     - BR2_x86_64
> 
> Also, the package is tested with the following testing command:
> 
> ./support/testing/run-tests \
>   -d ./dl \
>   -o ./output \
>   -k \
>   tests.package.test_flutter.TestFlutter

As we discussed about ivi-homescreen, testing details are very welcome,
but they are better placed in a post-commit note, so that they do not
end up in the commit log. So I dropped those.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2 -> v3: Updted to 3.16.5
> 
>  package/flutter-engine/flutter-engine.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
> index d31d435d79..c3ac144f2a 100644
> --- a/package/flutter-engine/flutter-engine.mk
> +++ b/package/flutter-engine/flutter-engine.mk
> @@ -21,7 +21,7 @@
>  #
>  # There is no hash provided, as the gn binary (used for configuration) relies
>  # on the .git directories. As such, a reproducible tarball is not possible.
> -FLUTTER_ENGINE_VERSION = 3.13.9
> +FLUTTER_ENGINE_VERSION = 3.16.5
>  
>  # There is nothing for Buildroot to download. This is handled by gclient.
>  FLUTTER_ENGINE_SITE =
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
