Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD25C77B70
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 17:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E925384205;
	Sat, 15 Apr 2023 17:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E925384205
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7BPpSWoRv-F; Sat, 15 Apr 2023 17:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CED4841C0;
	Sat, 15 Apr 2023 17:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CED4841C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3AD1C40B4
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 17:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 505844284F
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 17:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 505844284F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JX9_CUzk7vPN for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 17:54:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F088242846
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F088242846
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 17:54:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3F2E25FF9E;
 Sat, 15 Apr 2023 19:54:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 19:54:30 +0200
Date: Sat, 15 Apr 2023 19:54:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20230415175430.GR2819@scaer>
References: <20230403144105.419341-1-vfazio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230403144105.419341-1-vfazio@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681581276;
 bh=iil+zcRKX/1U2hPq/BrJ7d71W+DYprZeofpQpqNPOOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KMqsRLwJ9RC1aUZ3vcxBbBba77Q6j+lIgy4ph/p64B5sI9kKa92GBEIOrslSEOD51
 EBNuIuAeEZb0wOTtMRcUcnQgrPDIy4AwwQ8C+L+EDfLHGn9doUTJRjJGZDu1gO5GN0
 dUDBm5kbe2y6yk9YVWoJSFu9Vkax9E9ULEmwwXlCRyjAPtsewjBfuJcJ/W+oY/yO18
 esLGyfldlXW/wkz2KSXdkvWq/g/VkdfevNfC5Zmkv08826hTcCXpABPD81CDRWbAUi
 ILChdm8hD2mxU4G0wBBym+ex4OeG7XvKl0dOUmK9eBdutba61InBr295jZsYqhiEJf
 d7O5PDi5q4nVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KMqsRLwJ
Subject: Re: [Buildroot] [PATCH v2 1/3] docs/manual: rewrite section for
 upstream documentation
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

On 2023-04-03 09:41 -0500, Vincent Fazio spake thusly:
> Previously, the documentation only requested links to upstream commits
> when backporting patches.
> 
> Based on a mailing list discussion [0], patches should, when possible
> and when approriate, provide a link as evidence that the patch has been
> submitted upstream.
> 
> The motivation is that hopefully the patch gets applied to upstream at
> some point reducing the long term maintenance burden within Buildroot.
> This also makes future patch review on subsequent package version bumps
> more streamlined.
> 
> For patches that are unique to BR and do not apply to the upstream
> repository, patches should have a comment explaining why they do not
> apply upstream.
> 
> [0] https://lists.buildroot.org/pipermail/buildroot/2023-March/666000.html
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

Whole series applied to master, thanks.

I just had to regenerate .checkpackageignore on the last patch, but that
was expected, as new stuff had been comitted to master since your patch.

Thanks!

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - Minor updates commit message body
> ---
>  docs/manual/patch-policy.txt | 35 ++++++++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
> index 063ef984d8..dc35132ecf 100644
> --- a/docs/manual/patch-policy.txt
> +++ b/docs/manual/patch-policy.txt
> @@ -144,24 +144,37 @@ AC_PROG_MAKE_SET
>  +AM_CONDITIONAL([CXX_WORKS], [test "x$rw_cv_prog_cxx_works" = "xyes"])
>  ---------------
>  
> -=== Integrating patches found on the Web
> +=== Additional patch documentation
>  
> -When integrating a patch of which you are not the author, you have to
> -add a few things in the header of the patch itself.
> +Ideally, all patches should document an upstream patch or patch submission, when
> +applicable, via the +Upstream+ trailer.
>  
> -Depending on whether the patch has been obtained from the project
> -repository itself, or from somewhere on the web, add one of the
> -following tags:
> +When backporting an upstream patch that has been accepted into mainline, it is
> +preferred that the URL to the commit is referenced:
>  
>  ---------------
> -Backported from: <some commit id>
> +Upstream: <URL to upstream commit>
>  ---------------
>  
> -or
> +If a new issue is identified in Buildroot and upstream is generally affected by 
> +the issue (it's not a Buildroot specific issue), users should submit the patch
> +upstream and provide a link to that submission when possible:
>  
>  ---------------
> -Fetch from: <some url>
> +Upstream: <URL to upstream mailing list submission or merge request>
>  ---------------
>  
> -It is also sensible to add a few words about any changes to the patch
> -that may have been necessary.
> +Patches that have been submitted but were denied upstream should note that and
> +include comments about why the patch is being used despite the upstream status.
> +
> +Note: in any of the above scenarios, it is also sensible to add a few words
> +about any changes to the patch that may have been necessary.
> +
> +If a patch does not apply upstream then this should be noted with a comment:
> +
> +---------------
> +Upstream: N/A <additional information about why patch is Buildroot specific>
> +---------------
> +
> +Adding this documentation helps streamline the patch review process during
> +package version updates.
> \ No newline at end of file
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
