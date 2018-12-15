From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Dec 2018 11:49:31 +0100
Subject: [Buildroot] [PATCH v2 1/1] boot/systemd-boot: new package
In-Reply-To: <87imzvax4i.fsf@dell.be.48ers.dk>
References: <1544787764-4537-1-git-send-email-james.hilliard1@gmail.com>
 <20181215085855.GA2625@scaer>
 <CADvTj4os44jtzrL=1uzQ83=xry2BJnJjKMPU-QgJaXi-tVNBoA@mail.gmail.com>
 <20181215102745.GB2625@scaer> <87imzvax4i.fsf@dell.be.48ers.dk>
Message-ID: <20181215104931.GD2625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-12-15 11:43 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Also, I wonder if it ever makes sense to provide systemd-boot to
>  > non-systemd init systems to begin with.
> One feature of systemd-boot that some people (E.G. me) might find
> interesting even if they do not use systemd as init system is the fact
> that it comes with an EFI stub loader that allows you to combine Linux
> kernel, hardcoded command line and initramfs into a single (potentially
> signed) EFI PE image with objcopy:
> 
> objcopy \
>   --add-section .cmdline=cmdline --change-section-vma .osrel=0x20000 \
>   --add-section .linux=linux --change-section-vma .linux=0x30000 \
>   --add-section .initrd=initrd --change-section-vma .initrd=0x3000000 \
>   stubx64.efi linux.efi
> 
> For some use cases (E.G. if these are not built by the same defconfigs
> or for A/B boot with different Linux command line) this late binding may
> be preferable to just building a Linux kernel with compile time
> hardcoded command line and embedded initramfs.

Ok, then it makes sense we can have systemd-boot without systemd init.

Let's try to find a solution for that, then.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
