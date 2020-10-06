From: =?UTF-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LI=?= <leo@yuriev.ru>
Date: Tue, 6 Oct 2020 22:06:18 +0300
Subject: [Buildroot] [PATCH v3 1/1] package/libmdbx: new package
 (library/database).
In-Reply-To: <CAEyMn7Z_ThRrPqAPdn0X9N6LVHGiDNLT2oF=FpiDaeoWAGXBgw@mail.gmail.com>
References: <CAEyMn7ahanh2zR83cTNa_ZzdxCY5YL25z+wtA6gO4k32FXAXpA@mail.gmail.com>
 <20201005201554.1071637-2-leo@yuriev.ru>
 <CAEyMn7Z_ThRrPqAPdn0X9N6LVHGiDNLT2oF=FpiDaeoWAGXBgw@mail.gmail.com>
Message-ID: <CAO2+NUDJUL_FYfQ3E_cmmu20F3VOagxDpy_243a6mU3oAeASNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Heiko.

Thanks for comments.
I will send an updated (hope final) version of the patch soon.
And here are the answers to some of your questions/comments below.

On Tue, Oct 6, 2020 at 9:40 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> Hi Leonid,
>
> thank you for the new version. Some comments below.
[...]

> >  create mode 100644 package/libmdbx/0001-mdbx-fix-minor-copy-paste-typo.patch
> >  create mode 100644 package/libmdbx/0002-mdbx-cmake-fix-missing-installation-of-mdbx.h.patch
> >  create mode 100644 package/libmdbx/0003-mdbx-fix-obsolete-__noreturn.patch
> >  create mode 100644 package/libmdbx/0004-mdbx-don-t-use-yield-instruction-on-ARM-if-unsupport.patch
> >  create mode 100644 package/libmdbx/0005-mdbx-load-fix-minor-false-positive-GCC-warning.patch
> >  create mode 100644 package/libmdbx/0006-mdbx-cmake-pthread-workaround-for-buggy-toolchain-cm.patch
> >  create mode 100644 package/libmdbx/0007-mdbx-fix-pthread_yield-for-non-GLIBC.patch
>
> Is it required to add all these patches? They seem all to be in the
> upstream repo. So you could also set the version to the last commit id
> that contains all these changes.

Yes, these patches are required for amalgamated source code which is
available only for a releases (i.e. github's tags).

> > +config BR2_PACKAGE_LIBMDBX_TOOLS
> > +       bool "install tools"
>
> This config option is nowhere used? Do you miss to add it in the
> makefile or is it still a leftover?

This is my mistake.
Now fixed in the makefile.

> > +config BR2_PACKAGE_LIBMDBX_CXX
> > +       bool "C++ API"
> > +       select BR2_INSTALL_LIBSTDCPP
>
> When enabling CXX support you could add a comment that a toolchain
> with cpp support is required and not enable it by selecting this
> option.
[..]
> comment "libmdbx c++ support needs a toolchain w/ C++"
>                  depends on !BR2_INSTALL_LIBSTDCPP
[..]
> > +comment "libmdbx needs a toolchain w/ threads"
> > +       depends on !BR2_TOOLCHAIN_HAS_THREADS
>
> Here you the comment should look something like:
> comment "libmdbx needs a toolchain w/ threads, gcc >= 4.8"
>         depends on BR2_USE_MMU
>         depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_HAS_THREADS

Done.
I also clarified these dependencies.

Regards,
Leonid.
