From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sat, 27 Feb 2021 12:35:27 -0600
Subject: [Buildroot] [PATCH v2] package/fakeroot: fix glibc detection on
 patch for new wrappers
In-Reply-To: <875z2ds7mw.fsf@dell.be.48ers.dk>
References: <20210221223828.2750676-1-ryanbarnett3@gmail.com>
 <875z2ds7mw.fsf@dell.be.48ers.dk>
Message-ID: <CALq67GBoFtCefLpDVykD1h25yn+atOZWiWWM9hKnsD_SVy2-9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Sat, Feb 27, 2021 at 12:11 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:
>
>  > Commit f45925a951318e9e53bead80b363e004301adc6f add the patch:
>  > 0003-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch
>
>  > which allowed fakeroot to be compiled with GLIBC 2.33 or above.
>  > However, this introduce a bug for building with a non-GLIBC based
>  > toolchain as a GLIBC macro - __GLIBC_PREREQ - is used on the same line
>  > as the detection of GLIBC.
>
>  > Fix this by backporting the fix to this incorrect macro from upstream
>  > commit:
>
>  > https://salsa.debian.org/clint/fakeroot/-/commit/8090dffdad8fda86dccd47ce7a7db8840bdf7d7b
>
>  > CC: Yann E. MORIN <yann.morin.1998@free.fr>
>  > Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
>  > ---
>  > v1 -> v2:
>  >  - added patch as standalone patch (suggested by Yann)
>
> Committed to 2020.11.x, thanks.
>
> The patch does not apply to 2020.02.x. Is it needed there as well?
> Presumably yes - Care to send a patch?

Yes it appears that this would apply to 2020.02.x since it is carry a
patch to add support glibc 2.33:

https://git.busybox.net/buildroot/tree/package/fakeroot/0006-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch?h=2020.02.x

> Are you really running Buildroot under MacOS? Does that work?

I was looking at using buildroot on the bare minimum Alpine Linux
Docker container to help with finding issues with missing host
dependencies. Specifically looking at building on a non-glibc host
machine since Alpine is a musl based distro. Eventually my goal is to
have an autobuilder somewhere that actually builds with the minimum
package list which is listed in the buildroot manual.

Hopefully soon I can send a patch series which describes what issues
I've found and some patches for some missing host dependencies on some
packages.

Thanks,
-Ryan
