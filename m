Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4726C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 09:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32FC14155B;
	Mon, 22 Aug 2022 09:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32FC14155B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c81g-PVWzE-T; Mon, 22 Aug 2022 09:57:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD71A4098C;
	Mon, 22 Aug 2022 09:57:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD71A4098C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B438C1BF306
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E40940941
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E40940941
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VL8lq3vi72e6 for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 09:57:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1721340994
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1721340994
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 09:57:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:961:575d:b2ff:71eb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 42FF660131;
 Mon, 22 Aug 2022 11:57:08 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 22 Aug 2022 11:57:08 +0200
Date: Mon, 22 Aug 2022 11:57:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220822095708.GA2167049@scaer>
References: <20220822075418.903230-1-james.hilliard1@gmail.com>
 <20220822075418.903230-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220822075418.903230-2-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661162232;
 bh=Qwa124ypwQQXJPB4SBj3FXzF6x6SzyrgEm4KfRkbenc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fZHQ8v1IwS7T7CJ62DZn76h6kmFQNVTibB2+2QsjXUt22n5BQFAnQ3rj2DHSh6nGM
 KH5ydbzcqPLS/h1Tr66J2yXDkTIAyoWCYek2+OBY7FbYkkc01QA1+AkbSH/iKFZsT6
 SzGqjMUDPZc16EIyCY9fete7KcxHqPA1cGkST1utSH7KS7tutqRjwnyK7fhv+ilPW0
 WReil5Q08BGWlV650Eb97WA+ri5cciGdg2au+lE1o3Fr5Lc5GP/zRPcKROaiwdv10H
 r0hQ+2ytFHYLnBfmaIboYMhpXutNemwdW5qD4+wjQ/EExvjWSeDf5jfuYtzqhLk4TK
 elinx7+e5MHZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fZHQ8v1I
Subject: Re: [Buildroot] [PATCH v3 2/2] package/pkg-python: clean
 conflicting pep517 packages before install
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-08-22 01:54 -0600, James Hilliard spake thusly:
> The python installer package isn't able to overwrite files of packges
> that already exist, this causes problems when doing a rebuild or
> update without a full clean.
> 
> To fix this we can use functionality from importlib to identify and
> remove any conflicting python package files before installation.
> 
> Fixes:
> Traceback (most recent call last):
>   File "/home/buildroot/buildroot/support/scripts/pyinstaller.py", line 69, in <module>
>     main()
>   File "/home/buildroot/buildroot/support/scripts/pyinstaller.py", line 61, in main
>     install(
>   File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/_core.py", line 109, in install
>     record = destination.write_file(
>   File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/destinations.py", line 207, in write_file
>     return self.write_to_fs(scheme, path_, stream, is_executable)
>   File "/home/buildroot/buildroot/output/host/lib/python3.10/site-packages/installer/destinations.py", line 167, in write_to_fs
>     raise FileExistsError(message)
> FileExistsError: File already exists: /home/buildroot/buildroot/output/target/usr/lib/python3.10/site-packages/tinycss2/__init__.py
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> ---
> Changes v2 -> v3:
>   - split out host pyinstaller.py change
> Changes v1 -> v2:
>   - remove unused os import
> ---
>  support/scripts/pyinstaller.py | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/support/scripts/pyinstaller.py b/support/scripts/pyinstaller.py
> index 6dd9242327..d9b77cac19 100644
> --- a/support/scripts/pyinstaller.py
> +++ b/support/scripts/pyinstaller.py
> @@ -2,12 +2,33 @@
>  
>  import argparse
>  import glob
> +import pathlib
> +
> +from importlib.machinery import PathFinder
> +from importlib.metadata import DistributionFinder
>  
>  from installer import install
> +from installer._core import _process_WHEEL_file

I've extended the commit log to explain why we need to use private
symbols.

>  from installer.destinations import SchemeDictionaryDestination
>  from installer.sources import WheelFile
>  
>  
> +def clean(source, destination):
> +    scheme = _process_WHEEL_file(source)
> +    scheme_path = destination.scheme_dict[scheme]
> +    context = DistributionFinder.Context(
> +        name=source.distribution,
> +        path=[scheme_path],
> +    )
> +    for path in PathFinder.find_distributions(context=context):
> +        if not path.files:

I've changed this for an explicit test against None.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +            continue
> +        for file in path.files:
> +            file_path = pathlib.Path(file.locate())
> +            if file_path.exists():
> +                file_path.unlink()
> +
> +
>  def main():
>      """Entry point for CLI."""
>      ap = argparse.ArgumentParser("python pyinstaller.py")
> @@ -58,6 +79,7 @@ def main():
>      )
>  
>      with WheelFile.open(glob.glob(args.wheel_file)[0]) as source:
> +        clean(source, destination)
>          install(
>              source=source,
>              destination=destination,
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
