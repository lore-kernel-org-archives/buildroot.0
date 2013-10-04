From: Jason Kridner <jkridner@beagleboard.org>
Date: Fri, 4 Oct 2013 11:41:04 -0400
Subject: [Buildroot] [PATCHv2] beaglebone: add BeagleBone Black support
In-Reply-To: <87fvshjbnd.fsf@dell.be.48ers.dk>
References: <1380220826-17732-1-git-send-email-jkridner@beagleboard.org>
 <1380337717-19697-1-git-send-email-jkridner@beagleboard.org>
 <1380522195.4232.2.camel@viko> <87fvshjbnd.fsf@dell.be.48ers.dk>
Message-ID: <CA+T6QP=KvL5Atvb6naGqsxJLMvku_=XaWONmMZZHKrt36wYELg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 4, 2013 at 11:31 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:
>
>  Fatih> On Sat, 2013-09-28 at 03:08 +0000, Jason Kridner wrote:
>  >> From: Jason Kridner <jdk@ti.com>
>  >>
>  >> * Configure as initramfs
>  >> * Update BeagleBone to 3.8.13-beagleboard kernel
>  >> * Update to u-boot 2013.07
>  >> * Add BeagleBone Black device tree
>  >>
>  >> Changes since v1 (http://lists.busybox.net/pipermail/buildroot/2013-September/079046.html):
>  >> * Added BeagleBone Black to single config for BeagleBone and BeagleBone Black,
>  >> rather than having two configs
>  >> * Used 'make ARCH=arm savedefconfig' to create Linux config file
>  >> * Dropped setting of DEVTMPFS, since it is default now
>  >> * Switched to u-boot 2013.07 from 2013.04
>  >> * Patched u-boot to work with initramfs by default without uEnv.txt
>  >> * Removed wake-up M3 firmware loading for now, until debugged
>
> I don't seem to have received the original here (probably because of my
> mail problems), but what's the reason for the ext2 -> initramfs changes?

Just enabling rapid testing. This can boot off of a FAT formatted SD
card, over USB, over serial or over Ethernet without passing a
separate ramdisk. The ext2 required a separate download or special
formatting of the card and wasted memory if used as a ramdisk.
Nothing too special here, but it simplifies use as a recovery system,
validation system or bootloader.

I will keep it however you'd like. The important part is the kernel.
>
> --
> Bye, Peter Korsgaard
