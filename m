From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 21:50:14 +0200
Subject: [Buildroot] [PATCH 19/54] libv4l: add license information
In-Reply-To: <1403636160-11807-19-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-19-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140625195014.GE3489@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Small typo, see below...

> ---
>  package/libv4l/libv4l.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index f62a4b6..56523d0 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -10,6 +10,8 @@ LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils/
>  LIBV4L_INSTALL_STAGING = YES
>  LIBV4L_MAKE_OPTS = PREFIX=/usr
>  LIBV4L_DEPENDENCIES = jpeg
> +LIBV4L_LICENSE = GPLv2+ (utiltiies), LGPLv2.1+ (libraries)

utiltiies -> utilities


> +LIBV4L_LICENSE_FILES = COPYING COPYING.LIB

There's also:
    lib/libv4l1/libv4l1-kernelcode-license.txt

since libv4l1 includes GPLv2-licensed code from the Linux kernel, but
libv4l1 is tiself LGPLV2.1+.

If the end-user believes this is not needed, he can still trash this
file out of his compliance archive. However, we should install it into
legal-info.

Regards,
Yann E. MORIN.

>  LIBV4L_DIRS_y += lib
>  LIBV4L_DIRS_$(BR2_PACKAGE_LIBV4L_DECODE_TM6000)	+= utils/libv4l2util utils/decode_tm6000
> -- 
> 1.8.5.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
