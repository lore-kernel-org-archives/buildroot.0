From: Andy Aspell-Clark <andyaspellclark@gmail.com>
Date: Mon, 27 Mar 2017 10:22:02 +0100
Subject: [Buildroot] Getting buildroot to put Grub2 in target filesystem
Message-ID: <CAHe2UA9foZDDTQe0FHyQdNeCRs3Q6Pw6OzyegkSqMgG_vBuySQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am making two x86 buildroot projects. one is used to build a
bootable CD/USB/VM image (installer). the other build an image to be
installed from the CD (host rootfs).

both projects build correctly.

the boot flow is (tested in qemu):

  1. CD boots
  2. initramfs starts
  3. find hard disk
  4. partition and format hard disk
  5. install rootfs image onto hard disk
  6. install grub onto hard disk

I have steps 1-5 working.

for step 6, I have tried to hack the grub2.mk file to install the grub
files into the target filesystem, but have not been successful.

has anyone else managed to create an installer disk image from
buildroot that can install onto a target system using grub2?

-- 


Buddha : "Do not overrate what you have received, nor envy others. He
who envies others does not obtain peace of mind."
