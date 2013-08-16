From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 16 Aug 2013 21:04:44 +0200
Subject: [Buildroot] [PATCH] targets: move target options to their own
	sub-menu
In-Reply-To: <20130816175906.GA3422@free.fr>
References: <1376598482-9492-1-git-send-email-yann.morin.1998@free.fr>
 <520D5FE6.2090007@mind.be>
 <CAAXf6LV8gfZUmLogOubg5j03d9HJR7-bm+cm+HDG-N6kNAiK_g@mail.gmail.com>
 <201308160839.05082.yann.morin.1998@free.fr>
 <CAAXf6LXZ3vzUfexiNiGZu-c-chMZ0rKOpGs=N9APmTO_Y63wRg@mail.gmail.com>
 <CAAXf6LVX6TR+dPhS_FGHZpf+-_j_XBaCVaQxFY+MFp=O7m+LNA@mail.gmail.com>
 <20130816175906.GA3422@free.fr>
Message-ID: <CAAXf6LUR_9T6optfM95brDSsYabsJMBw2dmmY2q0Qj=5F5csFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 16, 2013 at 7:59 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2013-08-16 12:30 +0200, Thomas De Schampheleire spake thusly:
>>
>> Here is a slightly different viewpoint: some users will never touch
>> the bootloader. However, creating a kernel and rootfs (possibly
>> attached to the kernel) is very common. This can result in the
>> following order:
>>
>> (Target options)
>> Build options
>> Toolchain
>> System configuration
>> Kernel
>> Package selection for the target
>> Filesystem images
>> Bootloaders
>> Host Utilities
>> Legacy config options
>
> Hey! It looks good to me! :-)
> I'll handle this. Thanks!
>

Great!

>> By the way: isn't it more logical to put 'Bootloaders' in singular
>> (Bootloader), since one typically builds only one bootloader, just as
>> one only builds one kernel...
>
> This is two-sided:
>   - either you consider what Buildroot has to offer: one kernel, and
>     multiple bootloaders;
>   - or you consider what the user may want to install on the targe, at
>     most one kernel, and at most one bootloader.
>
> I prefer the first option. If at some point in the future Buildroot gets
> support for alternative kernels (GNU/Hurd, someone? ;-) ), then we'd
> have to s/Kernel/Kernels/.

Ok, agreed.

>
> Consequently, "Package selection for the target" should be a plural
> "Packages selection for target".

'Packages selection' sounds odd to me, I'm not even sure it's proper
English. A 'selection' always refers to a (potential) plural, so I
think 'Package selection' is more correct.

However, why such a long name? Is 'Target packages' not equally clear,
and more in line with the other menu names?

Best regards,
Thomas
