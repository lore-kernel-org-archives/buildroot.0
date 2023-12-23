Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D79C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 10:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A818160B69;
	Sat, 23 Dec 2023 10:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A818160B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehGMKQMC6Y4i; Sat, 23 Dec 2023 10:22:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1BB760B9E;
	Sat, 23 Dec 2023 10:22:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1BB760B9E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EF2E1BF408
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 451B1827A5
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 451B1827A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7h_CFoZQE460 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 10:22:51 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D9C4821C5
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 10:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D9C4821C5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D1C3DB0059C;
 Sat, 23 Dec 2023 11:22:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Dec 2023 11:22:44 +0100
Date: Sat, 23 Dec 2023 11:22:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZYa09G--ff0D9HNh@landeda>
References: <20231220200110.1819507-1-thomas.petazzoni@bootlin.com>
 <20231220200110.1819507-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231220200110.1819507-2-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703326969;
 bh=L6Amza/EJEmD8VKnqiZtH4Qvo8iUhBbYcnlRwMdgc5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iW+0Y6DIhObYWVrDi1T4C6LIuvB1arKDmeSretB20OaVoYcZ/zdHQCGjVti7OCsFw
 R7TAZgqyoLf9eXRSkET6xWf2lMIkUWOkuBMmlvq7XlD6Qo2Co69MQmJy5/fSagILxB
 Cd7iWaevYGd2IYUJGGUvfqurIPeUMPqoolAGgtArCXsgvwKwCjQkmyDlGQBLbICs3/
 PhvR4DlN2HU+fhn3Gc16s/+3KYH44A70EbSvkRunjq9HM2838WF0eUPlVlJTBWt4VF
 w7DfQ3fhXT29yWJpkjhZg8gtJCtlVYAhN44UY/NmkqB1m0nsqLsH8+VsIO5fD2/GkW
 HjiIzGG9mdhmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iW+0Y6DI
Subject: Re: [Buildroot] [PATCH 2/3] package/glibc: ignore CVEs not
 considered as security issues by upstream
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
Cc: peter.verbrugge@technolution.nl, Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-12-20 21:01 +0100, Thomas Petazzoni spake thusly:
> 5 CVEs affecting glibc according to the NVD database are considered as
> not being security issues by upstream glibc developers:
> 
> * CVE-2010-4756: The glob implementation in the GNU C Library (aka
>   glibc or libc6) allows remote authenticated users to cause a denial
>   of service (CPU and memory consumption) via crafted glob expressions
>   that do not match any pathnames. glibc maintainers position: "That's
>   standard POSIX behaviour implemented by (e)glibc. Applications using
>   glob need to impose limits for themselves"
> 
> * CVE-2019-1010022: GNU Libc current is affected by: Mitigation
>   bypass. The impact is: Attacker may bypass stack guard
>   protection. The component is: nptl. The attack vector is: Exploit
>   stack buffer overflow vulnerability and use this bypass
>   vulnerability to bypass stack guard. NOTE: Upstream comments
>   indicate "this is being treated as a non-security bug and no real
>   threat. glibc maintainers position: "Not treated as a security issue
>   by upstream https://sourceware.org/bugzilla/show_bug.cgi?id=22850"
> 
> * CVE-2019-1010023: GNU Libc current is affected by: Re-mapping
>   current loaded library with malicious ELF file. The impact is: In
>   worst case attacker may evaluate privileges. The component is:
>   libld. The attack vector is: Attacker sends 2 ELF files to victim
>   and asks to run ldd on it. ldd execute code. NOTE: Upstream comments
>   indicate "this is being treated as a non-security bug and no real
>   threat. glibc maintainers position: "Not treated as a security issue
>   by upstream https://sourceware.org/bugzilla/show_bug.cgi?id=22851"
> 
> * CVE-2019-1010024: GNU Libc current is affected by: Mitigation
>   bypass. The impact is: Attacker may bypass ASLR using cache of
>   thread stack and heap. The component is: glibc. NOTE: Upstream
>   comments indicate "this is being treated as a non-security bug and
>   no real threat. glibc maintainers position: "Not treated as a
>   security issue by upstream
>   https://sourceware.org/bugzilla/show_bug.cgi?id=22852"
> 
> * CVE-2019-1010025: GNU Libc current is affected by: Mitigation
>   bypass. The impact is: Attacker may guess the heap addresses of
>   pthread_created thread. The component is: glibc. NOTE: the vendor's
>   position is "ASLR bypass itself is not a vulnerability. Glibc
>   maintainers position: "Not treated as a security issue by upstream
>   https://sourceware.org/bugzilla/show_bug.cgi?id=22853"
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Ultimately, it would be nice if we could supplement the ignored list
with the reason for ignoring the CVE, but that's food for later.

Regards,
Yann E. MORIN.

> ---
> I believe those CVEs should be ignored, because they will never be
> fixed, and therefore they cause additional noise that makes it more
> difficult to spot the real CVEs that need to be fixed.
> ---
>  package/glibc/glibc.mk | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 32e6516c7f..29411c58e2 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -36,6 +36,20 @@ GLIBC_IGNORE_CVES += CVE-2023-4911
>  # 2.38 and the version we're really using.
>  GLIBC_IGNORE_CVES += CVE-2023-5156
>  
> +# All these CVEs are considered as not being security issues by
> +# upstream glibc:
> +#  https://security-tracker.debian.org/tracker/CVE-2010-4756
> +#  https://security-tracker.debian.org/tracker/CVE-2019-1010022
> +#  https://security-tracker.debian.org/tracker/CVE-2019-1010023
> +#  https://security-tracker.debian.org/tracker/CVE-2019-1010024
> +#  https://security-tracker.debian.org/tracker/CVE-2019-1010025
> +GLIBC_IGNORE_CVES += \
> +	CVE-2010-4756 \
> +	CVE-2019-1010022 \
> +	CVE-2019-1010023 \
> +	CVE-2019-1010024 \
> +	CVE-2019-1010025
> +
>  # glibc is part of the toolchain so disable the toolchain dependency
>  GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
> -- 
> 2.43.0
> 

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
