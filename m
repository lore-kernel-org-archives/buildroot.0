Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69E5C77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 10:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BA8341903;
	Sat, 13 May 2023 10:10:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BA8341903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aahtxtVdJRzw; Sat, 13 May 2023 10:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07B0941B59;
	Sat, 13 May 2023 10:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07B0941B59
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACE181BF424
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93DDD4012B
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 10:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93DDD4012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hZ-NqWOQN5T3 for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 10:10:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7849B400AB
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7849B400AB
 for <buildroot@buildroot.org>; Sat, 13 May 2023 10:10:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id E0E2B19F732;
 Sat, 13 May 2023 12:10:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 12:10:06 +0200
Date: Sat, 13 May 2023 12:10:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20230513101006.GK2582048@scaer>
References: <20230506212531.365446-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230506212531.365446-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683972609;
 bh=PouRiaHf+wwHfrKs7GQwMWfZHQfSFef6A8A8nvroDpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lx/4ANNE8/cYIOfxEhmxhGSKUxrzCVN+ymEEiS1P3RIKCtb55daoAqanOlqhBjn9C
 ndyo7z4xaaapRshi+EednsQqD+0ZsyjwbvvrAANZ/dxL55zrxo6+fd2Gvp7qm9898K
 UqsSqjcPhIztAMpi8DC0A1IXAYgBdOVpRWTXXYGItZs8Del7z7KAgrU3KH+lE9v1z/
 IHL9SVpH686dOsniCXsSs+q2y505UXfze4wvPEXDBEucwPWa6ry338fFtll2MNfqBz
 QPWvpKpOm0DO87IdsA0oovN8fEUD6wBgs/gOCVKj2LkXiOHwhxW6eoWKGcssaRipnE
 NmYigRVdDyooA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Lx/4ANNE
Subject: Re: [Buildroot] [PATCH] utils/check-package: check ignored files
 exist
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2023-05-06 23:25 +0200, Yann E. MORIN spake thusly:
> When an ignored file is removed (e.g. a package patch is no longer
> needed after a version bump), the corresponding entry in the ignore list
> is no longer needed.
> 
> However, we currently only validate that an ignored *test* still fails,
> not that a ignore files is now missing.
> 
> Add a new test to check-package that does that check, and add a
> test-case for that check.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  utils/check-package                      |  4 ++++
>  utils/checkpackagelib/lib_ignore.py      | 14 ++++++++++++++
>  utils/checkpackagelib/test_lib_ignore.py | 18 ++++++++++++++++++
>  3 files changed, 36 insertions(+)
>  create mode 100644 utils/checkpackagelib/lib_ignore.py
>  create mode 100644 utils/checkpackagelib/test_lib_ignore.py
> 
> diff --git a/utils/check-package b/utils/check-package
> index 83b9750f5a..3de3a72e0c 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -11,6 +11,7 @@ import sys
>  import checkpackagelib.base
>  import checkpackagelib.lib_config
>  import checkpackagelib.lib_hash
> +import checkpackagelib.lib_ignore
>  import checkpackagelib.lib_mk
>  import checkpackagelib.lib_patch
>  import checkpackagelib.lib_python
> @@ -107,6 +108,7 @@ def get_lib_from_filetype(fname):
>  
>  CONFIG_IN_FILENAME = re.compile(r"Config\.\S*$")
>  DO_CHECK_INTREE = re.compile(r"|".join([
> +    r".checkpackageignore",
>      r"Config.in",
>      r"arch/",
>      r"board/",
> @@ -146,6 +148,8 @@ def get_lib_from_filename(fname):
>          if os.path.basename(fname) == "external.mk" and \
>             os.path.exists(fname[:-2] + "desc"):
>              return None
> +    if fname == ".checkpackageignore":
> +        return checkpackagelib.lib_ignore
>      if CONFIG_IN_FILENAME.search(fname):
>          return checkpackagelib.lib_config
>      if fname.endswith(".hash"):
> diff --git a/utils/checkpackagelib/lib_ignore.py b/utils/checkpackagelib/lib_ignore.py
> new file mode 100644
> index 0000000000..f3698fc3b4
> --- /dev/null
> +++ b/utils/checkpackagelib/lib_ignore.py
> @@ -0,0 +1,14 @@
> +# See utils/checkpackagelib/readme.txt before editing this file.
> +
> +import os
> +
> +from checkpackagelib.base import _CheckFunction
> +
> +
> +class IgnoreMissingFile(_CheckFunction):
> +    def check_line(self, lineno, text):
> +        fields = text.split()
> +        if not os.path.exists(fields[0]):
> +            return ["{}:{}: ignored file {} is missing"
> +                    .format(self.filename, lineno, fields[0]),
> +                    text]
> diff --git a/utils/checkpackagelib/test_lib_ignore.py b/utils/checkpackagelib/test_lib_ignore.py
> new file mode 100644
> index 0000000000..6cd856d669
> --- /dev/null
> +++ b/utils/checkpackagelib/test_lib_ignore.py
> @@ -0,0 +1,18 @@
> +import pytest
> +import checkpackagelib.test_util as util
> +import checkpackagelib.lib_ignore as m
> +
> +
> +IgnoreMissingFile = [
> +    ('missing ignored file',
> +     '.checkpackageignore',
> +     'this-file-does-not-exist SomeTest',
> +     [['.checkpackageignore:1: ignored file this-file-does-not-exist is missing',
> +       'this-file-does-not-exist SomeTest']]),
> +    ]
> +
> +
> +@pytest.mark.parametrize('testname,filename,string,expected', IgnoreMissingFile)
> +def test_IgnoreMissingFile(testname, filename, string, expected):
> +    warnings = util.check_file(m.IgnoreMissingFile, filename, string)
> +    assert warnings == expected
> -- 
> 2.25.1
> 

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
