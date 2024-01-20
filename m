Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6114C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 23:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40CCF400F9;
	Sat, 20 Jan 2024 23:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40CCF400F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gK4sEGiqm9FI; Sat, 20 Jan 2024 23:11:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4377940A9B;
	Sat, 20 Jan 2024 23:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4377940A9B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF76D1BF27E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A85704189A
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A85704189A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7IpCx9ScWwhX for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 23:10:57 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEED341876
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 23:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEED341876
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 125F713F89C;
 Sun, 21 Jan 2024 00:10:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 Jan 2024 00:10:53 +0100
Date: Sun, 21 Jan 2024 00:10:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZaxS_f9N9flLCvnD@landeda>
References: <20240120163622.261411-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240120163622.261411-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705792256;
 bh=4KODBP/q+0RhMfdcbhrDsHzqwU7sVLU95N11zht3Wbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E4vAvDTUPAktiw+i6DSmuCwPmTLoFsHNn8yTjfpVlZyF764ln91VPJDL3xK02LorU
 3/NMhCDCC1rFdckP70IAYriBzBjB2VgUhWnRcMfGJ4lDsRd8aZYbzydlurVJm7FCZi
 ipHGhkRLLrJ0I89cbtSdcX/bqPWLp1mQmLbddkOJTh46Z75ZdthUjipf0LxDoxRCNb
 bPE8cbLs3NBSjgH+KeKOriofVzfuBqzB4b7q1mv6CARgJ7k2k4NSwbjE+u519T+Yab
 2IYHVjZhUxJkDITCroR5lcWw2vhB+U97uCGp/ATJm3wgS1FG3zSjJ5ls1+Ku7WmE1S
 6vBReYunwuHpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=E4vAvDTU
Subject: Re: [Buildroot] [PATCH 1/1] package/zlog: disable -Werror
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

On 2024-01-20 17:36 +0100, Fabrice Fontaine spake thusly:
> Set WARNINGS="" to disable -Werror and fix the following build failure
> raised since bump to version 1.2.17 in commit
> 53779570e50307482d095ff6ef95582cac2a0165 and
> https://github.com/HardySimpson/zlog/commit/b8d9634a1a9fb6c60ec2a23b0cb4b5e29e6e3502:
> 
> event.c: In function 'zlog_event_new':
> event.c:94:72: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>    94 |         a_event->tid_hex_str_len = sprintf(a_event->tid_hex_str, "%x", (unsigned int)a_event->tid);
>       |                                                                        ^
> cc1: all warnings being treated as errors
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/21e9212dbb3d77108b45f755890a8e66b23d2407
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/zlog/zlog.mk | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
> index ccf2576529..347f482211 100644
> --- a/package/zlog/zlog.mk
> +++ b/package/zlog/zlog.mk
> @@ -12,8 +12,9 @@ ZLOG_CPE_ID_VENDOR = zlog_project
>  ZLOG_INSTALL_STAGING = YES
>  
>  define ZLOG_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
> -		-C $(@D) all
> +	$(TARGET_MAKE_ENV) $(MAKE1) \
> +		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
> +		WARNINGS="" -C $(@D) all
>  endef
>  
>  define ZLOG_INSTALL_STAGING_CMDS
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
