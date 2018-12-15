From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 15 Dec 2018 03:47:39 -0700
Subject: [Buildroot] [PATCH v2 1/1] boot/systemd-boot: new package
In-Reply-To: <87imzvax4i.fsf@dell.be.48ers.dk>
References: <1544787764-4537-1-git-send-email-james.hilliard1@gmail.com>
 <20181215085855.GA2625@scaer>
 <CADvTj4os44jtzrL=1uzQ83=xry2BJnJjKMPU-QgJaXi-tVNBoA@mail.gmail.com>
 <20181215102745.GB2625@scaer> <87imzvax4i.fsf@dell.be.48ers.dk>
Message-ID: <CADvTj4oK1cpgdVA4NHKndhGES1Aow-nkSt-wQgu7=moVJVk1YQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 15, 2018 at 3:43 AM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>
> Hi,
>
>  > Also, I wonder if it ever makes sense to provide systemd-boot to
>  > non-systemd init systems to begin with.
>
> I agree with everything Yann wrote.
>
> One feature of systemd-boot that some people (E.G. me) might find
> interesting even if they do not use systemd as init system is the fact
> that it comes with an EFI stub loader that allows you to combine Linux
> kernel, hardcoded command line and initramfs into a single (potentially
> signed) EFI PE image with objcopy:
Yeah, could be a useful option.
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
Yeah, maybe there should be a config option for that as well, I'm just
using the kernel compile time options.
>
> --
> Bye, Peter Korsgaard
