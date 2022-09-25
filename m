Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4693C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 17:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B1D840533;
	Sun, 25 Sep 2022 17:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B1D840533
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-xnSVdJ6_B8; Sun, 25 Sep 2022 17:22:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AED24052A;
	Sun, 25 Sep 2022 17:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AED24052A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 959BC1BF48B
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 17:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70E2A60C0A
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 17:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70E2A60C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S3gwnWwM5BDr for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 17:22:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E88360C09
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E88360C09
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 17:22:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4a9f:7e6b:a045:201d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 362475FFA0;
 Sun, 25 Sep 2022 19:22:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Sep 2022 19:22:19 +0200
Date: Sun, 25 Sep 2022 19:22:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220925172219.GA1419013@scaer>
References: <20220925134647.577936-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925134647.577936-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664126543;
 bh=vJZ/EN9foDekiNIN2duI5B7EVJjriAOUvblhwKq9OkU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oUyxZFG6CwADfr1W4CG2EPp/+XsABZYN9kocPDEirKDFnqx9Kn3vHieC/jbH+mSCO
 jgp69oUcEFfJxqxL0Qx47Elvc71xO5bN0Jn9vr3OA4cZw/mIC+OWTr9poK5Dmety+H
 /BJt/+LOEp7qOGBIGO97ew/whtl+vAxo/YVafgjyVYaUTodDlo8IGPceBmRmXy8RA3
 5S3vp6viGdIvOpL/1ALfOYQKRCMAGnqwUROv1zmJNNxTjYtpKzv1Cfj2fgf9/3NUTl
 5clVnrfo5qMe6yV6mz0LO62FNZrpoiRkH+ueogXGdue8+wTH9y2FPBRsropzJSN5Fn
 pPn8ZpoOAWbyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oUyxZFG6
Subject: Re: [Buildroot] [PATCH v2,1/1] package/libiio: fix sparc build
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
Cc: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-09-25 15:46 +0200, Fabrice Fontaine spake thusly:
> Fix the following sparc build failure raised since bump to version 0.24
> in commit 9b5caa2ab45d7ec01e1657b10f94c2f60c7afe8e and
> https://github.com/analogdevicesinc/libiio/commit/2d3cae005f364742b3a9e7234d15b2fd2cbac664:
> 
> /home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c: In function 'serial_configure':
> /home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B2500000' undeclared (first use in this function); did you mean 'B1500000'?
>    99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
>       |                                                          ^
> /home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:127:9: note: in expansion of macro 'CASE_BPS'
>   127 |         CASE_BPS(2500000, &tty_attrs);
>       |         ^~~~~~~~
> /home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: note: each undeclared identifier is reported only once for each function it appears in
>    99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
>       |                                                          ^
> /home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:127:9: note: in expansion of macro 'CASE_BPS'
>   127 |         CASE_BPS(2500000, &tty_attrs);
>       |         ^~~~~~~~
> /home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B3000000' undeclared (first use in this function); did you mean 'B1000000'?
>    99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
>       |                                                          ^
> /home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:128:9: note: in expansion of macro 'CASE_BPS'
>   128 |         CASE_BPS(3000000, &tty_attrs);
>       |         ^~~~~~~~
> /home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B3500000' undeclared (first use in this function); did you mean 'B1500000'?
>    99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
>       |                                                          ^
> /home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:129:9: note: in expansion of macro 'CASE_BPS'
>   129 |         CASE_BPS(3500000, &tty_attrs);
>       |         ^~~~~~~~
> /home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B4000000' undeclared (first use in this function); did you mean 'B1000000'?
>    99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
>       |                                                          ^
> /home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:130:9: note: in expansion of macro 'CASE_BPS'
>   130 |         CASE_BPS(4000000, &tty_attrs);
>       |         ^~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8a9902f6eddaab812ebce3506ed6de686f647e02
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Upstream aacepted your patch, so I did a proper backport, then applied
to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Don't define values as they are explicitly not defined by kernel:
>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/sparc/include/uapi/asm/termbits.h#n157
> 
>  .../0001-iiod-serial.c-fix-sparc-build.patch  | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 package/libiio/0001-iiod-serial.c-fix-sparc-build.patch
> 
> diff --git a/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch b/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch
> new file mode 100644
> index 0000000000..47a86cab48
> --- /dev/null
> +++ b/package/libiio/0001-iiod-serial.c-fix-sparc-build.patch
> @@ -0,0 +1,75 @@
> +From 0a325ceea8db7d57537dbdbe0c33a142b29ec5d7 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 25 Sep 2022 11:19:18 +0200
> +Subject: [PATCH] iiod/serial.c: fix sparc build
> +
> +Fix the following sparc build failure raised since version 0.24 and
> +https://github.com/analogdevicesinc/libiio/commit/2d3cae005f364742b3a9e7234d15b2fd2cbac664:
> +
> +/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c: In function 'serial_configure':
> +/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B2500000' undeclared (first use in this function); did you mean 'B1500000'?
> +   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
> +      |                                                          ^
> +/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:127:9: note: in expansion of macro 'CASE_BPS'
> +  127 |         CASE_BPS(2500000, &tty_attrs);
> +      |         ^~~~~~~~
> +/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: note: each undeclared identifier is reported only once for each function it appears in
> +   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
> +      |                                                          ^
> +/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:127:9: note: in expansion of macro 'CASE_BPS'
> +  127 |         CASE_BPS(2500000, &tty_attrs);
> +      |         ^~~~~~~~
> +/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B3000000' undeclared (first use in this function); did you mean 'B1000000'?
> +   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
> +      |                                                          ^
> +/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:128:9: note: in expansion of macro 'CASE_BPS'
> +  128 |         CASE_BPS(3000000, &tty_attrs);
> +      |         ^~~~~~~~
> +/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B3500000' undeclared (first use in this function); did you mean 'B1500000'?
> +   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
> +      |                                                          ^
> +/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:129:9: note: in expansion of macro 'CASE_BPS'
> +  129 |         CASE_BPS(3500000, &tty_attrs);
> +      |         ^~~~~~~~
> +/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:99:58: error: 'B4000000' undeclared (first use in this function); did you mean 'B1000000'?
> +   99 | #define CASE_BPS(bps, attr) case bps: (attr)->c_cflag |= B##bps; break
> +      |                                                          ^
> +/home/buildroot/autobuild/instance-0/output-1/build/libiio-0.24/iiod/serial.c:130:9: note: in expansion of macro 'CASE_BPS'
> +  130 |         CASE_BPS(4000000, &tty_attrs);
> +      |         ^~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/8a9902f6eddaab812ebce3506ed6de686f647e02
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/analogdevicesinc/libiio/pull/908]
> +---
> + iiod/serial.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/iiod/serial.c b/iiod/serial.c
> +index f829361..b140d05 100644
> +--- a/iiod/serial.c
> ++++ b/iiod/serial.c
> +@@ -124,10 +124,18 @@ static int serial_configure(int fd, unsigned int uart_bps,
> + 	CASE_BPS(1152000, &tty_attrs);
> + 	CASE_BPS(1500000, &tty_attrs);
> + 	CASE_BPS(2000000, &tty_attrs);
> ++#ifdef B2500000 /* Not available on all architectures, i.e. sparc */
> + 	CASE_BPS(2500000, &tty_attrs);
> ++#endif
> ++#ifdef B3000000 /* Not available on all architectures, i.e. sparc */
> + 	CASE_BPS(3000000, &tty_attrs);
> ++#endif
> ++#ifdef B3500000 /* Not available on all architectures, i.e. sparc */
> + 	CASE_BPS(3500000, &tty_attrs);
> ++#endif
> ++#ifdef B4000000 /* Not available on all architectures, i.e. sparc */
> + 	CASE_BPS(4000000, &tty_attrs);
> ++#endif
> + 	default:
> + 		IIO_ERROR("Invalid baud rate\n");
> + 		return -EINVAL;
> +-- 
> +2.35.1
> +
> -- 
> 2.35.1
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
