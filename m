Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46705ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 19:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC9A5607E1;
	Mon, 19 Sep 2022 19:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC9A5607E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PqaFcWte1Fz1; Mon, 19 Sep 2022 19:36:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E2F9607CA;
	Mon, 19 Sep 2022 19:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E2F9607CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 157341BF59A
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 19:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4F3981B17
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 19:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4F3981B17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8RomsId6bGP for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 19:36:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF3A281B10
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF3A281B10
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 19:36:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ff43:9597:808d:a748])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2338419F59C;
 Mon, 19 Sep 2022 21:35:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Sep 2022 21:35:54 +0200
Date: Mon, 19 Sep 2022 21:35:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Quentin Schulz <foss+buildroot@0leil.net>
Message-ID: <20220919193554.GM1419013@scaer>
References: <20220919114757.1076737-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220919114757.1076737-1-foss+buildroot@0leil.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663616158;
 bh=l74GgB252dCqder0pzL/9gI371afbICUKq/dZ4EPssU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kRIgWBTfoqIJygDqj6SMWfSFZb3QsHrC48GOyrLFtDl6/jPY+JD4FtamabNfzUjco
 to/ACaYKfTbkwixyLx+Z5fsGHo3+/XXzQN9UUNZhzubKN+Pjjl0uI6pqARsDRZiWXg
 7YCLIJ+TaTYzjSlCY26e5LTif24jwaFbtix5wvYN7j508XQBEmmZViKqvCYlJ8Bbe4
 W/HoF61ENe8FjRtuUeDblVBcdR5o526hZHrA7VJqDtr5ebV0suFnr/TySqyWzM3Gsj
 V3o/yy6yzw7iNqz7CtwpsU68NFjv7GwoIQTOHFvKqQjQ2/xCtj08FFwWGPWYXF8sKN
 iwWQm+6SuWVGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kRIgWBTf
Subject: Re: [Buildroot] [PATCH] package/busybox: fix CVE-2022-30065
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quentin, All,

On 2022-09-19 13:47 +0200, Quentin Schulz spake thusly:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> This fixes CVE-2022-30065 by backporting a patch from the master branch.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> Cc'ing Peter for backport to stable releases
> Only build tested
> 
>  ...wk-fix-use-after-free-CVE-2022-30065.patch | 52 +++++++++++++++++++
>  package/busybox/busybox.mk                    |  3 ++
>  2 files changed, 55 insertions(+)
>  create mode 100644 package/busybox/0003-awk-fix-use-after-free-CVE-2022-30065.patch
> 
> diff --git a/package/busybox/0003-awk-fix-use-after-free-CVE-2022-30065.patch b/package/busybox/0003-awk-fix-use-after-free-CVE-2022-30065.patch
> new file mode 100644
> index 0000000000..f9bfee328e
> --- /dev/null
> +++ b/package/busybox/0003-awk-fix-use-after-free-CVE-2022-30065.patch
> @@ -0,0 +1,52 @@
> +From e06b1f0839972cc3f5b432849d574d14a8f17613 Mon Sep 17 00:00:00 2001
> +From: Natanael Copa <ncopa@alpinelinux.org>
> +Date: Fri, 17 Jun 2022 17:45:34 +0200
> +Subject: [PATCH] awk: fix use after free (CVE-2022-30065)
> +
> +fixes https://bugs.busybox.net/show_bug.cgi?id=14781
> +
> +function                                             old     new   delta
> +evaluate                                            3343    3357     +14
> +
> +Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +Backport: https://git.busybox.net/busybox/commit/?id=e63d7cdfdac78c6fd27e9e63150335767592b85e
> +[straightforward conflict resolution in testsuite/awk.tests]
> +Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> +---
> + editors/awk.c       | 3 +++
> + testsuite/awk.tests | 6 ++++++
> + 2 files changed, 9 insertions(+)
> +
> +diff --git a/editors/awk.c b/editors/awk.c
> +index f6314ac72..654cbac33 100644
> +--- a/editors/awk.c
> ++++ b/editors/awk.c
> +@@ -3114,6 +3114,9 @@ static var *evaluate(node *op, var *res)
> + 
> + 		case XC( OC_MOVE ):
> + 			debug_printf_eval("MOVE\n");
> ++			/* make sure that we never return a temp var */
> ++			if (L.v == TMPVAR0)
> ++				L.v = res;
> + 			/* if source is a temporary string, jusk relink it to dest */
> + 			if (R.v == TMPVAR1
> + 			 && !(R.v->type & VF_NUMBER)
> +diff --git a/testsuite/awk.tests b/testsuite/awk.tests
> +index bcaafe8fd..156aa65eb 100755
> +--- a/testsuite/awk.tests
> ++++ b/testsuite/awk.tests
> +@@ -469,4 +469,10 @@ testing 'awk printf %% prints one %' \
> + 	"%\n" \
> + 	'' ''
> + 
> ++testing 'awk assign while test' \
> ++	"awk '\$1==\$1=\"foo\" {print \$1}'" \
> ++	"foo\n" \
> ++	"" \
> ++	"foo"
> ++
> + exit $FAILCOUNT
> +-- 
> +2.37.3
> +
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 920f55c7fc..0f887c9734 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -11,6 +11,9 @@ BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
>  BUSYBOX_LICENSE_FILES = LICENSE archival/libarchive/bz/LICENSE
>  BUSYBOX_CPE_ID_VENDOR = busybox
>  
> +# 0003-awk-fix-use-after-free-CVE-2022-30065.patch
> +BUSYBOX_IGNORE_CVES += CVE-2022-30065
> +
>  BUSYBOX_CFLAGS = \
>  	$(TARGET_CFLAGS)
>  
> -- 
> 2.37.3
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
