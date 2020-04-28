From: Xavier Roumegue <xroumegue@gmail.com>
Date: Tue, 28 Apr 2020 22:28:37 +0200
Subject: [Buildroot] [PATCH 1/3] board/freescale/imx: Add helper to
 generate fw binary
In-Reply-To: <CAOMZO5Ad77WMwsf2cAKUBj2HT+EH1p1_UsYg9Nb-ZTsO54oKPw@mail.gmail.com>
References: <20200427211638.6047-1-xroumegue@gmail.com>
 <CAOMZO5Ad77WMwsf2cAKUBj2HT+EH1p1_UsYg9Nb-ZTsO54oKPw@mail.gmail.com>
Message-ID: <20200428202837.GA14601@frodon.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 27, 2020 at 06:44:09PM -0300, Fabio Estevam wrote:
> Hi Xavier,
>
> On Mon, Apr 27, 2020 at 6:16 PM Xavier Roumegue <xroumegue@gmail.com> wrote:
> >
> > This script aims to create an imx compatible boot image embedding
> > mainline components, using only upstream uboot mkimage tool, avoiding
> > dependencies on proprietary imx mkimage.
> >
> > Mainline u-boot can generate a bootable image, but SPL soc proprietary
> > firmware dependencies have to be copied on uboot root dir.
> >
> > This script prevents additional buildroot uboot recipe hacking to handle
> > custom SoC uboot build process.
> >
> > The script actions summary is:
> > - Append DDR4 firmware to uboot spl binary
> > - Generate imx mkimage configuration file, extracting entry points from
> >   relevant elf files on the fly.
> > - Generate imx boot image using uboot upstream mkimage tool
> >
> > Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
>
> This is cool :-) I like it!

Hi Fabio
Glad to read you like the idea !
>
> Do you think we can also expand this later to support booting i.MX8QXP
> and i.MX8QM too?
Yes, that's exactly the intention here, supporting all imx8 platforms, relying
on uboot mkimage only.

Xavier
