Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47329C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 13:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F3AE400C4;
	Sun,  4 Feb 2024 13:58:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F3AE400C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Psgjq2uBrdeA; Sun,  4 Feb 2024 13:58:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 714EF401B2;
	Sun,  4 Feb 2024 13:58:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 714EF401B2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AFF571BF2F6
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 13:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8943060812
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 13:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8943060812
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ll88mXwgVBJ for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 13:58:08 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5836B607F7
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 13:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5836B607F7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2001:67c:1810:f051:9566:1ebe:e5dc:dd49])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 795E6B004FF;
 Sun,  4 Feb 2024 14:58:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Feb 2024 14:58:00 +0100
Date: Sun, 4 Feb 2024 14:58:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zb-X6P9fUI5FEWvj@landeda>
References: <20240204133557.1512951-1-fontaine.fabrice@gmail.com>
 <20240204133557.1512951-3-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240204133557.1512951-3-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707055085;
 bh=1XDQ9gvmlKEI8kogwBUXNa1ebg+LkoNyGjv1Ka9fN8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uzU4ZUQmD61zYul5vbXC9dUo1MWkzn+weSxVPZu42XzSaOTB54aXcnPBjaVHUbLi/
 urzOSI0DJNevNj2laL9DwwaWvs59nkUmKfN3GOF8+UcUkN458dOpaDvTTADIi8tanz
 DnWz2a4ThmjlpnT3evSP2OHliepU45uy4e6QBerYs/21OC2GE42YP6FX3LiSaFD30T
 ItIv3J88oxbfXZbiX0814FcI1v70aT97ow5bV8DkJvTZTdIzAV5MhgkqlwZlrHMTLB
 6ltClDiM4lHpJf5l+hHtDJmGyV28Kq46ZHNC1+XSTJLfqdOYFTECaCjZNQbQkpW0XN
 c/V5saA7zWseQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uzU4ZUQm
Subject: Re: [Buildroot] [PATCH 3/3] utils/checkpackagelib: add
 RemoveDefaultPackageCpeIdProductVariable
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
Cc: Christian Stewart <christian@aperture.us>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

Thanks for working on my suggestion! Sorry, I was not quick enough that
I was tackling it on my side... See below for some comments...

On 2024-02-04 14:35 +0100, Fabrice Fontaine spake thusly:
> As advised by Yann E. Morin [1], add
> RemoveDefaultPackageCpeIdProductVariable
> 
> [1]: https://patchwork.ozlabs.org/project/buildroot/patch/20240204103204.1415592-1-fontaine.fabrice@gmail.com
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  utils/checkpackagelib/lib_mk.py | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
> index 551c87168f..b5cfdd7f41 100644
> --- a/utils/checkpackagelib/lib_mk.py
> +++ b/utils/checkpackagelib/lib_mk.py
> @@ -227,6 +227,24 @@ class RemoveDefaultPackageSourceVariable(_CheckFunction):
>                      text]
>  
>  
> +class RemoveDefaultPackageCpeIdProductVariable(_CheckFunction):
> +    def before(self):
> +        package, _ = os.path.splitext(os.path.basename(self.filename))
> +        package_upper = package.replace("-", "_").upper()
> +        self.package = package
> +        self.FIND_CPE_ID_PRODUCT = re.compile(
> +            r"^{}_CPE_ID_PRODUCT\s*=\s*{}$"
> +            .format(package_upper, package, package_upper))
> +
> +    def check_line(self, lineno, text):
> +        if self.FIND_CPE_ID_PRODUCT.search(text):
> +
> +            return ["{}:{}: remove default value of _CPE_ID_PRODUCT variable "
> +                    "({}#generic-package-reference)"
> +                    .format(self.filename, lineno, self.url_to_manual),
> +                    text]

This is actually a little bit more complex than that. Indeed, if there
is no CPE variable set, we do not consider FOO_CPE_ID to be valid, but
if the user does provide one CPE variable, then we connsider FOO_CPE_ID
to be valid.

Of course, in that case, we want to allow for the CPE variable to be the
default, if that's the actual value it needs to have. But this is only
valid *if* there is only one CPE variable set.

So, I am almost done on my side, but if you want to continue on your
side, I'm totally fine with letting you do the job! Just tell me.

Regards,
Yann E. MORIN.

> +
>  class SpaceBeforeBackslash(_CheckFunction):
>      TAB_OR_MULTIPLE_SPACES_BEFORE_BACKSLASH = re.compile(r"^.*(  |\t ?)\\$")
>  
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
