Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB508C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 10:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3389760B69;
	Sat, 23 Dec 2023 10:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3389760B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0opav4zvC5Gb; Sat, 23 Dec 2023 10:20:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A0AA60B9E;
	Sat, 23 Dec 2023 10:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A0AA60B9E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F2651BF39D
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5872060BBC
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5872060BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8DhiniB6SG_K for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 10:20:05 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AC3960B69
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 10:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AC3960B69
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 69233B0056A;
 Sat, 23 Dec 2023 11:19:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Dec 2023 11:19:57 +0100
Date: Sat, 23 Dec 2023 11:19:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZYa0TdSBU2JrexMt@landeda>
References: <20231220200110.1819507-1-thomas.petazzoni@bootlin.com>
 <20231220200110.1819507-3-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231220200110.1819507-3-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703326801;
 bh=Q1gTRxMUOLasbhaqb9vf9YaerwQYgo10VicSlZYUEOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=flP006+jU65ImEOngYQHgX+DvNEpr9Cc33pDdtcZ5SqO2b4RYKzamhsdkT4CPbcZZ
 W5o9pW7koba71WxI0r6oXc6Tl96mt9W4E6ijjM3dx90lt1wPXskg+LxL7L8N1EzVUe
 pgt0Fuiu39fcqgeklHtF7C4xcxfljtOT8LwjBnz0AU8giN+QTQGNNOCuN2YgQIW5Xp
 13cdJRRQnUqK8EPigWc+kulNterBjo8VRBF07O+QjmXOnec/402FabDvmMSigZ3TKs
 5b1VjHlFUFIy9ctx7Kk8WVE55ABZ38CeyK6GWx/zn90ZeSo1HrGEOYyKLTuu0lMqAt
 jX1uRiiU2U+jg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=flP006+j
Subject: Re: [Buildroot] [PATCH 3/3] package/glibc: ignore CVE-2023-0687,
 disputed
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
> According to the glibc maintainers, CVE-2023-0687 is not a security
> issue, and they have sent a rejection request to MITRE, so let's
> ignore it.

This CVE is supposed to be fixed by 801af9fafd46 (gmon: Fix allocated
buffer overflow (bug 29444)) which is in 2.38:

    $ git tag --contains 801af9fafd46
    glibc-2.38
    glibc-2.38.9000

So the CVE DB should be updated to state that glibc >= 2.38 is not
affected.

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> I have chosen to submit this one separately from the previous patch,
> as it's a much newer one, so the Buildroot community may have a
> different view on how we should handle this particular CVE.
> ---
>  package/glibc/glibc.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 29411c58e2..a485d40f8d 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -50,6 +50,11 @@ GLIBC_IGNORE_CVES += \
>  	CVE-2019-1010024 \
>  	CVE-2019-1010025
>  
> +# This CVE is disputed, and the glibc maintainers don't consider it to
> +# be a security issue, see
> +# https://sourceware.org/bugzilla/show_bug.cgi?id=29444
> +GLIBC_IGNORE_CVES += CVE-2023-0687
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
