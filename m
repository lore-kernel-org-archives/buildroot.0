From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 27 Jan 2014 10:19:04 +0100
Subject: [Buildroot] [PATCH 1/1] Prefer 'command -v' over 'which' (for
	portability)
In-Reply-To: <1390659116-18865-1-git-send-email-bjorn.forsman@gmail.com>
References: <1390659116-18865-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <CAHXCMMKE-WDNCTQ82uuEM5n=t4Ua=qTDTTaBxQ7=wVgiBejd0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bj?rn, all,


2014-01-25 Bj?rn Forsman <bjorn.forsman@gmail.com>

> 'command -v' is defined by POSIX (and is available "everywhere"),
> 'which' is not.
>
> This is improves user experience when 'which' isn't installed so that
> there won't be error messages about missing 'which' *before* the
> Buildroot dependency check is run.
>
> Current behaviour:
>
>   $ make
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   /bin/sh: which: command not found
>   support/dependencies/check-host-tar.sh: line 5: which: command not found
>   support/dependencies/check-host-tar.sh: line 7: which: command not found
>   /home/bfo/buildroot/support/dependencies/dependencies.sh: line 56:
>   which: command not found
>
>   You must install 'which' on your build machine
>   make: *** [core-dependencies] Error 1
>

"command -v" seems not playing very well with aliases:

$ command -v make
alias make='~/.config/ctafconf/bin/colorwarper make'
$ which make
/usr/bin/make


Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140127/51ea7d8c/attachment.html>
