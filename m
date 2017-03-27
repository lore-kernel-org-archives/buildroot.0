From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Mar 2017 13:24:32 +0200
Subject: [Buildroot] Getting buildroot to put Grub2 in target filesystem
In-Reply-To: <CAHe2UA9foZDDTQe0FHyQdNeCRs3Q6Pw6OzyegkSqMgG_vBuySQ@mail.gmail.com>
References: <CAHe2UA9foZDDTQe0FHyQdNeCRs3Q6Pw6OzyegkSqMgG_vBuySQ@mail.gmail.com>
Message-ID: <20170327132432.56e3f317@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Mar 2017 10:22:02 +0100, Andy Aspell-Clark wrote:
> I am making two x86 buildroot projects. one is used to build a
> bootable CD/USB/VM image (installer). the other build an image to be
> installed from the CD (host rootfs).
> 
> both projects build correctly.
> 
> the boot flow is (tested in qemu):
> 
>   1. CD boots
>   2. initramfs starts
>   3. find hard disk
>   4. partition and format hard disk
>   5. install rootfs image onto hard disk
>   6. install grub onto hard disk
> 
> I have steps 1-5 working.
> 
> for step 6, I have tried to hack the grub2.mk file to install the grub
> files into the target filesystem, but have not been successful.
> 
> has anyone else managed to create an installer disk image from
> buildroot that can install onto a target system using grub2?

If you want grub2 itself on the target filesystem to be able to install
grub2 on the target, then you should have a look at the patch:

  [PATCH 5/5] grub2: allow full install (for installer images)

which was sent a long time ago. I believe it does what you need. See
http://lists.busybox.net/pipermail/buildroot/2016-June/163897.html.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
