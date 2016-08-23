From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 23 Aug 2016 07:03:47 +0300
Subject: [Buildroot] [PATCH 1/1] added comments on how to install the
 system
In-Reply-To: <CANCHnQrg6u4czJBeQub+qFTD5PwWxry-nxgGDDEM7SE-s9jLBQ@mail.gmail.com>
References: <1471774436-18803-1-git-send-email-guillaume.bressaix@gmail.com>
 <20160821124604.vtzsuyrz5tgnapve@tarshish>
 <CANCHnQrg6u4czJBeQub+qFTD5PwWxry-nxgGDDEM7SE-s9jLBQ@mail.gmail.com>
Message-ID: <20160823040346.humpc4ekgyo3pi5r@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeroen,

On Mon, Aug 22, 2016 at 11:57:00AM +0200, Jeroen Roovers wrote:
> On 21 August 2016 at 14:46, Baruch Siach <baruch@tkos.co.il> wrote:
> > > +sudo cp output/images/{MLO,u-boot.img,zImage} /dev/sdb1
> > > +sudo cp output/images/am335x-bone.dtb /dev/sdb1 -- for the beaglebone
> > > +sudo cp output/images/am335x-boneblack.dtb /dev/sdb1 -- for the beaglebone black
> >
> > Have you tested these commands? They overwrite the raw /dev/sdb1 block device,
> > instead of copying files into the FAT filesystem.
> 
> Indeed, that is not the way. It's more complicated than that. We would
> need to create a separate FAT16 image besides the rootfs image,
> loop-mount the former and then copy those files to the mounted image
> file.
> 
> An additional useful step to describe would be to copy the rootfs to
> the FAT16 image as well, which is needed if you want to forego the
> second partition and use the rootfs as an initramfs.

Direct sdcard.img write to SD card obviates all these details. We generally 
want these readme.txt files to provide instructions for the shortest path to a 
minimal working setup.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
