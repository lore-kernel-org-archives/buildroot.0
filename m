From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 24 Aug 2016 17:41:37 +0300
Subject: [Buildroot] Making a Bootable USB Image for x86_64
In-Reply-To: <f3ab074b-d314-7542-636a-fb3eb7d11878@86pixels.com>
References: <f3ab074b-d314-7542-636a-fb3eb7d11878@86pixels.com>
Message-ID: <20160824144137.c3x5q44sgdazqtue@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jimmy,

On Mon, Aug 22, 2016 at 10:11:51PM -0500, Jimmy wrote:
> I know this has been asked a lot, but I have been sifting through the
> archives and Google in order to find the best way to make a bootable USB
> image of my buildroot installation for an x86 based machine. 

I have no experience with grub installation on a USB device. I use extlinux 
(http://www.syslinux.org/wiki/index.php?title=EXTLINUX) for that. You may use 
a minimal extlinux.conf file like

DEFAULT linux
LABEL linux
KERNEL /bzImage
APPEND root=/dev/sdb2

You need to know your rootfs device node in advanced for this to work. 
Otherwise you may use "root=UUID=98f012537-7a7c-2213-819e-a69ddf9abc2b" 
instead, where the UUID comes from the 'blkid' command output.

Hope this helps,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
