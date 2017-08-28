From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Aug 2017 09:52:33 +0200
Subject: [Buildroot] minnowboard_max_defconfig,
 changes to build for 32-bit, fails in the end when installing grub
In-Reply-To: <CAEUhbmXdy31cqK4tMZsW6ghbS0R78wxJGnaFyfHU8QZkQGyHLg@mail.gmail.com>
References: <CAEUhbmW6BXHrudGz5LB4=xQYf3-3noyoUzDuryFv39_VUoP_cw@mail.gmail.com>
 <20170828090545.61959c3c@windsurf>
 <CAEUhbmXdy31cqK4tMZsW6ghbS0R78wxJGnaFyfHU8QZkQGyHLg@mail.gmail.com>
Message-ID: <20170828095233.398ead1c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Aug 2017 15:47:57 +0800, Bin Meng wrote:

> Thanks for the hints. Since I changed "Target Architecture" to i386 in
> menuconfig, I see the grub2 platform has also changed to "i386-pc"
> automatically, but the built modules
> (BR2_TARGET_GRUB2_BUILTIN_MODULES) remains unchanged, and that
> explains the build error. Is this a limitation of Kconfig that it
> cannot switch BR2_TARGET_GRUB2_BUILTIN_MODULES automatically?

Yes.

> I did further testing by switching "Target Architecture" back to
> x86-64, and I saw grub2 platform did not change to the EFI stuff and
> remained as "i386-pc".

Yes, welcome to Kconfig :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
