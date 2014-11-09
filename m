From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Nov 2014 10:48:39 +0100
Subject: [Buildroot] [PATCH] linux: add option to create kernel tarball
In-Reply-To: <CAGm1_ktmu5_Bre0hVvezeJAz+v9akQhYuyouLtPdyw1dyWx-LQ@mail.gmail.com>
References: <1415464367-32108-1-git-send-email-yegorslists@googlemail.com>
 <20141108163942.GA3481@free.fr>
 <20141108184303.1607bcb6@free-electrons.com>
 <CAGm1_ktmu5_Bre0hVvezeJAz+v9akQhYuyouLtPdyw1dyWx-LQ@mail.gmail.com>
Message-ID: <20141109104839.0e819548@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,

On Sat, 8 Nov 2014 19:24:48 +0100, Yegor Yefremov wrote:

> Image, you have a system/rootfs, that you've made via BR or it is
> Debian etc. Now you just want to update the kernel and modules. Kernel
> is simple, as BR compiles and copies it to output/images folder. But
> to install kernel modules you first need to invoke one of the make
> *-pkg commands, to do this you need to first export ARCH,
> CROSS_COMPILE etc. First then you can copy resulting image to target
> device and via "tar xf linux-*.tar -C /" install new kernel modules.
> Am I missing something and such option already exists in BR? The only
> one I see would be to tar output/target/lib/modules. But it still need
> to be made manually. I wanted to have an option to have both kernel
> image and modules ready for installation in output/images.

This really seems like you're looking for a build system that produces
binary packages. With your patch, you're doing something for the kernel
specifically, but what if someone has the same need for some other
library or application built by Buildroot?

So like Peter, I don't think this is something we want to merge in
Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
