From: apin prastya <apin.klas@gmail.com>
Date: Mon, 2 Oct 2017 22:18:53 +0700
Subject: [Buildroot] Orange Pi HDMI to VGA output
In-Reply-To: <955fd355-3b00-dde9-d629-f55a39a302d0@ecagroup.com>
References: <CAOJD9H+8eSuY_Rm+E-yzCOTSe2KjohLz28fcvH1tv6RDLHefkg@mail.gmail.com>
 <878thum8u8.fsf@dell.be.48ers.dk>
 <20170905094103.GA5082@airbook.vandijck-laurijssen.be>
 <874lshmo2z.fsf@dell.be.48ers.dk>
 <955fd355-3b00-dde9-d629-f55a39a302d0@ecagroup.com>
Message-ID: <CAOJD9HKd6+15MHF+yQ8NRjxjuLTUff=puRJnbZtS5z_1B28Krg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was able to make an output to HDMI and using HDMI to VGA converter.
Using this kernel : https://github.com/megous/linux/tree/orange-pi-4.13

But the problem comes that the fb is outside the monitor (way too left).
And here the modes :
# cat /sys/class/graphics/fb0/modes
U:1920x1080p-0

For the height of the monitor is correct, but the width is wrong.
Already set screen resolution : disp.screen0_output_mode=EDID:1280x1024p60.
But not working.

On Wed, Sep 6, 2017 at 11:06 PM, Julien CORJON <corjon.j@ecagroup.com>
wrote:

> Hi,
>
> Le 05/09/2017 ? 12:33, Peter Korsgaard a ?crit :
> >>>>>> "Kurt" == Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> writes:
> >
> > Hi,
> >
> >   > My experience with HDMI to VGA convertors, on a beaglebone:
> >
> >   > an "HDMI to VGA" convertor needs power.
> >   > An HDMI port provides, per spec, up to 10mA or so.
> >   > So, if you're using such HDMI to VGA convertor:
> >   > The beaglebone has a polyfuse to enforce this current limit.
> >   > Then the HDMI to VGA will never actually power up and fail to
> >   > emit VGA signal.
> >   > I once managed to succeed here with bypassing the polyfuse with a
> wire.
> >
> > Alternatively, the HDMI-to-VGA adapters I've seen typically can be
> > powered through USB (sometimes not exposed on the outside though).
> >
>
> I'm also trying to make a HDMI to VGA converter on an i.MX6 and just
> discovered that most of them only support CEA resolutions [1]...
> (720p,1080p, etc.)
>
> This can be the issue with your 1280x720 resolution.
>
> I would recommend to take a look in /sys/class/graphics/fbX/modes to see
> the resolution negociated with your dongle.
>
> Kind regards,
>
> Julien
>
> [1] https://en.wikipedia.org/wiki/Extended_Display_Identification_Data




-- 
Apin,
Indonesia
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171002/30e070f1/attachment.html>
