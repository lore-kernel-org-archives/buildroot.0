From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Aug 2017 11:07:46 +0200
Subject: [Buildroot] minnowboard_max_defconfig,
 changes to build for 32-bit, fails in the end when installing grub
In-Reply-To: <CAEUhbmWLe-YCD6x_S9SrG2HjKmbnsVqHq0toiQqKNN8FpYZ1=A@mail.gmail.com>
References: <CAEUhbmW6BXHrudGz5LB4=xQYf3-3noyoUzDuryFv39_VUoP_cw@mail.gmail.com>
 <20170828090545.61959c3c@windsurf>
 <CAEUhbmXdy31cqK4tMZsW6ghbS0R78wxJGnaFyfHU8QZkQGyHLg@mail.gmail.com>
 <20170828095233.398ead1c@windsurf>
 <CAEUhbmWLe-YCD6x_S9SrG2HjKmbnsVqHq0toiQqKNN8FpYZ1=A@mail.gmail.com>
Message-ID: <20170828110746.4efbc22c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Aug 2017 16:26:24 +0800, Bin Meng wrote:

> Thanks. But do you know why does Kconfig changes grub2 platform to
> "i386-pc" when I changed "Target Architecture" to i386. It should just
> remain unchanged, no?

Look at the config option dependencies please.

The minnowboard_max_defconfig has:

BR2_TARGET_GRUB2_X86_64_EFI=y

But BR2_TARGET_GRUB2_X86_64_EFI has "depends on BR2_ARCH_IS_64". So
when you switch from x86-64 to i386, this option is no longer
available. Therefore Kconfig reverts back to the first possible choice
between BR2_TARGET_GRUB2_I386_PC and BR2_TARGET_GRUB2_I386_EFI.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
