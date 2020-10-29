From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 29 Oct 2020 14:41:32 +0100
Subject: [Buildroot] [PATCH] package/libgpiod: bump version to 1.6
In-Reply-To: <20201029141343.18ad9770@windsurf.home>
References: <20201029135017.652486f7@windsurf.home>
 <7e-5f9abe80-1-60a72780@84134619>
 <20201029141343.18ad9770@windsurf.home>
Message-ID: <CAMRc=MfTQ4o8TTV6UDR27dGBPqbUJA9EAFykdO0Rb3LDjp4Gkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 29, 2020 at 2:13 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu, 29 Oct 2020 14:06:45 +0100
> "Michael Nosthoff" <buildroot@heine.tech> wrote:
>
> > At least that's how I interpret this comment in the NEWS for 1.5 [0]:
> >
> > - added support for bias flags which are a new functionality first available in
> >   linux v5.5; subsequently the library now requires v5.5 kernel headers to
> >   build;
> >
> > But maybe Bartosz can clarify on this, as he basically is the "upstream" :)
>
> Wow, actually things are even worse. The latest upstream commit goes
> like this:
>
>     treewide: make linux v5.10 a hard requirement for libgpiod
>
>     The library now uses v2 of the GPIO uAPI. The new user interface is
>     scheduled for release as part of linux v5.10. Linux v5.10-rc1 is now
>     tagged so make v5.10 headers a requirement for the build and update
>     all tests to check for the correct version.
>
>     Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> So a userspace package requires a not-even released Linux kernel
> version, without backward compatibility for older kernel versions. This
> seems like a really really odd decision from upstream :-/
>

Thomas,

This is the master branch - it's not meant for being deployed in
distros - this is what stable branches are for. We now have a new ABI
in linux and libgpiod has just started a new release cycle that will
break the API and ABI of the library - hence the version bump to v2.0
from v1.6 - in order to use new kernel features.

v2.0 of libgpiod will no longer support older kernels but I'll support
v1.6 indefinitely for older kernels and v1.4 as long as v5.4 is
supported.

Bartosz
