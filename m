From: Goe <sombradecrisantemo@gmail.com>
Date: Tue, 7 Jul 2015 08:45:31 +0200
Subject: [Buildroot] Error when opencv is included in compilation,
 'i586-buildroot-linux-g++' file is missed
In-Reply-To: <20150706145944.34253727@free-electrons.com>
References: <CACiBgcej-aEteA67kBPy9HXm20QQQHOnCVbrQqWKfhN2Ne0xiQ@mail.gmail.com>
 <20150706145944.34253727@free-electrons.com>
Message-ID: <CACiBgcenjFfyMCtTt8MiMjY1oj2qEZSSe=BHzK+jNPfntriU0Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You are right. I have tried this morning, and the compilation finishes
without errors.
Thank you very much.

On Mon, Jul 6, 2015 at 2:59 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Mon, 6 Jul 2015 14:46:21 +0200, Goe wrote:
>
> > I am trying to compile a buildroot instance with opencv included using a
> > machine with Ubuntu 14.04. The first compilation (before include opencv)
> is
> > correct, but it fails when I try to compile again including opencv in the
> > configuration.
> >
> > The strangest thing is that the same steps work correctly in other
> machines
> > with Ubuntu 12.04 and Debian 8 (I do not have another Ubuntu 14.04
> machine).
> >
> > The followed steps are:
> > * make clean
> > * make (compilation finished without errors)
> > * make nconfig (Include WCHAR, C++ support and OpenCV)
> > * make
>
> That's your problem. Since you enabled WCHAR and C++, you need to do a
> full rebuild, i.e "make clean all".
>
> See http://buildroot.org/downloads/manual/manual.html#full-rebuild:
>
> """
> When the toolchain configuration is changed, a complete rebuild
> generally is needed. Changing the toolchain configuration often
> involves changing the compiler version, the type of C library or its
> configuration, or some other fundamental configuration item, and these
> changes have an impact on the entire system.
> """
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
A menudo encontramos nuestro destino por los caminos que tomamos para
evitarlo.
Jean de la Fontaine (1621-1695) Escritor y poeta franc?s.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150707/4d44150a/attachment.html>
