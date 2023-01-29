Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3C1C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 207428176F;
	Sun, 29 Jan 2023 16:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 207428176F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id apOYC8dxh3_0; Sun, 29 Jan 2023 16:39:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 357768176D;
	Sun, 29 Jan 2023 16:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 357768176D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D0D9D1BF476
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7EE341570
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7EE341570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_3PgQoiWTLi for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:39:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CE974088C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CE974088C
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:39:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6AB565FF67;
 Sun, 29 Jan 2023 17:39:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Jan 2023 17:39:04 +0100
Date: Sun, 29 Jan 2023 17:39:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20230129163904.GL2632@scaer>
References: <20230128191409.1472620-1-vfazio@xes-inc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230128191409.1472620-1-vfazio@xes-inc.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675010346;
 bh=O3Dud90PqjHmY36AXCtKnI0PIKlrKkU8LBeNYxTCt30=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oitYZ31mLw6oBksiGrAqdw7xr5n534MpCNt+YdS6RLcVkDl4B2a8HGZiqLZstYppl
 o/J2r0o9VjDeJRpxdCPf9doQyK4Zd9cJIn4qNB+Cgqq8FX7QHvmybU5SAFIuEV4hiu
 cARvNvX3x88wcPyMFNYOSlZBNG5HWcdhTUdpLRZLnF9T/X941WaE/bleHnS/av13ZI
 V3fUU32AtyzSczIc2I1h+baSL8N/dvRqDx90Y2SZJ/pR1YaX+k8nJ7TBMDdsIfZZy5
 O3hY6BKu/OgQy8Aw+p3LZI1vryQl6Wqq8kdDMKr8OTdyI9FWFXxRSw+9q52vqMgn0o
 C453+v3FsQyFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oitYZ31m
Subject: Re: [Buildroot] [PATCH 1/1] package/bash: fix non-multibyte builds
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

Vincent, All,

On 2023-01-28 13:14 -0600, Vincent Fazio spake thusly:
> Builds using toolchains without WCHAR support would fail due to an
> undeclared reference to `shell_input_line_property`.
> 
> Fix this by using a guard to check if ENABLE_MULTIBYTE is defined.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/133ddcbc37512e6bcc5daab669ce316efa7ec4fc/
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...compilation-for-non-multibyte-builds.patch | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch
> 
> diff --git a/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch b/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch
> new file mode 100644
> index 0000000000..d330de5cd4
> --- /dev/null
> +++ b/package/bash/0002-parse.y-fix-compilation-for-non-multibyte-builds.patch
> @@ -0,0 +1,63 @@
> +From 0217fc2816e47ee296472df71d1011f0eb2937e6 Mon Sep 17 00:00:00 2001
> +From: Vincent Fazio <vfazio@gmail.com>
> +Date: Fri, 27 Jan 2023 14:37:26 -0600
> +Subject: [PATCH] parse.y: fix compilation for non-multibyte builds
> +
> +Builds configured with --disable-multibyte or when the toolchain does
> +not have WCHAR support would encounter a compile error due to an
> +undeclared reference to shell_input_line_property in shell_getc.
> +
> +Add a HANDLE_MULTIBYTE guard to conditionally compile the block that
> +references shell_input_line_property in shell_getc as it's only declared
> +when HANDLE_MULTIBYTE is defined.
> +
> +Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> +[Upstream status: https://savannah.gnu.org/patch/index.php?10309]
> +---
> + parse.y | 2 ++
> + y.tab.c | 2 ++
> + 2 files changed, 4 insertions(+)
> +
> +diff --git a/parse.y b/parse.y
> +index 1d12e639..8f1355c6 100644
> +--- a/parse.y
> ++++ b/parse.y
> +@@ -2625,6 +2625,7 @@ next_alias_char:
> +       parser_state |= PST_ENDALIAS;
> +       /* We need to do this to make sure last_shell_getc_is_singlebyte returns
> + 	 true, since we are returning a single-byte space. */
> ++#if defined (HANDLE_MULTIBYTE)
> +       if (shell_input_line_index == shell_input_line_len && last_shell_getc_is_singlebyte == 0)
> + 	{
> + #if 0
> +@@ -2638,6 +2639,7 @@ next_alias_char:
> + 	  shell_input_line_property[shell_input_line_index - 1] = 1;
> + #endif
> + 	}
> ++#endif /* HANDLE_MULTIBYTE */
> +       return ' ';	/* END_ALIAS */
> +     }
> + #endif
> +diff --git a/y.tab.c b/y.tab.c
> +index 50c5845b..799f730f 100644
> +--- a/y.tab.c
> ++++ b/y.tab.c
> +@@ -4936,6 +4936,7 @@ next_alias_char:
> +       parser_state |= PST_ENDALIAS;
> +       /* We need to do this to make sure last_shell_getc_is_singlebyte returns
> + 	 true, since we are returning a single-byte space. */
> ++#if defined (HANDLE_MULTIBYTE)
> +       if (shell_input_line_index == shell_input_line_len && last_shell_getc_is_singlebyte == 0)
> + 	{
> + #if 0
> +@@ -4949,6 +4950,7 @@ next_alias_char:
> + 	  shell_input_line_property[shell_input_line_index - 1] = 1;
> + #endif
> + 	}
> ++#endif /* HANDLE_MULTIBYTE */
> +       return ' ';	/* END_ALIAS */
> +     }
> + #endif
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
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
