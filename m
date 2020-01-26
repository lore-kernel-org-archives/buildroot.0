From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun, 26 Jan 2020 08:56:27 +0100
Subject: [Buildroot] Package can create
 LINUX_FINAL_RECURSIVE_DEPENDENCIES
In-Reply-To: <20200126075046.GG32369@scaer>
References: <CAEyMn7b_ESWcZ8ZBQAVYHxyXNQHrQUGx--8QGD1C6jj+F1=2gA@mail.gmail.com>
 <20200126075046.GG32369@scaer>
Message-ID: <CAEyMn7bt5+Cu3sNrL1n8XsG0U+x6iJd7SKP5zX37VZQyZxTsjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Am So., 26. Jan. 2020 um 08:50 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Heiko, All,
>
> On 2020-01-24 08:37 +0100, Heiko Thiery spake thusly:
> > I have a custom package (MYPACKAGE) in my BR2_EXTERNAL. This package
> > uses the "$(eval $(kernel-module))". In addition this package also
> > adds a kernel patch hook via BR2_EXTERNAL/linux-ext-MYPACKAGE.mk.
> >
> > As far as I see MYPACKAGE depends on linux (due to kernel-module) and
> > LINUX depends on MYPACKAGE due to the dependency created to
> > LINUX_PATCH_DEPENDENCIES.
> >
> > ----
> > # make linux-legal-info
> > linux/linux.mk:578: *** Recursive variable
> > 'LINUX_FINAL_RECURSIVE_DEPENDENCIES' references itself (eventually).
> > Stop.
> > make: *** [Makefile:23: _all] Error 2
> > ----
> >
> > Is having a package that does both (linux kernel module and kernel
> > patching) allowed?
>
> The linux-extensions are only _PATCH_DEPENDENCIES, that is the packages
> providing the extensions shall be extracted and patched before linux is
> patched.
>
> So, as far as a build is concerned, this does not cause a circular
> dependency.
>
> However, as you noticed later, this does generate a circular dependency,
> like gathering the elgal-info.
>
> > Can this be fixed?
>
> No, that 'can't be, I'm afraid... :-/
>
> > I think linux only need the
> > dependency to the MYPACKAGE_EXTRACT because the patch is not a result
> > of the build of this package.
>
> This is already the case, see above.
>
> > What do you think?
>
> As a short-term solution, just provide towo packages: one that provides
> the extension, one that provides the kernel module.
>
> However, if your package provides a kernel patch, why does it not patch
> the kernel with your new module to begin with, and have the module built
> as part of the kernel build? After all, that's the whole point of linux
> extensions: inject new code in the kernel build process.

I expected such an answer ;-)

Thank you anyway

> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
