From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 8 Nov 2014 19:24:48 +0100
Subject: [Buildroot] [PATCH] linux: add option to create kernel tarball
In-Reply-To: <20141108184303.1607bcb6@free-electrons.com>
References: <1415464367-32108-1-git-send-email-yegorslists@googlemail.com>
 <20141108163942.GA3481@free.fr> <20141108184303.1607bcb6@free-electrons.com>
Message-ID: <CAGm1_ktmu5_Bre0hVvezeJAz+v9akQhYuyouLtPdyw1dyWx-LQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 8, 2014 at 6:43 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Yann, Yegor,
>
> On Sat, 8 Nov 2014 17:39:42 +0100, Yann E. MORIN wrote:
>> Yegor, All,
>>
>> On 2014-11-08 17:32 +0100, Yegor Yefremov spake thusly:
>> > This option will invoke "make tar-pkg" in kernel's build directory
>> > and the resulting linux-*.tar will be copied to images folder.
>>
>> Why would we want that only for the kernel?
>>
>> If we were to add such a command, we would want to have it for all
>> packages, done in a generic way, unless there is a *really* *compelling*
>> reason to have such a linux-specific command.
>
> Well, the kernel has this "tar-pkg" target that other packages
> typically don't have. However, I'm curious to know what is the use case
> for "make tar-pkg" in the kernel in the context of Buildroot.
>
> Yegor?

Image, you have a system/rootfs, that you've made via BR or it is
Debian etc. Now you just want to update the kernel and modules. Kernel
is simple, as BR compiles and copies it to output/images folder. But
to install kernel modules you first need to invoke one of the make
*-pkg commands, to do this you need to first export ARCH,
CROSS_COMPILE etc. First then you can copy resulting image to target
device and via "tar xf linux-*.tar -C /" install new kernel modules.
Am I missing something and such option already exists in BR? The only
one I see would be to tar output/target/lib/modules. But it still need
to be made manually. I wanted to have an option to have both kernel
image and modules ready for installation in output/images.

Yegor
