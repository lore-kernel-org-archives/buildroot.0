From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Aug 2020 21:24:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfuse3: bump to version 3.9.3
In-Reply-To: <20200809172719.117517-1-asafka7@gmail.com>
References: <20200809172719.117517-1-asafka7@gmail.com>
Message-ID: <20200809192413.GD13263@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asaf, All,

On 2020-08-09 20:27 +0300, Asaf Kahlon spake thusly:
> Drop patch (already in version).
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  ...op_mt-as-a-macro-on-uclibc-and-MacOS.patch | 52 -------------------
>  package/libfuse3/libfuse3.hash                |  2 +-
>  package/libfuse3/libfuse3.mk                  |  2 +-
>  3 files changed, 2 insertions(+), 54 deletions(-)
>  delete mode 100644 package/libfuse3/0001-Define-fuse_session_loop_mt-as-a-macro-on-uclibc-and-MacOS.patch
[--SNIP--]
> diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
> index 1e959640e2..9401ac9523 100644
> --- a/package/libfuse3/libfuse3.mk
> +++ b/package/libfuse3/libfuse3.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBFUSE3_VERSION = 3.9.2
> +LIBFUSE3_VERSION = 3.9.3

So, upstream has been clumsy: they tagged 3.9.4 (2020-08-09 12:49:29),
then tagged 3.9.3 (2020-08-09 12:52:00); both tag point to the same
commit, though.

But to avoid false positive about version check, I think we'd better
bump to 3.9.4.

Regards,
Yann E. MORIN.

>  LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
>  LIBFUSE3_LICENSE = LGPL-2.1
>  LIBFUSE3_LICENSE_FILES = LICENSE
> -- 
> 2.26.2
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
