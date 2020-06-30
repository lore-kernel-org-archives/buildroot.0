From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 30 Jun 2020 14:54:57 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/freescale-imx/firmware-imx:
 Add option for all i.MX FW needs
In-Reply-To: <20200630142646.10e1c2ad@windsurf>
References: <1593419148-26821-1-git-send-email-stephane.viau@oss.nxp.com>
 <1593419148-26821-3-git-send-email-stephane.viau@oss.nxp.com>
 <20200630115341.GA791671@p1g2> <20200630140829.14425eac@windsurf>
 <20200630121811.GA1094671@p1g2> <20200630142646.10e1c2ad@windsurf>
Message-ID: <20200630125457.GA1211257@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Jun 30, 2020 at 02:26:46PM +0200, Thomas Petazzoni wrote:
> On Tue, 30 Jun 2020 14:18:11 +0200
> Gary Bisson <gary.bisson@boundarydevices.com> wrote:
> 
> > > Could you list which blobs are relevant for each platform, so we get a
> > > sense of what is needed and what is not ?  
> > 
> > Well listing the files from the package gives a pretty good overview:
> > $ find firmware/vpu/vpu*
> > firmware/vpu/vpu_fw_imx27_TO1.bin
> > firmware/vpu/vpu_fw_imx27_TO2.bin
> > firmware/vpu/vpu_fw_imx51.bin
> > firmware/vpu/vpu_fw_imx53.bin
> > firmware/vpu/vpu_fw_imx6d.bin
> > firmware/vpu/vpu_fw_imx6q.bin
> > firmware/vpu/vpu_fw_imx8_dec.bin
> > firmware/vpu/vpu_fw_imx8_enc.bin
> > 
> > Also, with this approach we eliminate the possible errors from selecting
> > the wrong package for your platforms.
> > 
> > I don't know many customers that actually know the VPU IP is CODA for
> > i.MX6 or Malone for i.MX8.
> 
> I see. Indeed, it makes sense to only copy the files needed for the
> particular platform.
> 
> We had another comment on this series: what if I need some i.MX
> firmware (such as the SDMA ones) but not others (such as the VPU ones).
> Do we want explicit options ? Or do we leave that sort of clean up to a
> post-build script ?

We could add some values to the bool part of each option for them to
appear in the menu for people to select/unselect.
Maybe even turn the FIRMWARE_IMX into a menuconfig.
I guess it would require to change imx-vpu though, as it currently
select FIRMWARE_IMX, it would need to select the VPU option.

Regards,
Gary
