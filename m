From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 9 Dec 2012 19:14:33 +0100
Subject: [Buildroot] [PATCH 07/33] fluxbox: fix build against imlib2
In-Reply-To: <878v9sfzpg.fsf@dell.be.48ers.dk>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-8-git-send-email-s.martin49@gmail.com>
 <878v9sfzpg.fsf@dell.be.48ers.dk>
Message-ID: <CAHXCMMJ8ZvNQn2212REnz1C6uo0zLCBegGY2zCppEHYz6sfiJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, all,

2012/11/23 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:
>
>  Samuel> * fix missing dependency
>  Samuel> * set imlib2 prefix at configure time
>  Samuel> * fix configure script to take account of the imlib2 prefix if any
>
> Ehh, fluxbox doesn't select imlib2 in it's Config.in and it looks like
> it's an optional dependency:
>
> From configure.in:
>
> dnl Check whether to use imlib2
> IMLIB2=false
> AC_MSG_CHECKING([whether to have Imlib2 (pixmap themes) support])
> AC_ARG_ENABLE(imlib2,
>     AC_HELP_STRING([--enable-imlib2],
>                    [Imlib2 (pixmap themes) support ([default=yes])]), ,
>                    [enable_imlib2=yes])
>
> So all of this should only be done if BR2_PACKAGE_IMLIB2 is enabled.
Right, I'll recook the patch.

>
>  Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>  Samuel> ---
>  Samuel>  package/fluxbox/fluxbox-fix-configure.patch | 19 +++++++++++++++++++
>
> Please consider sending this patch upstream.
Done.

Regards,

-- 
Sam
