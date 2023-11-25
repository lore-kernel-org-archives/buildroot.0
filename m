Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061EAC61DF4
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 11:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8369A40012;
	Sat, 25 Nov 2023 11:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8369A40012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zom0hsJZx6ho; Sat, 25 Nov 2023 11:58:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44DEE402F4;
	Sat, 25 Nov 2023 11:58:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44DEE402F4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AEF511BF2FD
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 11:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81B0441E42
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 11:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81B0441E42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jIyDNjEoo1P4 for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 11:58:42 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56C61418BB
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 11:58:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56C61418BB
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:a9ce:514c:eb15:225c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 18A2E13F88F;
 Sat, 25 Nov 2023 12:58:37 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Nov 2023 12:58:36 +0100
Date: Sat, 25 Nov 2023 12:58:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231125115836.GH3177259@scaer>
References: <20231125073418.854169-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231125073418.854169-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700913519;
 bh=shcjJ5Jcd92NZeRCPajzWeaoChQQpKPlSR9Dn1DSBdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dKAduOnOeZRnF6CcI4xJ2qnpKzzIZ0Mt/3dGv0kVobsQhM7GLgE4UddoiOl33nsb5
 2CbUFhIwXjFKnbH1kMPEUAUjQrjtaQdlJmc00M4NsLAqja+0BWE3f5NCyYA74CTGgJ
 uz9HQMz386/x7B+DupjCp993ywi4YuAsnDRnpb/obVKUqKYl/vxh/vtHrTqIQFWN3G
 xhX3dP+zgISg9esaGI/hqmYMytGnEo9bNmlo+mtIoEZCvsmAbjpdSsuRRIflijr48q
 tRhNRAOL3Ynx4Y5Umv9Q3K5YbmceU72aSLpbNhB+C+LZS/XoirgyzuAl+GbQ0I3/kX
 hNDI3dEdlwK8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dKAduOnO
Subject: Re: [Buildroot] [PATCH v6 1/1] utils/scanpypi: add flit package
 support
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

On 2023-11-25 00:34 -0700, James Hilliard spake thusly:
> These packages don't have a setup.py so we instead need to parse their
> pyproject.toml file.
> 
> Note that this currently doesn't handle flit package dependency
> resolution.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes v5 -> v6:
>   - handle None project_urls
> Changes v4 -> v5:
>   - remove unnecessary "as e" from tomlib exception path
> Changes v3 -> v4:
>   - prefer/support python3.11 tomllib
>   - use bool interpretation for None
> Changes v2 -> v3:
>   - minor cleanup
>   - rebase
>   - more detailed  commit log
> Changes v1 -> v2:
>   - remove homepage format fixes(sent as separate patch)
>   - remove load_setup fixes
> ---
>  utils/scanpypi | 93 +++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 89 insertions(+), 4 deletions(-)

    $ ./utils/docker-run make check-package
    utils/scanpypi:0: run 'flake8' and fix the warnings

    $ ./utils/docker-run python3 -m flake8 utils/scanpypi
    utils/scanpypi:45:1: E302 expected 2 blank lines, found 1
    utils/scanpypi:76:9: F841 local variable 'e' is assigned to but never used
    utils/scanpypi:788:21: F841 local variable 'e' is assigned to but never used

:-(

> diff --git a/utils/scanpypi b/utils/scanpypi
> index 3c98bb4bcc..eae9783a1f 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -42,6 +42,55 @@ except ImportError:
>            'pip install spdx_lookup')
>      liclookup = None
>  
> +def toml_load(f):
> +    with open(f, 'rb') as fh:
> +        ex = None
> +
> +        # Try standard library tomllib first
> +        try:
> +            from tomllib import load
> +            return load(fh)
> +        except ImportError:
> +            pass
> +
> +        # Try regular tomli next
> +        try:
> +            from tomli import load
> +            return load(fh)
> +        except ImportError as e:
> +            ex = e
> +
> +        # Try pip's vendored tomli
> +        try:
> +            from pip._vendor.tomli import load
> +            try:
> +                return load(fh)
> +            except TypeError:
> +                # Fallback to handle older version
> +                try:
> +                    fh.seek(0)
> +                    w = io.TextIOWrapper(fh, encoding="utf8", newline="")
> +                    return load(w)
> +                finally:
> +                    w.detach()
> +        except ImportError as e:
> +            pass

It was not obvious to me why we would not assign ex here, and I had to
think about it quite a bit. That's because the real solution to all
those fallbacks is to have the user actualy install tomli, so we want
to raise the first import-error.

OK, makes sense.

[--SNIP--]
> @@ -620,8 +698,12 @@ class BuildrootPackage():
>          if help_lines[-1][-1] != '.':
>              help_lines[-1] += '.'
>  
> -        home_page = md_info.get('home_page', None) or \
> -                    md_info.get('project_urls', {}).get('Homepage', None)  # noqa: E127
> +        home_page = md_info.get('home_page', None)
> +
> +        if not home_page:
> +            project_urls = md_info.get('project_urls', None)
> +            if project_urls:
> +                home_page = project_urls.get('Homepage', None)

I was not sure why this had to be done in this patch, so I assume that
the issue is that flit packages may not carry such a config item, while
the previously supported mechanisms always had that.

I added a little blurb in the commit log to briefly explain that.

>          if home_page:
>              # \t + two spaces is 3 char long
> @@ -699,9 +781,12 @@ def main():
>              except ImportError as err:
>                  if 'buildutils' in str(err):
>                      print('This package needs buildutils')
> +                    continue
>                  else:
> -                    raise
> -                continue
> +                    try:
> +                        package.load_pyproject()
> +                    except Exception as e:
> +                        raise

I remember Thomas was not very happy about nesting all those try-except
blocks, and I am not too happy either.

However, this is currently a 2-deep nesting, which is not *too* ugly,
and not nesting would probably require an uglier code, so meh as well.

If/when we are going to add more mechanisms that would require deeper
nesting, then we can refactor that code. Until then, it is good-enough
(or is not bad-enough).

Applied to next, thanks.

Regards,
Yann E. MORIN.

>              except (AttributeError, KeyError) as error:
>                  print('Error: Could not install package {pkg}: {error}'.format(
>                      pkg=package.real_name, error=error))
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
