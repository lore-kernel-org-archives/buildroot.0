From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Fri, 4 Sep 2020 11:04:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/dotnet-runtime: add dotnet core
 runtime package
In-Reply-To: <20200904094853.51a68bf0@windsurf.home>
References: <20200819130612.46440-1-andreynech@gmail.com>
 <CAEyMn7Zb1G7niRkSzokNs+WUBvfCFYiJ9o_0=bew_TPpPivGBQ@mail.gmail.com>
 <20200904094853.51a68bf0@windsurf.home>
Message-ID: <CAOiXNkAuXC-ntUmWPC_GBQxrZ=Ezvn1kO7383W3E6ey5BV-Vng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you guys for the comments!
Will work on it next days and provide the new version for review.

On Fri, 4 Sep 2020 at 09:48, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Heiko, hello Andrey,
>
> On Fri, 4 Sep 2020 09:34:22 +0200
> Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> > > diff --git a/package/dotnet-runtime/Config.in b/package/dotnet-runtime/Config.in
> > > new file mode 100644
> > > index 0000000000..deb3289c94
> > > --- /dev/null
> > > +++ b/package/dotnet-runtime/Config.in
> > > @@ -0,0 +1,15 @@
> > > +comment "dotnet-runtime needs a toolchain w/ glibc or musl and threads"
> > > +       depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
> > > +
> > > +config BR2_PACKAGE_DOTNET_RUNTIME
> > > +       bool "dotnet-runtime"
> > > +       depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
> > > +       depends on BR2_TOOLCHAIN_HAS_THREADS
> > > +       depends on BR2_PACKAGE_LIBZLIB
>
> This should be BR2_PACKAGE_ZLIB, unless you really need the LIBZLIB
> variant (I don't know if the original zlib and zlib-ng are ABI
> compatible).
>
> > > +       depends on BR2_PACKAGE_OPENSSL
> > > +       depends on BR2_PACKAGE_LIBCURL
> > > +       depends on BR2_PACKAGE_ICU
> >
> > Not clear for me if we should select the dependent packages?
>
> Yes, we should. However, I'm trying to understand: the .NET Core
> runtime is provided binary only. Is it linked against external shared
> libraries (zlib, openssl, curl, icu) ?
>
> > > +       help
> > > +         .NET Core 3.1 Runtime (v3.1.7) - Linux ARM32 binaries
> >
> > Isn't it also x86 and arm64?
>
> So we should probably have a BR2_PACKAGE_DOTNET_RUNTIME_ARCH_SUPPORTS
> hidden config boolean, which is used to show the package and its
> Config.in comment only on supported architectures ?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
