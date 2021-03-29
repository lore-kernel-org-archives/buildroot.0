From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Mar 2021 23:44:55 +0200
Subject: [Buildroot] [PATCH 2/2] package/libqmi: needs headers >= 4.14
In-Reply-To: <CAAP7uc+4zEWFj-unho79p7mm6puX_XR-xiXPjcLqpfbScuwUYA@mail.gmail.com>
References: <20210329211957.321612-1-fontaine.fabrice@gmail.com>
 <20210329211957.321612-2-fontaine.fabrice@gmail.com>
 <CAAP7uc+4zEWFj-unho79p7mm6puX_XR-xiXPjcLqpfbScuwUYA@mail.gmail.com>
Message-ID: <CAPi7W81whpXvH0unTvU=HE5nb11-UeLbX5QK6WAPoOTrMroXcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Aleksander,

Le lun. 29 mars 2021 ? 23:41, Aleksander Morgado
<aleksander@aleksander.es> a ?crit :
>
> Hey Fabrice,
>
> On Mon, Mar 29, 2021 at 11:23 PM Fabrice Fontaine
> <fontaine.fabrice@gmail.com> wrote:
> >
> > libqmi unconditionnally uses ARPHRD_RAWIP since version 1.28.0 and
> > https://github.com/freedesktop/libqmi/commit/4085a2d6b771a40fb637433ed6a05b9d5d4d94b9
> > https://github.com/freedesktop/libqmi/commit/19f4b39ee85500e7e868b8a100fba19c04fb3c30
> >
> > However, ARPHRD_RAWIP is only available since kernel 4.14 and
> > https://github.com/torvalds/linux/commit/cdf4969c42a6c1a376dd03a9e846cf638d3cd4b1
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/c8853b7161bd85d46c1282c6c097e7ef4042ae68
> >
>
> This is totally not intentional; the ARPHRD_RAWIP symbol is used in
> the rmnet backend, and the rmnet backend itself should only be used if
> the kernel has rmnet support, which we look for at configure time with
> the following check:
>
> AC_EGREP_HEADER([ifla_rmnet_flags],
>                 [linux/if_link.h],
>                 [enable_rmnet_support=yes],
>                 [enable_rmnet_support=no])
>
> We should probably improve that check to also include a lookup for the
> ARPHRD_RAWIP symbol.
> What do you think?
Thanks for your feedback, I wasn't sure if it was intentional or not
by reading the two commit messages.
I'll set this patch as rejected on patchwork.
Feel free to send another patch as avoiding this dependency on kernel
4.14 would be great indeed.
>
> --
> Aleksander
> https://aleksander.es
Best Regards,

Fabrice
