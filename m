From: Jimmy at 86Pixels <hello@86pixels.com>
Date: Thu, 25 Aug 2016 05:25:30 -0700
Subject: [Buildroot] Making a Bootable USB Image for x86_64
In-Reply-To: <1569774.H6tdLElCHb@sagittea>
References: <f3ab074b-d314-7542-636a-fb3eb7d11878@86pixels.com>
 <1569774.H6tdLElCHb@sagittea>
Message-ID: <1472127930.1600045.705799329.373312DE@webmail.messagingengine.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 24, 2016, at 08:35 AM, J?r?me Pouiller wrote:
> Hello Jimmy,
> 
> On Monday 22 August 2016 22:11:51 Jimmy wrote:
> > Greetings all,
> > 
> > I know this has been asked a lot, but I have been sifting through the
> > archives and Google in order to find the best way to make a bootable
> > USB image of my buildroot installation for an x86 based machine. I
> > have done the following:
> > 
> > 1. Generated a tar image of the root filesystem via the configuration
> > menu 2. Selected grub2 from bootloaders with the i386-pc platform 3.
> > Created a 1Gb EXT2FS partition with 1mb of space preceding on the USB
> > device itself
> > 4. Extracted the rootfs tar to the USB device on the ext2 partition
> > 5. Ran the following from the main buildroot directory (as root):
> > ./output/host/usr/sbin/grub-bios-setup -b
> > ./output/host/usr/lib/grub/i386-pc/boot.img -c
> > ./output/images/grub.img -d . /dev/sdb
> > 
> > The command immediately exits with a "segmentation fault (Core
> > dumped)".
> hmm... it looks like a snaky x86/x86_64 cross-compilation problem.
> 
> Help of grub2 (boot/grub2/Config.in) package provide an alternative way 
> to create bootable disk images with grub2. It use genimage instead of 
> grub-bios-setup. Let me know if it help.
> 
> BR,
> 
> -- 
> J?r?me Pouiller, Sysmic
> Embedded Linux specialist
> http://www.sysmic.fr
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Thank you both for the advice! I eventually solved this problem by
pulling the latest master branch to include Erico Nunes' kernel EFI
patch which solved the issue!

Thank you all so much again.
Jimmy
