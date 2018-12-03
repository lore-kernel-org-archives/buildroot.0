From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 3 Dec 2018 23:13:04 +0100
Subject: [Buildroot] [PATCH 2/2] lxc: fix build without stack protector
In-Reply-To: <20181203230143.74e2ea17@windsurf.home>
References: <20181203214637.6633-1-fontaine.fabrice@gmail.com>
 <20181203214637.6633-2-fontaine.fabrice@gmail.com>
 <20181203230143.74e2ea17@windsurf.home>
Message-ID: <CAPi7W83MkCBb7-t_8XjuGkSvQxTJa=8pGHcFnPVSe=aPucQSQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le lun. 3 d?c. 2018 ? 23:01, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Mon,  3 Dec 2018 22:46:37 +0100, Fabrice Fontaine wrote:
> > Add an option to disable the stack protector flags added in version
> > 3.0.3 by
> > https://github.com/lxc/lxc/commit/2268c27754152aa538db2c9e3753d72d19bcd17a
> >
> > Fixes:
> >  - http://autobuild.buildroot.org/results/0b90e7dca2984652842832a41abad93ac49a9b86
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Thanks for working on this!
>
>
> > ++if test "x$enable_hardening" = "xyes"; then
> > ++    AX_CHECK_COMPILE_FLAG([-fstack-clash-protection], [CFLAGS="$CFLAGS -fstack-clash-protection"],,[-Werror])
> > ++    AX_CHECK_COMPILE_FLAG([-fstack-protector-strong], [CFLAGS="$CFLAGS -fstack-protector-strong"],,[-Werror])
> > ++    AX_CHECK_COMPILE_FLAG([-g], [CFLAGS="$CFLAGS -g"],,[-Werror])
>
> Why is -g handled as one of the hardening flags ? Building with
> debugging symbols can hardly be considered "hardening" :-)
Indeed ...
>
> Also, is upstream going to accept this --enable/--disable option ?
> Should we instead use AX_CHECK_LINK_FLAG() ?
I didn't think about this solution and I have not send this second
patch upstream yet. I will try it and send a v2.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
