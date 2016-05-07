From: Christian Stewart <christian@paral.in>
Date: Sat, 07 May 2016 13:05:56 +0000
Subject: [Buildroot] [PATCH 1/1] package/go: bump version to 1.6.2
In-Reply-To: <20160507144348.0b464906@free-electrons.com>
References: <1462551812-8952-1-git-send-email-christian@paral.in>
 <1462557702.27026.27.camel@infradead.org>
 <20160507144348.0b464906@free-electrons.com>
Message-ID: <CA+h8R2oG-4YsVC_K3ZrTOjbX2B8Xic8HeuZJi9bo7m4C_FXjcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It initially looks to me like we should add -fPIC to the cgo compilation
flags. Will test and see.

Thanks for the patch.

Best,
Christian

On Sat, May 7, 2016, 8:43 AM Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Fri, 06 May 2016 11:01:42 -0700, Geoff Levand wrote:
>
> > --- a/package/go/Config.in.host
> > +++ b/package/go/Config.in.host
> > @@ -2,5 +2,5 @@ config BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> >       bool
> >       default y
> >       depends on BR2_TOOLCHAIN_HAS_THREADS
> > -     depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 ||
> BR2_powerpc64 || BR2_powerpc64le
> > +     depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 ||
> BR2_powerpc64 || BR2_powerpc64le || BR2_mips64 || BR2_mips64el
> >       depends on !BR2_ARM_CPU_ARMV4
> >
> > --- a/package/go/go.mk
> > +++ b/package/go/go.mk
> > @@ -30,6 +30,10 @@ else ifeq ($(BR2_powerpc64),y)
> >  GO_GOARCH = ppc64
> >  else ifeq ($(BR2_powerpc64le),y)
> >  GO_GOARCH = ppc64le
> > +else ifeq ($(BR2_mips64),y)
> > +GO_GOARCH = mips64
> > +else ifeq ($(BR2_mips64el),y)
> > +GO_GOARCH = mips64le
> >  endif
> >
> >  HOST_GO_DEPENDENCIES = host-go-bootstrap
>
> Could you submit this as a proper patch, with a description and your
> SoB ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160507/b51cee72/attachment.html>
