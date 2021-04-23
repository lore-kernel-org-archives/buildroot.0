From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 23 Apr 2021 22:51:42 +0200
Subject: [Buildroot] host-uboot-tools 2021.04 Building
In-Reply-To: <20210423222256.29765511@windsurf>
References: <BY3PR08MB70263DC18FF3A4DD50161A67CC459@BY3PR08MB7026.namprd08.prod.outlook.com>
 <20210423222256.29765511@windsurf>
Message-ID: <CAPi7W83FQr69KLwqfNSmd4pjO8Fuz5_GkG=f0gApyAvpwMVJ5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le ven. 23 avr. 2021 ? 22:22, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> Adding Fabrice in Cc since he is the author of the 2021.04 bump.
>
> On Thu, 22 Apr 2021 23:03:31 -0400
> Enoch <ixew@hotmail.com> wrote:
>
> > This is a failed attempt to buildroot latest 1054aa9707 master origin/master
> >
> > I guess it is a result of this commit, but I may be wrong:
> >
> >
> > a4c38ae470 * package/uboot-tools: security bump to version 2021.04
> >
> >
> > TIA, Enoch.
> >
> >
> >   HOSTCC  tools/common/image-fit.o
> > In file included from ./tools/../common/image-fit.c:33,
> >                  from tools/common/image-fit.c:1:
> > include/linux/kconfig.h:4:10: fatal error: generated/autoconf.h: No such file or directory
> >     4 | #include <generated/autoconf.h>
> >       |          ^~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
>
> I can confirm that many of the defconfigs failed to build today in
> Gitlab CI because of this issue.
I sent a patch yesterday that should fix this issue:
https://patchwork.ozlabs.org/project/buildroot/patch/20210422210559.707845-1-fontaine.fabrice at gmail.com/
If you can review it, it would be helpful.
Moreover, I'm not sure than it is upstreamable as it reverts an
upstream commit ...
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
