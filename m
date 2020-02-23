From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2020 11:15:53 +0100
Subject: [Buildroot] [PATCH 1/2] package/libftdi1: fix unresolved symbol
 issue
In-Reply-To: <20200210091149.8584-1-yegorslists@googlemail.com>
References: <20200210091149.8584-1-yegorslists@googlemail.com>
Message-ID: <20200223101553.GN8743@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2020-02-10 10:11 +0100, yegorslists at googlemail.com spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> GCC later than 5.x produce _fdti1.so file with an undefined
> symbol str2charp_size due to C99 inline semantics change. So
> remove this keyword.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...g-python-fix-unresolved-symbol-issue.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/libftdi1/0005-swig-python-fix-unresolved-symbol-issue.patch
> 
> diff --git a/package/libftdi1/0005-swig-python-fix-unresolved-symbol-issue.patch b/package/libftdi1/0005-swig-python-fix-unresolved-symbol-issue.patch
> new file mode 100644
> index 0000000000..bffaf12f91
> --- /dev/null
> +++ b/package/libftdi1/0005-swig-python-fix-unresolved-symbol-issue.patch
> @@ -0,0 +1,30 @@
> +From e12e592e982fe71b2761da0de7b19e93f67ed22c Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Tue, 6 Aug 2019 13:42:06 +0200
> +Subject: [PATCH] swig: python: fix unresolved symbol issue
> +
> +GCC later than 5.x produce _fdti1.so file with an undefined
> +symbol str2charp_size due to C99 inline semantics change. So
> +remove this keyword.
> +
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

I've added upstream status (as a ref to the upstream sha1), and applied
both patches to master, thanks.

Regards,
Yann E. MORIN.

> +---
> + python/ftdi1.i | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/python/ftdi1.i b/python/ftdi1.i
> +index 93793f8..0d150cb 100644
> +--- a/python/ftdi1.i
> ++++ b/python/ftdi1.i
> +@@ -19,7 +19,7 @@ inline PyObject* charp2str(const char *v_, long len)
> + #endif
> + }
> + 
> +-inline char * str2charp_size(PyObject* pyObj, int * size)
> ++char * str2charp_size(PyObject* pyObj, int * size)
> + {
> +   char * v_ = 0;
> + #if PY_MAJOR_VERSION >= 3
> +-- 
> +2.17.0
> +
> -- 
> 2.17.0
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
