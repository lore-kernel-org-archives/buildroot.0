Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CACC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74D6E408A5;
	Sun,  7 May 2023 21:20:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D6E408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kJktqR1DW51a; Sun,  7 May 2023 21:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8147640629;
	Sun,  7 May 2023 21:20:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8147640629
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E4071BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 538124181F
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:20:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 538124181F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwBU5l1H52N2 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:20:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE5374181E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE5374181E
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:20:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 42D9B2003DD;
 Sun,  7 May 2023 23:20:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 23:20:38 +0200
Date: Sun, 7 May 2023 23:20:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230507212038.GP252090@scaer>
References: <SN4P221MB068289AD66243971AC49547BA0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB068289AD66243971AC49547BA0689@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683494443;
 bh=k9hJC1jy2KMSFktRcv2WXg0VWxyvqPq4E7yBLWoG9Cs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YbMbJ7PpVoc0lFRcVp0bqZfhc6Ulj2DjyR0fZnv4I3zAsAMn3CgJlP9Vw3+w1pQid
 IPcb6z8/mq/rplK4ZLOmErUSsjvBNul4bfKZ4D4ROcKgT/+/HVkWZCvzp6W/84N1y/
 EC+w9tFmZ1wAMd2H6uH6SHMEDWVf8GMkPZws8HxVtA4txT6rF6UbvSBYDlF58o/WoZ
 kJXNNCJiIhI/+NmrWuDYHn4W7l1S0ZvCO+mcB4bqjt9Gst3v6QhChWJY40a36tIHmS
 7D2Xw2nFp2bQ/Sx4fBbCDKiCrqo7ySv+4773PgnCDD8ZkhJxtvZUj37gJQ67gsNBJR
 Po8vq2X0LsEzw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YbMbJ7Pp
Subject: Re: [Buildroot] [PATCH] utils/check-package: improve windows support
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-04-29 14:51 -0400, James Knight spake thusly:
> The following includes a series of tweaks to the check-package script to
> provide flexibility when sanity checking files when sources are checked
> out in a Windows environment.

To be honest and direct, I am not sure this is a setup we want to
support.

Buildroot is not supposed to be working on non-Linux environements;
there are so many things that will break if the uderlying filesystem
can't differentiate between Foo and foo, and so on...

The best solution is one is locked into such a broken environemnt such
as Windows, is to use a VM.

> This includes:
> 
> - When populating a list of files to check, ensure POSIX paths are used;
>    otherwise, the internal list of files to check will be improperly
>    formed and no checks will occur.
> - When interpreting an ignore list (which provides POSIX paths of files
>    to ignore), resolve the absolute file path for these entries to
>    ensure files can be ignored when cycling through a provided file
>    list.
> - Ignore execute bit checks on Windows since X_OK is only an existence
>    check on Windows.
> - When running ShellCheck, always ignore SC1017 [1] to avoid line
>    ending warnings since Windows environments will typically utilize
>    `git config core.autocrlf`.

Typically, we will explicitly not want to disable that check, as we want
to ensure Unix end-of-lines (LF).

Regards,
Yann E. MORIN.

> [1]: https://www.shellcheck.net/wiki/SC1017
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  utils/check-package           | 9 +++++++--
>  utils/checkpackagelib/tool.py | 4 +++-
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/check-package b/utils/check-package
> index 83b9750f5a9c181dc96dcba508682776a600aac5..817dcb0b7203d28b7d2133ac1d8c27ac8093b3c4 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -5,6 +5,7 @@ import argparse
>  import inspect
>  import magic
>  import os
> +import posixpath
>  import re
>  import sys
>  
> @@ -50,7 +51,8 @@ def get_ignored_parsers_per_file(intree_only, ignore_filename):
>          for line in f.readlines():
>              filename, warnings_str = line.split(' ', 1)
>              warnings = warnings_str.split()
> -            ignored[os.path.join(entry_base_dir, filename)] = warnings
> +            entry = os.path.abspath(os.path.join(entry_base_dir, filename))
> +            ignored[entry] = warnings
>      return ignored
>  
>  
> @@ -275,7 +277,10 @@ def __main__():
>      if flags.intree_only:
>          # change all paths received to be relative to the base dir
>          base_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
> -        files_to_check = [os.path.relpath(os.path.abspath(f), base_dir) for f in flags.files]
> +        files_to_check = []
> +        for f in flags.files:
> +            relpath = os.path.relpath(os.path.abspath(f), base_dir)
> +            files_to_check.append(relpath.replace(os.sep, posixpath.sep))
>          # move current dir so the script find the files
>          os.chdir(base_dir)
>      else:
> diff --git a/utils/checkpackagelib/tool.py b/utils/checkpackagelib/tool.py
> index 907ada704fe4beaa57b1c18e7ce2f17977272257..8b2af64d3899a2e7958f79d61722b1b359351747 100644
> --- a/utils/checkpackagelib/tool.py
> +++ b/utils/checkpackagelib/tool.py
> @@ -12,7 +12,7 @@ class NotExecutable(_Tool):
>      def run(self):
>          if self.ignore():
>              return
> -        if os.access(self.filename, os.X_OK):
> +        if os.access(self.filename, os.X_OK) and os.name != "nt":
>              return ["{}:0: This file does not need to be executable{}".format(self.filename, self.hint())]
>  
>  
> @@ -32,6 +32,8 @@ class Flake8(_Tool):
>  class Shellcheck(_Tool):
>      def run(self):
>          cmd = ['shellcheck', self.filename]
> +        if os.name == "nt":
> +            cmd.append("--exclude=SC1017")
>          try:
>              p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
>              stdout = p.communicate()[0]
> -- 
> 2.40.1.windows.1
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
