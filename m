Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7A4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 09:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58DCE4033F;
	Mon,  3 Jan 2022 09:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P3ovkDkXyxPY; Mon,  3 Jan 2022 09:21:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54036400F5;
	Mon,  3 Jan 2022 09:21:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E560B1BF360
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 09:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1FFE400F5
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 09:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rdFyYdqfDzC4 for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 09:21:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3AC9400BA
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 09:21:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c1c4:dbff:d80e:9740])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id F127F200390;
 Mon,  3 Jan 2022 10:21:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641201675;
 bh=QGmmhIRk4blJxVTs2Bbans4YoGm3jzyvjlyVF05IYWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qjL6C9OLsTXcHDC4dsUL1V1JbxM4eaE8bSSevMKSLjyLRkRL7i9+j5/NQexbOGfwl
 YJyX1SX6hIueQ9MCqORppCZ2vDZnjQilwjMxsqQeYBCqNu/45iYfpg1SQnm7S0YaOR
 KFBig7iNIwnS6HTV+39CAdqvkPWORMHMh1A/6US/5My7qXb30AxZY2fEVByvxI5vog
 7UVCCIc6HRuRn6VIjwt+CYeX8vHsPcQJleZQWeFRW7iIpVFFPU9DHvQas/yUlM4gsw
 IKTsfaPxQI2s0+Ja7FT7vvShjrulDGT2539BJHUGD2D9J+myBSBk2htNeoT9lik1oV
 pXlU2Zg9qTsXA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 03 Jan 2022 10:21:08 +0100
Date: Mon, 3 Jan 2022 10:21:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220103092108.GG69135@scaer>
References: <20220102191027.3219775-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220102191027.3219775-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libsigrokdecode: fix build with
 python 3.10
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-02 20:10 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure with sigrok-cli raised since bump of
> python3 to version 3.10.1 in commit
> 25b1fc2898d68ddf2674b14c738045875fc5a2dc:
> 
> /home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-none-linux-gnu/10.3.1/../../../../aarch64-none-linux-gnu/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/libsigrokdecode.so: undefined reference to `PyTuple_SetItem'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e2f33366803b18aff29086007610fa0a264f90d6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...02-configure-Add-python-3-10-support.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch
> 
> diff --git a/package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch b/package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch
> new file mode 100644
> index 0000000000..e3148dcde8
> --- /dev/null
> +++ b/package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch
> @@ -0,0 +1,28 @@
> +From c4c10b89396fe21a622b8c38dd5815a496b007bf Mon Sep 17 00:00:00 2001
> +From: Soeren Apel <soeren@apelpie.net>
> +Date: Mon, 20 Dec 2021 19:36:39 +0100
> +Subject: [PATCH] configure: Add python 3.10 support
> +
> +[Retrieved from:
> +https://sigrok.org/gitweb/?p=libsigrokdecode.git;a=commit;h=c4c10b89396fe21a622b8c38dd5815a496b007bf]

I've changed that to point to the commit-diff (not just the commit log),
and applied to master, thanks.

Regards,
Yann E. MORIN.

> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 2917cb3..b8841f8 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -100,7 +100,7 @@ SR_PKG_CHECK_SUMMARY([srd_pkglibs_summary])
> + # first, since usually only that variant will add "-lpython3.8".
> + # https://docs.python.org/3/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
> + SR_PKG_CHECK([python3], [SRD_PKGLIBS],
> +-	[python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
> ++	[python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
> + AS_IF([test "x$sr_have_python3" = xno],
> + 	[AC_MSG_ERROR([Cannot find Python 3 development headers.])])
> + 
> +-- 
> +2.24.0.rc2
> +
> -- 
> 2.33.0
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
