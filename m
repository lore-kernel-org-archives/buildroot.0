From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 22:01:13 +0100
Subject: [Buildroot] [PATCH 2/2] board/sifive: Update
 hifive_unleashed_defconfig and genimage.cfg
In-Reply-To: <CAEUhbmUa-bsPVaa-j19Hpt10uofqAPuXOZt6VY4sK_DYa+d=PQ@mail.gmail.com>
References: <1610355672-3008-1-git-send-email-bmeng.cn@gmail.com>
 <1610355672-3008-3-git-send-email-bmeng.cn@gmail.com>
 <20210116224214.6f1ce3af@windsurf.home>
 <CAEUhbmUa-bsPVaa-j19Hpt10uofqAPuXOZt6VY4sK_DYa+d=PQ@mail.gmail.com>
Message-ID: <20210123220113.15481f0e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jan 2021 18:28:11 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> > > +     partition rootfs {
> > > +             image = "rootfs.ext4"
> > > +             partition-type-uuid = 0FC63DAF-8483-4772-8E79-3D69D8477DE4
> > > +             bootable = true
> > > +     }
> > > +}  
> >
> > This looks strange. You really use a GPT partition table on SPI flash,
> > and use an ext4 filesystem on a SPI flash ?
> >  
> 
> When booting from SPI flash, the GPT partition is required by the ZSBL
> on the board to load U-Boot SPL images. The kernel still uses ext4 on
> the SD card as the rootfs. The SPI flash is just the backup for the
> rootfs.

Then why does your SPI flash image contains a root filesystem partition ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
