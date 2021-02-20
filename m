From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2021 17:42:43 +0100
Subject: [Buildroot] [PATCH] utils/scanpypi: use python3 explicitly
In-Reply-To: <20210216214513.273743-1-thomas.petazzoni@bootlin.com>
References: <20210216214513.273743-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210220164243.GM2276@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-02-16 22:45 +0100, Thomas Petazzoni spake thusly:
> scanpypi is python3 compatible. In addition, it executes the setup.py
> of Python modules to extract the relevant information. Since these are
> more and more commonly using python3 constructs, using "python" to run
> scanpypi causes problems on systems that have python2 installed as
> python, when trying to parse setup.py scripts with python3 constructs.
> 
> Fixes part of #13516.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I was about to apply it to master, but then I got a bit uneasy about
doing so. I was wondering whether it really is master material, or
whether it should go to next...

But in the end, our own python(2) package is now marked deprecated
already, so we do not expect people to actually add new python2-only
packages with scanpypi, and thus it does make sense that scanpypy is
switched to python3.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  utils/scanpypi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/scanpypi b/utils/scanpypi
> index 51bc249f9e..47c7c00c60 100755
> --- a/utils/scanpypi
> +++ b/utils/scanpypi
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  """
>  
>  Utility for building Buildroot packages for existing PyPI packages
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
