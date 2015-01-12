From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Jan 2015 23:54:39 +0100
Subject: [Buildroot] [PATCH] dtc: update source url
In-Reply-To: <1420964731-10432-1-git-send-email-fabio.porcedda@gmail.com>
References: <1420964731-10432-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150112225439.GD9000@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2015-01-11 09:25 +0100, Fabio Porcedda spake thusly:
> The url of the git repository is changed so use the updated one.
> 
> This fix the error:
> 
> fatal: unable to connect to git.jdl.com:
> git.jdl.com[0: 208.123.73.151]: errno=Connection refused

Yup, it is dead now... :-(

However, Peter S. has a current series handling the same issue, with
further enhancement to dtc:
    http://patchwork.ozlabs.org/patch/427484/  (fix URL)
    http://patchwork.ozlabs.org/patch/427483/  (bump)
    http://patchwork.ozlabs.org/patch/427485/  (host-dtc)
    http://patchwork.ozlabs.org/patch/427486/  (overlay support)

So, I've marked your patch as Superseded in PAtchwork (even though Peter
was asked to do some changes on his series. Care to have a look when he
respins? Thanks!

Peter, you may want to Cc Fabio on your next spin of the fix+bump parts.

Regards,
Yann E. MORIN.

> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  package/dtc/dtc.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> index 51b5b4e..ba1280e 100644
> --- a/package/dtc/dtc.mk
> +++ b/package/dtc/dtc.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  DTC_VERSION = v1.4.0
> -DTC_SITE = git://git.jdl.com/software/dtc.git
> +DTC_SITE = https://git.kernel.org/pub/scm/utils/dtc/dtc.git
> +DTC_SITE_METHOD = git
>  DTC_LICENSE = GPLv2+/BSD-2c
>  DTC_LICENSE_FILES = README.license GPL
>  DTC_INSTALL_STAGING = YES
> -- 
> 2.1.0
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
