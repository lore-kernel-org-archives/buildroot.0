From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Jun 2014 23:01:46 +0200
Subject: [Buildroot] [PATCH 1/5] freescale-imx: bump to version
	3.10.17-1.0.0
In-Reply-To: <CADCpmyNGmM_FoGGoiDS640wjjrQfNkMBsdf+HBfpFgn9aAptKw@mail.gmail.com>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
 <1403150639-29382-2-git-send-email-bisson.gary@gmail.com>
 <20140619162009.GA3534@free.fr>
 <CADCpmyNGmM_FoGGoiDS640wjjrQfNkMBsdf+HBfpFgn9aAptKw@mail.gmail.com>
Message-ID: <20140620210146.GB26745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

On 2014-06-19 19:40 -0700, Gary Bisson spake thusly:
> > > diff --git
> > a/package/freescale-imx/imx-vpu/imx-vpu-0001-fix-IOSystemInit-failure.patch
> > b/package/freescale-imx/imx-vpu/imx-vpu-0001-fix-IOSystemInit-failure.patch
> > > new file mode 100644
> > > index 0000000..b73a959
> > > --- /dev/null
> > > +++
> > b/package/freescale-imx/imx-vpu/imx-vpu-0001-fix-IOSystemInit-failure.patch
> > > @@ -0,0 +1,21 @@
> > > +[PATCH] fix IOSystemInit failure
> >
> > Please provide a more detailed comit log. Why do we need this?
> >
> 
> As I said in the first patch I used the nitrogen6x to do my testing, there
> is one "big" difference between freescale and boundary kernel which is the
> memory split (2G/2G for FSL, 3G/1G for Boundary). Clearly the VPU code has
> only been tested on Freescale kernels because there is no way it works on
> kernel with the latter splitting. The VPU init function returns an error if
> the allocated buffer address is < 0 which does not make any sense. Instead
> the test should be against MAP_FAILED (-1). Only after that patch I've been
> able to get the VPU decoding working. I will change the -1 into MAP_FAILED
> for the next patch.

OK, I see. You should also repeat this in the patch description, like:

    vpu-io: fix IOSystemInit failure

    There is one "big" difference between freescale and boundary kernel
    which is the memory split (2G/2G for FSL, 3G/1G for Boundary).

    Clearly the VPU code has only been tested on Freescale kernels
    because there is no way it works on kernel with the latter
    splitting. The VPU init function returns an error if the allocated
    buffer address is < 0, which happens with the 3G/1G split.

    Fix the test by checking against MAP_FAILED instead.

    Signed-off-by: You <you@there>

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
