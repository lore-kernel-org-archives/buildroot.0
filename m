From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 17 Jan 2021 18:28:11 +0800
Subject: [Buildroot] [PATCH 2/2] board/sifive: Update
 hifive_unleashed_defconfig and genimage.cfg
In-Reply-To: <20210116224214.6f1ce3af@windsurf.home>
References: <1610355672-3008-1-git-send-email-bmeng.cn@gmail.com>
 <1610355672-3008-3-git-send-email-bmeng.cn@gmail.com>
 <20210116224214.6f1ce3af@windsurf.home>
Message-ID: <CAEUhbmUa-bsPVaa-j19Hpt10uofqAPuXOZt6VY4sK_DYa+d=PQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jan 17, 2021 at 5:42 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Bin,
>
> On Mon, 11 Jan 2021 17:01:12 +0800
> Bin Meng <bmeng.cn@gmail.com> wrote:
>
> > diff --git a/board/sifive/hifive-unleashed/genimage_spi-nor.cfg b/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
> > new file mode 100644
> > index 0000000..7f90997
> > --- /dev/null
> > +++ b/board/sifive/hifive-unleashed/genimage_spi-nor.cfg
> > @@ -0,0 +1,25 @@
> > +image spi-nor.img {
> > +     size = 32M
> > +
> > +     hdimage {
> > +             gpt = true
> > +     }
> > +
> > +     partition u-boot-spl {
> > +             image = "u-boot-spl.bin"
> > +             offset = 20K
> > +             partition-type-uuid = 5B193300-FC78-40CD-8002-E86C45580B47
> > +     }
> > +
> > +     partition u-boot {
> > +             image = "u-boot.itb"
> > +             offset = 1044K
> > +             partition-type-uuid = 2E54B353-1271-4842-806F-E436D6AF6985
> > +     }
> > +
> > +     partition rootfs {
> > +             image = "rootfs.ext4"
> > +             partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
> > +             bootable = true
> > +     }
> > +}
>
> This looks strange. You really use a GPT partition table on SPI flash,
> and use an ext4 filesystem on a SPI flash ?
>

When booting from SPI flash, the GPT partition is required by the ZSBL
on the board to load U-Boot SPL images. The kernel still uses ext4 on
the SD card as the rootfs. The SPI flash is just the backup for the
rootfs.

Regards,
Bin
