Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9BBC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 09:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABDB160B2A;
	Sun, 20 Feb 2022 09:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gkAU5lWgb0xG; Sun, 20 Feb 2022 09:56:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D37F760A6B;
	Sun, 20 Feb 2022 09:56:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D328C1BF3F3
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 09:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C23D660A6B
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 09:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GfQU9_6E8VV4 for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 09:55:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C376560A4F
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 09:55:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7478:162b:1cf3:1d5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 117FF5FFB4;
 Sun, 20 Feb 2022 10:55:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645350957;
 bh=0yg0iH8rg89EhjA9Jc5LvSopJgkcP4P21/j9RyeCQ4s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KcI5nqG7TVLZ9Tcu6/WDusV9hyqhGGqPu1MJZBugL91DCzYONE1SYMa35I7N1vRg0
 CpQRJX8RqkGneqCMvzQcX+tQXUHCQp5ZvWbQKChrvjyEzBLp8XqPSSlu/XOsBCkr3l
 p5eNDjv+UOKxPtLzn5Q1z17mhDhUe8XP7k1umpVxMxT1h0H3poe7m/QBVzV3nINZD/
 NV5fz08LWlf9W7ytug1CsL64Cyvyffzz4AjztSGLD6WYAVpiaOLGOBDTPLWNyACXLw
 RVCMWvgpJWeXhwqCkfn81HMK0E2qNS7lEeO1PF0fBrH5zjPR/npyLJ283yZR8b8tJ+
 nSB0Ja2mtOz5w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Feb 2022 10:55:54 +0100
Date: Sun, 20 Feb 2022 10:55:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220220095554.GQ522310@scaer>
References: <20220219122831.2961097-1-fontaine.fabrice@gmail.com>
 <20220219122831.2961097-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220219122831.2961097-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/expat: security bump to version
 2.4.5
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

Fabrice, All,

On 2022-02-19 13:28 +0100, Fabrice Fontaine spake thusly:
> Security fixes:
>  #562  CVE-2022-25235 -- Passing malformed 2- and 3-byte UTF-8
>        sequences (e.g. from start tag names) to the XML
>        processing application on top of Expat can cause
>        arbitrary damage (e.g. code execution) depending
>        on how invalid UTF-8 is handled inside the XML
>        processor; validation was not their job but Expat's.
>        Exploits with code execution are known to exist.
>  #561  CVE-2022-25236 -- Passing (one or more) namespace separator
>        characters in "xmlns[:prefix]" attribute values
>        made Expat send malformed tag names to the XML
>        processor on top of Expat which can cause
>        arbitrary damage (e.g. code execution) depending
>        on such unexpectable cases are handled inside the XML
>        processor; validation was not their job but Expat's.
>        Exploits with code execution are known to exist.
>  #558  CVE-2022-25313 -- Fix stack exhaustion in doctype parsing
>        that could be triggered by e.g. a 2 megabytes
>        file with a large number of opening braces.
>        Expected impact is denial of service or potentially
>        arbitrary code execution.
>  #560  CVE-2022-25314 -- Fix integer overflow in function copyString;
>        only affects the encoding name parameter at parser creation
>        time which is often hardcoded (rather than user input),
>        takes a value in the gigabytes to trigger, and a 64-bit
>        machine.  Expected impact is denial of service.
>  #559  CVE-2022-25315 -- Fix integer overflow in function storeRawNames;
>        needs input in the gigabytes and a 64-bit machine.
>        Expected impact is denial of service or potentially
>        arbitrary code execution.
> 
> https://blog.hartwork.org/posts/expat-2-4-5-released/
> https://github.com/libexpat/libexpat/blob/R_2_4_5/expat/Changes
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/expat/expat.hash | 8 ++++----
>  package/expat/expat.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/expat/expat.hash b/package/expat/expat.hash
> index a6f43af291..cd2e8c7fb9 100644
> --- a/package/expat/expat.hash
> +++ b/package/expat/expat.hash
> @@ -1,7 +1,7 @@
> -# From https://sourceforge.net/projects/expat/files/expat/2.4.4/
> -md5  a712d23b7afb32e7527cf0b3fd8f12ac  expat-2.4.4.tar.xz
> -sha1  6028b04d3505fc519c4c7c6bd67e1ad1a08cd7b6  expat-2.4.4.tar.xz
> +# From https://sourceforge.net/projects/expat/files/expat/2.4.5/
> +md5  9dc183e6c1eebc1b658c1e71be0885e1  expat-2.4.5.tar.xz
> +sha1  360a49b55c442e91cb7b328bc0335083909ddf4f  expat-2.4.5.tar.xz
>  
>  # Locally calculated
> -sha256  b1f9f1b1a5ebb0acaa88c9ff79bfa4e145823b78aa5185e5c5d85f060824778a  expat-2.4.4.tar.xz
> +sha256  f2af8fc7cdc63a87920da38cd6d12cb113c3c3a3f437495b1b6541e0cff32579  expat-2.4.5.tar.xz
>  sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
> diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> index 250600c25e..7815d61027 100644
> --- a/package/expat/expat.mk
> +++ b/package/expat/expat.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXPAT_VERSION = 2.4.4
> +EXPAT_VERSION = 2.4.5
>  EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
>  EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
>  EXPAT_INSTALL_STAGING = YES
> -- 
> 2.34.1
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
