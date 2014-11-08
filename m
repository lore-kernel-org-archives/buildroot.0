From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 08 Nov 2014 22:53:04 +0100
Subject: [Buildroot] [PATCH] linux: add option to create kernel tarball
In-Reply-To: <CAGm1_ktmu5_Bre0hVvezeJAz+v9akQhYuyouLtPdyw1dyWx-LQ@mail.gmail.com>
 (Yegor Yefremov's message of "Sat, 8 Nov 2014 19:24:48 +0100")
References: <1415464367-32108-1-git-send-email-yegorslists@googlemail.com>
 <20141108163942.GA3481@free.fr>
 <20141108184303.1607bcb6@free-electrons.com>
 <CAGm1_ktmu5_Bre0hVvezeJAz+v9akQhYuyouLtPdyw1dyWx-LQ@mail.gmail.com>
Message-ID: <87a941s6kf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

Hi,

 >> Well, the kernel has this "tar-pkg" target that other packages
 >> typically don't have. However, I'm curious to know what is the use case
 >> for "make tar-pkg" in the kernel in the context of Buildroot.
 >> 
 >> Yegor?

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

That imho sounds like a quite special setup and something that could
easily be implemented in a custom post-buid / post-image script.

So I prefer to NOT add this patch.

-- 
Bye, Peter Korsgaard
