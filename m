Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CDCC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2230360BC8;
	Tue,  7 Feb 2023 17:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2230360BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6y4hnaiC3nVo; Tue,  7 Feb 2023 17:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E04B61021;
	Tue,  7 Feb 2023 17:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E04B61021
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22D411BF5F6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0EA4418A0
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0EA4418A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fuO5GQOTwrpN for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:22:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 070074189C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 070074189C
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:22:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 41E0B13F87F;
 Tue,  7 Feb 2023 18:22:08 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 18:22:08 +0100
Date: Tue, 7 Feb 2023 18:22:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230207172208.GL4124@scaer>
References: <20230207163119.292389-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207163119.292389-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675790530;
 bh=Kyrbjq4MW2RfVwwJm/nD3u9N3uMM7VWRRHmy5/f4bus=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W8xrRWG66fqvSUgniGNsF/d2VQgXiHNRBai8vUjA2pYUemEbxesGYPCxnNCDhB1Ef
 +3pX8GShPuEWSdT4+KgqaCdAbsg6wokrfkALt2oanTsrNpfil3iBGwITod7FTFfi6C
 ooiOJM0IS10myVFn8+7H7RK2kAQvBfakxtMGUyRWr9TKt420q+3H2jbVVXyM7YlBRr
 w4tVF9h7S+wWUFwpYimku/7SPHFSggJW/1QTWnuDAvoJSzCZAIcPwaj/KiSkUUJsuy
 FtPvQQYO+rLc1kaMh+TMZgBJSlaPSehmcq0+0SptEiT51WfK0TtPicxcqiflBmKx2z
 +qlxkv660TZ3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W8xrRWG6
Subject: Re: [Buildroot] [PATCH 1/3] support/docker: update Debian distro to
 a newer tag/date
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
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-02-07 17:31 +0100, Thomas Petazzoni via buildroot spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/docker/Dockerfile       | 2 +-
>  support/docker/apt-sources.list | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index d775ae23e1..de1534e77a 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -6,7 +6,7 @@
>  # We use a specific tag for the base image *and* the corresponding date
>  # for the repository., so do not forget to update the apt-sources.list
>  # file that is shipped next to this Dockerfile.
> -FROM debian:bullseye-20210902
> +FROM debian:bullseye-20230202
>  
>  LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
>        vendor="Buildroot" \
> diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
> index 0f872fd398..849996d9f7 100644
> --- a/support/docker/apt-sources.list
> +++ b/support/docker/apt-sources.list
> @@ -1,4 +1,4 @@
> -# Latest just before 20210817T000000Z:
> -deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20210902T205533Z/ bullseye main
> -deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20210902T193650Z/ bullseye-security main
> -deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20210902T205533Z/ bullseye-updates main
> +# Latest just before 20230207T102800Z:
> +deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20230206T092119Z/ bullseye main
> +deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20230206T092119Z/ bullseye-security main
> +deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20230206T092119Z/ bullseye-updates main
> -- 
> 2.38.1
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
