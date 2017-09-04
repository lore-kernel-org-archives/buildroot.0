From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 4 Sep 2017 23:48:45 +0300
Subject: [Buildroot] buildroot - making bootable USB for CORE I7 desktop
In-Reply-To: <CAFG2245+Fzmm8KM_iCvNDX_2WRoW0ONmTxdNJ9WUSQTbOZCdpw@mail.gmail.com>
References: <CAFG2245+Fzmm8KM_iCvNDX_2WRoW0ONmTxdNJ9WUSQTbOZCdpw@mail.gmail.com>
Message-ID: <20170904204845.koo6ha4fgdbretvf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yair,

On Mon, Sep 04, 2017 at 10:50:18PM +0300, ???? ??????? wrote:
> My name is Yair Havoynik, I am a software engineer and in the last 6 months
> I started
> Learn Linux.
> My goal is to generate custom version of Linux from scratch for embedded
> systems.
> My demo target is Dell 7040 which include Intel Core i7 processor.
> The buildroot documentation are very good and I succeeded
> to generate the following files with buildroot:
>  1. rootfs.tar
>  2. rootfs.romfs
>  3. rootfs.iso9660
>  4. bzImage
>  5. grub-eltorito.img
>  6. grub.img
> 
> I want to create bootable USB/Hard disk with the files I mentioned.
> What is the exact procedure I need to do?

See the instructions at board/pc/readme.txt. The mentioned 'pendrive' includes 
USB storage devices. You might need to tweak the kernel config to boot from 
real disks. Quoting commit 4e4545246f466 log message:
    
    In principle these base defconfigs should work just fine for other
    storage media != pendrive like sata or ssd disk, however driver support
    isn't there quite yet, and pendrive is mostly supported by usb storage
    plus the usual usb host controller drivers.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
