From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Jun 2014 18:57:28 +0200
Subject: [Buildroot] [PATCH] freescale-imx: bump version to 3.10.17-1.0.0
In-Reply-To: <CADCpmyNrJ88qi2bCvmB719pLDUhwpEJCJ5TqEoVLjARNOOELvQ@mail.gmail.com>
References: <1402615435-21137-1-git-send-email-bisson.gary@gmail.com>
 <20140613161454.GA3496@free.fr>
 <CADCpmyNrJ88qi2bCvmB719pLDUhwpEJCJ5TqEoVLjARNOOELvQ@mail.gmail.com>
Message-ID: <20140613165728.GB3496@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Garry, All,

On 2014-06-13 09:51 -0700, Gary Bisson spake thusly:
> On Fri, Jun 13, 2014 at 9:14 AM, Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
> > On 2014-06-12 16:23 -0700, Gary Bisson spake thusly:
> > > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> >
> > NAK.
> >
> > With 3.10.17, imx-lib no longer bundles the VPU code, which is now
> > provided in a separate package, imx-vpu.
> 
> My bad, I've only checked that it built and that the GPU examples were
> running fine.

Yep, that's OK. :-)
Reviews are there to help find out this kind of issue. No worries! ;-)

Could you (briefly) explain in your commit log (after the '---' line) how
you did the test, so it is easy to reproduce? Something like:

    package/freescale-imx: bump version

    Blabla commit log

    Signed-off-by: you

    ---
    GPU tests are runnign fine, with just running:
        blabla-freescale-demo-program --some-option
    VPU tests not done, for lack of need.

Thanks! :-)

> > See chapter "Version by SoC Hierarchy" from:
> >     https://freescale.github.io/doc/release-notes/1.6/
> >
> > So, bumping to 3.10.17 would need adding the imx-vpu package first.
> >
> > Then, libfslvpuwrap should be made dependent on imx-vpu instead of
> > imx-lib, obviously. To be noted, the version of libfslvpuwrap will not
> > be aligned to the other imx components.
> >
> 
> Would you recommend removing the generic FREESCALE_IMX_VERSION in order to
> specify a version for each component? Or would you prefer adding a new
> variable just for the libslvpuwrap?

The latter: just keep the common version for all components, and just
specify the specific version for libfslvpuwrap.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
