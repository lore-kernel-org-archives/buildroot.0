From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Fri, 15 Jul 2016 17:14:26 -0600
Subject: [Buildroot] [PATCH 2/3] sdl2_image: new package
In-Reply-To: <20160715162240.391878a0@free-electrons.com>
References: <1468335185-19378-1-git-send-email-peter.macleod.thompson@gmail.com>
 <1468335185-19378-2-git-send-email-peter.macleod.thompson@gmail.com>
 <20160715162240.391878a0@free-electrons.com>
Message-ID: <CAGrGpJCrx5bYFiU0FiAgvZjxtHyF+gTrOSJeERn6-8ZpXjbc0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas for doing all these changes.   Your work on this is
appreciated!!

Peter

On Fri, Jul 15, 2016 at 8:22 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue, 12 Jul 2016 08:53:04 -0600, Peter Thompson wrote:
> > sdl2_image created from sdl2_image with minor changes for sdl2
> >
> > Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
> > ---
> >  package/Config.in                  |  1 +
> >  package/sdl2_image/Config.in       | 61
> ++++++++++++++++++++++++++++++++++++++
> >  package/sdl2_image/sdl2_image.hash |  2 ++
> >  package/sdl2_image/sdl2_image.mk   | 51 +++++++++++++++++++++++++++++++
> >  4 files changed, 115 insertions(+)
> >  create mode 100644 package/sdl2_image/Config.in
> >  create mode 100644 package/sdl2_image/sdl2_image.hash
> >  create mode 100644 package/sdl2_image/sdl2_image.mk
>
> Applied, after doing the following changes:
>
>     [Thomas:
>      - remove all sub-options to select the various image formats. Between
>        no formats enabled and all formats enabled, the size difference of
>        the library is ~30 KB, so it really isn't worth having all those
>        sub-options:
>        -rwxr-xr-x 1 thomas thomas  22444 juil. 15 15:51
> libSDL2_image-2.0.so.0.0.1
>        -rwxr-xr-x 1 thomas thomas  59216 juil. 15 15:52
> libSDL2_image-2.0.so.0.0.1
>        consequently, we simply enable unconditionally all image formats
>        that don't have any dependency, and use "automatic" dependencies
>        for the 4 formats that require an external library
>      - remove the host package variant, as it isn't used anywhere.
>      - remove --with-sdl2-prefix and --with-sdl2-exec-prefix, and instead
>        add a dependency on host-pkgconf so that pkg-config is used
>      - remove --disable-static, this is handled by the autotools-package
>        infrastructure already
>      - point <pkg>_LICENSE_FILES to an existing file.]
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160715/a590c5bd/attachment.html>
