From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 19 Jun 2020 15:59:29 +0200
Subject: [Buildroot] [PATCH 1/3] package/freescale-imx/firmware-imx:
 install sdma firmware for i.MX8M{, M, N}
In-Reply-To: <6b4eda2b-4095-0c6d-fd6f-b5e0ca483603@armadeus.com>
References: <20200615130633.19909-1-sebastien.szymanski@armadeus.com>
 <CAOMZO5ABSEJvLkBJGNUtoSgZoBCEZAqkGqLv7wVuffE57zJq+Q@mail.gmail.com>
 <d6c168ae-abe9-26ba-f8f8-d62687ff2592@armadeus.com>
 <20200619132043.GA525498@p1g2>
 <6b4eda2b-4095-0c6d-fd6f-b5e0ca483603@armadeus.com>
Message-ID: <20200619135929.GA529674@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sebastien,

On Fri, Jun 19, 2020 at 03:43:44PM +0200, S?bastien Szymanski wrote:
> Hi Gary,
> 
> On 6/19/20 3:20 PM, Gary Bisson wrote:
> > Hi Sebastien,
> > 
> > On Mon, Jun 15, 2020 at 04:07:42PM +0200, S?bastien Szymanski wrote:
> >> Hi Fabio,
> >>
> >> On 6/15/20 3:49 PM, Fabio Estevam wrote:
> >>> Hi S?bastien,
> >>>
> >>> On Mon, Jun 15, 2020 at 10:44 AM S?bastien Szymanski
> >>> <sebastien.szymanski@armadeus.com> wrote:
> >>>
> >>>> -FIRMWARE_IMX_BLOBS = sdma vpu
> >>>> +FIRMWARE_IMX_BLOBS = sdma epdc
> >>>
> >>> The commit log does not mention about removing the VPU firmware and
> >>> adding the EPDC one.
> >>>
> >>> What is the reason for not installing the VPU firmware?
> >>>
> >>
> >> I use the FIRMWARE_IMX_BLOBS to list the firmwares that go into
> >> /lib/firmware/imx and also for patch 2.
> >> The VPU firmwares still get installed in
> >> FIRMWARE_IMX_INSTALL_TARGET_CMDS. I have added a cp command for that.
> > 
> > Yes, but now you are installing all VPU + epdc firmware files for all
> > platforms which is unnecessary.
> 
> Yes, like it was done before my changes on all i.MX platforms but i.MX8.
> SDMA firmware files are also installed for all platforms.

True, but that doesn't make it the right thing to do for all platforms.

Your title says "add SDMA firmware for i.MX8M" but in the end it also
installs VPU and EPDC files.

Firmware installed for i.MX8M and i.MX8X families was pretty lean up
until now, let's not add unnecessary blobs if we can avoid it.

And if we can improve the way the package worked for older i.MX2/5/6/7
series as well it's even better ;)

Regards,
Gary
