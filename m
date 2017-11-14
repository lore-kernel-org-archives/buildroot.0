From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 14 Nov 2017 14:57:29 +0100
Subject: [Buildroot] xf86-video-armsoc
In-Reply-To: <5003d938-9aff-9c9e-f49e-9f8639edba66@micronovasrl.com>
References: <3bdc214f-ee7b-85c1-5794-85b1c28ef9a9@micronovasrl.com>
 <20171114110844.ut5udekj5wibzbim@flea.lan>
 <5003d938-9aff-9c9e-f49e-9f8639edba66@micronovasrl.com>
Message-ID: <20171114135728.mb6h525qrgoe3u5t@flea.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 14, 2017 at 12:11:58PM +0100, Giulio Benetti wrote:
> Hi,
> 
> Il 14/11/2017 12:08, Maxime Ripard ha scritto:
> > Hi,
> > 
> > On Mon, Nov 13, 2017 at 08:00:40PM +0100, Giulio Benetti wrote:
> > > to get r6p2 mali openGL working with X11 DMA_BUF,
> > > do I need xf86-video-armsoc?
> > 
> > Yes, from here:
> > https://github.com/mripard/xf86-video-armsoc
> > 
> > You'll also need that patch:
> > https://github.com/NextThingCo/linux/commit/e390023d73a8dcbea85e5156e3930e37ca431472
> > 
> > But I'm not sure this is wise to add support for it in buildroot. That
> > ioctl will never be merged in the upstream kernel.
> 
> So what could be the right way to keep up to date with upstream
> kernel?

There's no proper way available at the moment. One could try using ION
to achieve the same results, but I'm not sure whether that would be
accepted upstream either.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 801 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171114/6ec22037/attachment.asc>
