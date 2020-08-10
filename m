From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 10 Aug 2020 19:11:49 +0200
Subject: [Buildroot] [PATCH v2] package/librtlsdr: bump to last commit
In-Reply-To: <20200808174715.4f9f0875@windsurf.home>
References: <20200727163039.15873-1-gwenj@trabucayre.com>
 <20200808174715.4f9f0875@windsurf.home>
Message-ID: <20200810191149.64db872c@x230_1.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all.

Build issue with dump1090 is fixed by
http://patchwork.ozlabs.org/project/buildroot/patch/20200809093538.126676-1-titouan.christophe at railnova.eu/

For librtlsdr itself: I have tried all build failure but unable to reproduce this issue (tested with docker image provided by buildroot).

If someone has an other Dockerfile for this I'm interested

Best regards
Gwenhael

On Sat, 8 Aug 2020 17:47:15 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Mon, 27 Jul 2020 18:30:39 +0200
> Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> 
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > Last official release is 2 years ago.
> > 
> > Current master branch provides fixes and improvements:
> > - fix crash with usbfs mmap with usb controler has no DMA support and kernel < 5.6 [1].
> > - better SDR dongle configuration
> > 
> > This patch:
> > - bump librtlsdr to d794155ba65796a76cd0a436f9709f4601509320 (2020/03/18)
> > - adapt 0001-disable_shared_library_target_in_build.patch
> >   (http://lists.osmocom.org/pipermail/osmocom-sdr/2020-May/002075.html)
> > - add option to enable/disable zerocopy buffer on non arm platform
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/usb/core?h=v5.8-rc3&id=a0e710a7def471b8eb779ff551fc27701da49599
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > ---
> > Changes v1 -> v2:
> > - update BR2_PACKAGE_LIBRTLSDR_ZEROCOPY option. Now it's enabled by default.
> > - Message updated to inform about potential crash.
> > ---
> >  ...sable_shared_library_target_in_build.patch | 94 ++++++++++++-------
> >  package/librtlsdr/Config.in                   |  8 ++
> >  package/librtlsdr/librtlsdr.hash              |  2 +-
> >  package/librtlsdr/librtlsdr.mk                |  8 +-
> >  4 files changed, 75 insertions(+), 37 deletions(-)  
> 
> This is causing some build breakage:
> 
>  - on librtlsdr itself:
> 
>    http://autobuild.buildroot.net/?reason=librtlsdr-d794155ba65796a76cd0a436f9709f4601509320
> 
>  - on dump1090:
> 
>    http://autobuild.buildroot.net/?reason=dump1090-bff92c4ad772a0a8d433f788d39dae97e00e4dbe
> 
>    for this one, I have verified: if I revert the librtlsdr bump,
>    dump1090 builds fine again.
> 
> Could you have a look ?
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
