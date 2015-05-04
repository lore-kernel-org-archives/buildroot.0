From: Antoine =?iso-8859-1?Q?T=E9nart?= <antoine.tenart@free-electrons.com>
Date: Mon, 4 May 2015 17:12:27 +0200
Subject: [Buildroot] [PATCH v7 10/13] Vivante drivers: bump to version
 3.10.17-1.0.1
In-Reply-To: <20150501225109.66e3b7ba@free-electrons.com>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-11-git-send-email-jezz@sysmic.org>
 <20150501225109.66e3b7ba@free-electrons.com>
Message-ID: <20150504151227.GC11312@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, May 01, 2015 at 10:51:09PM +0200, Thomas Petazzoni wrote:
> On Thu, 30 Apr 2015 17:12:25 +0200, J?r?me Pouiller wrote:
> > Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
> > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> > ---
> >  package/freescale-imx/gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           | 5 +++--
> >  .../x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.mk   | 2 +-
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> Applied, thanks. Is 3.10.17 the latest version of the GPU drivers? I
> think my colleague Antoine T?nart used a more recent version with the
> 3.10.53 Freescale kernel. Antoine, can you clarify?

The latest version of the Vivante drivers seems to be the 5.0.11.p4.1
one, at least that's what meta-fsl-arm is using since April, 2nd. I've
tested this new version with a 3.10.53 Freescale kernel, and it's
working fine.

You can see the version scheme does not follow the previous one, and
that's also true for other parts of this release: the binary name is
different and the sources aren't organized the same way.

Also, the package/freescale-imx/gpu-viv-bin-mx6q/0001-correct-HAL-include.patch
patch isn't needed anymore and some other minor modifications can be
done.

I'd be happy to send a patch, but because this isn't just a version bump
it's not (easily) possible to have both 3.10.17 and 5.0.11 versions to
live alongside. What's you thoughts on this?

Antoine

-- 
Antoine T?nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
