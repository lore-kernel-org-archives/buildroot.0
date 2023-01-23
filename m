Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2FBC05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 07:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6978581E61;
	Mon, 23 Jan 2023 07:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6978581E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5aBgA_70kjj; Mon, 23 Jan 2023 07:01:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE55781E5D;
	Mon, 23 Jan 2023 07:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE55781E5D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 84FDB1BF5A9
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 07:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 598E181E5D
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 07:01:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 598E181E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id chJUyOi1VL51 for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 07:01:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AFDC81E5C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AFDC81E5C
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 07:01:39 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CB0245FFA6;
 Mon, 23 Jan 2023 08:01:33 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 23 Jan 2023 08:01:33 +0100
Date: Mon, 23 Jan 2023 08:01:33 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Steve Hay <me@stevenhay.com>
Message-ID: <20230123070133.GB2632@scaer>
References: <20230122234309.2111129-1-me@stevenhay.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230122234309.2111129-1-me@stevenhay.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1674457295;
 bh=LytvZLV58Y5b1TKnVG4ToJXYg2dgJPvailZ/34cqlf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K6rLUDMc4MY1huXht7wsoqOjf2NlOQB4PDl4HDjrBdebBBRWGIAeJKRH9U0R6PRDK
 C1qPJSj/DBOgCuGagE6aTAwr+HtG3WrIpe2jb6MY6tJcG/SfJ1awjgyBWxDKpWcJAh
 ci3NaKcFAi7Wx7fl6FWmnvPujofScsegwGP1OiDfbOhC6Tr7gX1ygeAJzfeUr2AvEN
 I4KwAvdPhuM/pdBewKl3HmIlwkh9auap6MFDheibkQ1/clGJpBHs3wi8ki0ppS35a/
 ExxbQxwKK9QzTU1EJd8fLMxDfphJLkQkB0v3nuLzwwMaAHCwUR1ccCMHrHMK4cYx3A
 Y9dhyIRAJ0org==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K6rLUDMc
Subject: Re: [Buildroot] [PATCH 1/2] support/scripts/graph-depends cleanup
 done_deps global
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

Steve, All,

Thanks for this patch, here a quick review.

On 2023-01-23 00:43 +0100, Steve Hay via buildroot spake thusly:
> From: Steve <me@stevenhay.com>

Please use you full name as author (not just your first name).

Please provide a (potentially terse) explanation for the change.

> Signed-off-by: Steve Hay <me@stevenhay.com>
> ---
>  support/scripts/graph-depends | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> index a66fb28f41..3e3373950f 100755
> --- a/support/scripts/graph-depends
> +++ b/support/scripts/graph-depends
> @@ -197,12 +197,11 @@ def print_attrs(outfile, pkg, pkg_type, pkg_version, depth, colors):
>      outfile.write("%s [color=%s,style=filled]\n" % (name, color))
>  
>  
> -done_deps = []
> -
> -
>  # Print the dependency graph of a package
>  def print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
> -                   arrow_dir, draw_graph, depth, max_depth, pkg, colors):
> +                   arrow_dir, draw_graph, depth, max_depth, pkg, colors, done_deps=None):

Make the default be the empty list:  done_deps=[]

> +    if done_deps is None:
> +        done_deps = []

... which allows to drop this conditional.

I was wondering how that could work, as the list is now a parameter,
but the list is not passed as a copy, it is passed as a "reference"
in python... So yes, it works (the .dot are the same before/after).

Regards,
Yann E. MORIN.

>      if pkg in done_deps:
>          return
>      done_deps.append(pkg)
> @@ -234,7 +233,7 @@ def print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exc
>                  if draw_graph:
>                      outfile.write("%s -> %s [dir=%s]\n" % (pkg_node_name(pkg), pkg_node_name(d), arrow_dir))
>                  print_pkg_deps(outfile, dict_deps, dict_types, dict_versions, stop_list, exclude_list,
> -                               arrow_dir, draw_graph, depth + 1, max_depth, d, colors)
> +                               arrow_dir, draw_graph, depth + 1, max_depth, d, colors, done_deps)
>  
>  
>  def parse_args():
> -- 
> 2.30.2
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
