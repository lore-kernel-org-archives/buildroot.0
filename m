From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 May 2019 11:41:35 -0400
Subject: [Buildroot] [PATCH 1/1] package/meson: Fix linking of
 shared/static libs with static libs
In-Reply-To: <20190518215637.2ea2ea51@windsurf>
References: <20190514184245.92222-1-aduskett@gmail.com>
 <20190518215637.2ea2ea51@windsurf>
Message-ID: <CAFSsvmrR+CsitdAX4khEzYr+NmeNCVAvS6P6NDQzyrECaGBsfg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Thomas;

Sorry, it's for next.

Thanks!

Adam

On Sat, May 18, 2019 at 3:56 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> +Peter Seiderer in Cc. Peter, if you could review the below patch, it
> would be nice.
>
> On Tue, 14 May 2019 14:42:45 -0400
> aduskett at gmail.com wrote:
>
> > From: Adam Duskett <Aduskett@gmail.com>
> >
> > From https://github.com/mesonbuild/meson/pull/3939:
> >
> > This commit contains the following fixes:
> >
> >   1. When a shared library A does link_with: to static library B, the
> >      parts of B used by A will be added to A, and so we don't need to
> >      return B in A.get_dependencies() for targets that link to A. This
> >      already is the behaviour when a shared library A does link_whole:
> >      on B.
> >
> >   2. In situation (1), when generating a pkg-config file for A, we must
> >      also not add B to Libs.private for A. This already is the behaviour
> >      when a shared library A does link_whole: on B.
> >
> >   3. When a static library A does link_whole: to static library B, we
> >      must add the objects in B to A.
> >
> >   4. When a static library A does link_with: to static library B, and
> >      B is not installed (which makes it an internal static library), we
> >      must add the objects in B to A, otherwise nothing can use A.
> >
> >   5. In situation (4), when generating a pkg-config file for A, we must
> >      also not add B to Libs.private for A.
> >
> > Without this patch, static builds of libglib2 and gstreamer using the
> > meson build system will not compile and link properly.
> >
> > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>
> Adam: is this for next or master ? Since libglib2 and gstreamer in
> master are still using autotools, I would suppose this patch is for
> next. Could you confirm ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
