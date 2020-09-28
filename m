From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 28 Sep 2020 22:22:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/zstd: link programs dynamically
 with libzstd to save space
In-Reply-To: <20200928194037.GM11621@scaer>
References: <20200928114228.23637-1-patrickdepinguin@gmail.com>
 <20200928114228.23637-2-patrickdepinguin@gmail.com>
 <20200928194037.GM11621@scaer>
Message-ID: <CAAXf6LWp=sJ8CAUdxJ72paoN1kMbSTNorFqjs+crhyzjCofQ3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,



On Mon, Sep 28, 2020, 21:40 Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> Thomas, All,
>
> On 2020-09-28 13:42 +0200, Thomas De Schampheleire spake thusly:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > Even when a shared libzstd is built, the zstd command-line programs are
> > statically linked with libzstd, causing a large rootfs footprint.
> >
> > While the cmake backend in zstd already supported a flag
> > ZSTD_PROGRAMS_LINK_SHARED, the make backend did not.
>
> Any reason why we do not switch over to using cmake or meson? Both seem
> to be officially supported, see README.md:
>
>     ## Build instructions
>
>     ### Makefile
>     [...]
>
>     ### cmake
>     [...]
>
>     ### meson
>     [...]
>
> So, I'd rather we expend the effort to switch to cmake, as it already
> has ZSTD_PROGRAMS_LINK_SHARED (or to meson if it also fits the bill,
> whatever floats your boat), rather than patching the Makefile-based
> buildsystem.
>

In fact, only the make system is 'official'. The other build systems are
considered 'community-maintained'.
See e.g.
https://github.com/facebook/zstd/issues/1512
https://github.com/facebook/zstd/issues/1503
https://github.com/facebook/zstd/issues/1401

So from the perspective of the authors, only make is guaranteed to work.

Even though I think their makefiles are definitely not a good example, the
cmake build rules are not equivalent in operation to make, see the issue I
created myself:
https://github.com/facebook/zstd/issues/2261

So I wouldn't conclude that we better switch away from the make build
system of zstd.

(I don't understand why they have rules for so many different build
systems, which are then not aligned nor officially maintained. IMHO they
better pick one and make sure it works well.)

Best regards
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200928/7a0d4650/attachment.html>
