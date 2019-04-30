From: ravi chandran <ravigct27@gmail.com>
Date: Tue, 30 Apr 2019 17:04:02 +0530
Subject: [Buildroot] Reg: Valgrind support for Aarch64 in buildroot
 2019.02.02
In-Reply-To: <20190430085653.0bd4914e@windsurf>
References: <CAAMHf5EaMVDS23JXv-4_yWByHnn=0xT+iOKdVOhan5Ah4EvbLw@mail.gmail.com>
 <20190430085653.0bd4914e@windsurf>
Message-ID: <CAAMHf5EEeW7j=tvj8hWanzdoKT0mae=85HF_D+OBFVHcF4oYjQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
               Thanks for your reply.
I am running a aarch64 platform with userspace  in 32 bit mode, so probably
the reason for valgrind not shown in that list is the BR2_arm was not
exist  in config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS .

 After added the below line, i am able to choose valgrind support as part
of my target package.  But i got below build error

checking for a supported CPU... no (arm)
configure: error: Unsupported host architecture. Sorry

valgrind-3.14.0 is what the version configured to use in valgrind.mk. I am
not sure if this particular version will support arm32.

config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
        bool
        default y if BR2_aarch64
       + default y if BR2_arm
        default y if BR2_ARM_CPU_ARMV7A
        # MIPS32 R6 is unsupported
        default y if BR2_mips && !BR2_mips_32r6
        default y if BR2_mipsel && !BR2_mips_32r6

Thanks,
Ravi

On Tue, Apr 30, 2019 at 12:26 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Tue, 30 Apr 2019 11:45:17 +0530
> ravi chandran <ravigct27@gmail.com> wrote:
>
> >    Is valgrind support for aarch64 platform is available in buildroot
> > version 2019.02.02?
>
> config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
>         bool
>         default y if BR2_aarch64
>
> So, yes, Valgrind can be enabled on AArch64 in Buildroot 2019.02.
>
> Why do you ask this question ? Did you try and encountered an issue ?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190430/b18d013c/attachment.html>
