From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 28 Aug 2017 16:26:24 +0800
Subject: [Buildroot] minnowboard_max_defconfig,
 changes to build for 32-bit, fails in the end when installing grub
In-Reply-To: <20170828095233.398ead1c@windsurf>
References: <CAEUhbmW6BXHrudGz5LB4=xQYf3-3noyoUzDuryFv39_VUoP_cw@mail.gmail.com>
 <20170828090545.61959c3c@windsurf>
 <CAEUhbmXdy31cqK4tMZsW6ghbS0R78wxJGnaFyfHU8QZkQGyHLg@mail.gmail.com>
 <20170828095233.398ead1c@windsurf>
Message-ID: <CAEUhbmWLe-YCD6x_S9SrG2HjKmbnsVqHq0toiQqKNN8FpYZ1=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Aug 28, 2017 at 3:52 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 28 Aug 2017 15:47:57 +0800, Bin Meng wrote:
>
>> Thanks for the hints. Since I changed "Target Architecture" to i386 in
>> menuconfig, I see the grub2 platform has also changed to "i386-pc"
>> automatically, but the built modules
>> (BR2_TARGET_GRUB2_BUILTIN_MODULES) remains unchanged, and that
>> explains the build error. Is this a limitation of Kconfig that it
>> cannot switch BR2_TARGET_GRUB2_BUILTIN_MODULES automatically?
>
> Yes.
>
>> I did further testing by switching "Target Architecture" back to
>> x86-64, and I saw grub2 platform did not change to the EFI stuff and
>> remained as "i386-pc".
>
> Yes, welcome to Kconfig :)
>

Thanks. But do you know why does Kconfig changes grub2 platform to
"i386-pc" when I changed "Target Architecture" to i386. It should just
remain unchanged, no?

Regards,
Bin
