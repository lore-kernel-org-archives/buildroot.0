Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C38EE01E8
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC458608BB;
	Tue, 10 Sep 2024 20:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_aLMJIMVhM7; Tue, 10 Sep 2024 20:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A59B5608CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A59B5608CB;
	Tue, 10 Sep 2024 20:51:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 407C91BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A15D80C2A
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZlvyySRceaZ for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:47:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2849780BC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2849780BC3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2849780BC3
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:47:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4DBD25FFA3;
 Tue, 10 Sep 2024 22:46:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 10 Sep 2024 22:46:58 +0200
Date: Tue, 10 Sep 2024 22:46:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZuCwQgfKK3kmR_6G@landeda>
References: <20240910070823.4158894-1-peter@korsgaard.com>
 <20240910070823.4158894-35-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240910070823.4158894-35-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726001220;
 bh=B7XlnKDmDvhkJBoko9GkJSizo5nYHQmYh58oP5emfIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iwNkIvKW+73u90xm+5LktErLGmFYuJDMJFIU7oitK+q7Rgh1l24Lg1+Cz5x4M7V+S
 PamVOPaKbjm76dvayJM547Lusr1hlwthg1LljRrxMhrMHxuGYCZS1yFxu3nnO55RHT
 8t8FloP1PIZfCqIPS69xNDzA2qIr0sZ4qDQHkPI3WS6NNetdFtNZv8RvvlGKhJni5A
 DgTg191tnK8Pqpnlh43Y8avi/TqVrRFuXyKcskp1nQUjNif2m+IqjAYLtcW+lQuAp8
 vpTJ+txRZUGX3Yqae7Bq8cTr++1K7UZpliRiC8zHj/PrMOP/QuIAg2guVjICf5lWrT
 mDATROrUTz+Ew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iwNkIvKW
Subject: Re: [Buildroot] [PATCH 34/42] package/genpart: fix typos in patch
 description
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

Peter, All,

On 2024-09-10 09:08 +0200, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/genpart/0001-fix-return-code.patch | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/genpart/0001-fix-return-code.patch b/package/genpart/0001-fix-return-code.patch
> index ec18c82f8c..55af0303a9 100644
> --- a/package/genpart/0001-fix-return-code.patch
> +++ b/package/genpart/0001-fix-return-code.patch
> @@ -1,7 +1,7 @@
> -genpart: return 0 if partition writen OK, with no do_magic
> +genpart: return 0 if partition written OK, with no do_magic
>  
>  If do_magic is false, we don't won't write the 0xaa55 magic.
----------------------------^^^^^-^^^^^

I also fixed that part when applying.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> -However, if we succesfully wrote the partition entry, we still
> +However, if we successfully wrote the partition entry, we still
>  want to return 0 to indicate success.
>  
>  Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -- 
> 2.39.2
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
