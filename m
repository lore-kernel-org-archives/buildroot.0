Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A61C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 16:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B225160E82;
	Wed, 27 Jul 2022 16:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B225160E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IA4zJxh9Li5i; Wed, 27 Jul 2022 16:41:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3438B60E7B;
	Wed, 27 Jul 2022 16:41:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3438B60E7B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C8BC1BF422
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5751780D9A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5751780D9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iHLKnPgsJnCN for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 16:41:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26D7C80D51
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 26D7C80D51
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 16:41:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 47519B00717;
 Wed, 27 Jul 2022 18:40:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 18:40:57 +0200
Date: Wed, 27 Jul 2022 18:40:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220727164057.GG1134587@scaer>
References: <20220727104751.2505442-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727104751.2505442-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658940060;
 bh=t2O6hJ8EOOLvhGCToR3sczcFlu4u8+jDOVVwYw+AA4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ri7sujX9HtpeCIeoj9G14o6q4EELiCM7QoETvJ7Heqw8dh3z0yvvfZTBWaJ+sauC5
 8TGZaW0pO/obRnYCra26P4aSscl81FH0BLWbK7zbVmrcb7yPiU00MEq58+7QsbTtGt
 fN8n8JVSmOmMzncGtzZLqc2atoH0R9WDdeIu574puvnf6dYhjVbHwAU/uLWSwvKuTK
 /W/+wLeiUY5zCvwvo4Dj8KVu/WugffeAwukqiy6aJ0rjBv7a4DL4RG6l0fJNdx+jDN
 rVyrCPDuvfeI6D++bx2ClI6i8gvvEfSJMee8dhcsTQYjkM84s2WFJSpdqONxqZETd1
 8vHqZaBXhxb4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ri7sujX9
Subject: Re: [Buildroot] [PATCH] support/scripts/check-host-rpath: send
 readelf error output to oblivion
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-07-27 12:47 +0200, Thomas Petazzoni via buildroot spake thusly:
> Somewhere between binutils 2.35 and 2.37, some functionality was
> added in readelf to parse more DWARF information. Unfortunately, as
> reported in binutils bug
> 28981 ("https://sourceware.org/bugzilla/show_bug.cgi?id=28981"), this
> feature causes a number of fairly scary warnings to be displayed when
> running readelf on binaries built with Clang, such as the pre-built
> rustc and rustdoc binaries part of the host-rust-bin package. It
> looks like this:
> 
> readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
[--SNIP we got the idea, thanks--]
> These warnings are caused by the readelf calls done by the
> support/scripts/check-host-rpath script. The annoying thing is that
> once host-rust-bin has been installed in $(HOST_DIR), this warning
> appears after the installation of every single host package, because
> support/scripts/check-host-rpath rescans all binaries every time.
> 
> To avoid showing those scary warnings, this commit sends the error
> output of readelf to /dev/null.
> 
> Of course, it would be nicer to only filter out those warnings, but
> filtering the error output without merging the error output into the
> standard output is tricky, so let's keep things simple. If there is
> really an error, readelf will abort.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/scripts/check-host-rpath | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
> index b27cb883f3..f36677cc96 100755
> --- a/support/scripts/check-host-rpath
> +++ b/support/scripts/check-host-rpath
> @@ -61,7 +61,7 @@ elf_needs_rpath() {
>  
>      while read lib; do
>          [ -e "${hostdir}/lib/${lib}" ] && return 0
> -    done < <( readelf -d "${file}"                                         \
> +    done < <( readelf -d "${file}" 2>/dev/null                             \
>                |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
>                       -e 's//\1/;'                                          \
>              )
> @@ -100,7 +100,7 @@ check_elf_has_rpath() {
>  	    # false.
>              [[ ${dir} =~ "${perpackagedir}/"[^/]+/host/lib ]] && return 0
>          done
> -    done < <( readelf -d "${file}"                                              \
> +    done < <( readelf -d "${file}" 2>/dev/null                                  \
>                |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
>                        -e 's//\3/;'                                              \
>              )
> -- 
> 2.37.1
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
