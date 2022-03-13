Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA831C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 18:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69DBC408E1;
	Sun, 13 Mar 2022 18:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XuHIzxL9jDYa; Sun, 13 Mar 2022 18:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CA3E408D9;
	Sun, 13 Mar 2022 18:26:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 428711BF41C
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 18:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A906408D9
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 18:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id forltC7IXRAm for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 18:26:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F568408D3
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 18:26:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e882:937b:b5a4:fcbf])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 26D6F5FF96;
 Sun, 13 Mar 2022 19:25:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647195961;
 bh=+fYpabZutmC1i+kCYCTRQBVpSB/m81kTPDZdUv+s+S0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q2RE2VprgykghdBnenJsVGTGzdsXiMkDkHYUUVM6pbgzLGvkO+iAemecLXCKwBPPz
 fXxZ6VsZsbyFhn4v9XV4x8ryBJsEvX5eidcR5PR0UMwctUdcBKfTxroIMDe3LjPLHn
 JSIaiS6Usdz+HD/VvLdPqJJGh445Zk15NsdkZjKzNZyxxe51QXT/DakvIuSR9bFZAb
 /9l52i6sKTEcRinuAir1czAKNJm98mk1sIUw/jrJwIEOh/e4zlw65Mv7I6JEk8PomJ
 GF0hz2xe1cF/cOR33eRko01Sqzoyvg7LLBSZxH6PfRrEqcrJnRYJFLO4Jq/Hf4oitR
 3vgy7DJhMSfHQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Mar 2022 19:25:58 +0100
Date: Sun, 13 Mar 2022 19:25:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220313182558.GV283544@scaer>
References: <20220313165030.269338-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220313165030.269338-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] utils/scanpypi: support alternative
 Homepage format
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

James, All,

On 2022-03-13 10:50 -0600, James Hilliard spake thusly:
> Some packages only have a home page properly set inside project_urls.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  utils/scanpypi | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 17d8a0017a..681758a552 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -609,7 +609,8 @@ class BuildrootPackage():
>  
>          lines.append('\thelp\n')
>  
> -        help_lines = textwrap.wrap(self.metadata['info']['summary'], 62,
> +        md_info = self.metadata['info']
> +        help_lines = textwrap.wrap(md_info['summary'], 62,
>                                     initial_indent='\t  ',
>                                     subsequent_indent='\t  ')
>  
> @@ -617,11 +618,17 @@ class BuildrootPackage():
>          if help_lines[-1][-1] != '.':
>              help_lines[-1] += '.'
>  
> -        # \t + two spaces is 3 char long
> -        help_lines.append('')
> -        help_lines.append('\t  ' + self.metadata['info']['home_page'])
> -        help_lines = [x + '\n' for x in help_lines]
> -        lines += help_lines
> +        home_page = md_info.get('home_page', None)
> +        if home_page is None or len(home_page) == 0:

I think this can be shortened to:

    if not home_page:
        [...]

Indeed:
  - None tets as False
  - an empty string tests as False

So, 'not home_page' will evaluate to True if it is either None, or if
its length is zero.

> +            project_urls = md_info.get('project_urls', {})
> +            home_page = project_urls.get('Homepage', None)
> +
> +        if home_page is not None and len(home_page) != 0:

Similarly, I think this could be shortened to just;

    if home_page:
        [...]

So 'home_page' will only evaluate to True if it is not None and its
length is not zero.

And eventually, all this can be simplified even further:

    home_page = md_info.get('home_page', None) or \
                md_info.get('project_urls', {}).get('Homepage', None)

(and squelch flake8's E127)

Applied to master with the above simplification, thanks.

Regards,
Yann E. MORIN.

> +            # \t + two spaces is 3 char long
> +            help_lines.append('')
> +            help_lines.append('\t  ' + home_page)
> +            help_lines = [x + '\n' for x in help_lines]
> +            lines += help_lines
>  
>          with open(path_to_config, 'w') as config_file:
>              config_file.writelines(lines)
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
