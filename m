From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 2 Dec 2010 17:31:34 +0100
Subject: [Buildroot] Help - Buildroot-2010.11 Don't know what changed
In-Reply-To: <AANLkTimk=w-b3jMs58sFzLG5SVEkybEsQmTVpyuS-P-O@mail.gmail.com>
References: <AANLkTimk=w-b3jMs58sFzLG5SVEkybEsQmTVpyuS-P-O@mail.gmail.com>
Message-ID: <AANLkTim3ZhOhwNFj3Ur+AtC8e9EWhOW8=r5OkqXax8EJ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 2, 2010 at 5:27 PM, Chris Kerios <ckerios@gmail.com> wrote:
> Hi,
> I am working with the 2010.11 release on a PC-104 Geode LX w/Compact
> Flash card. Fedora 14.
>
> I built a minimal system with all the defaults, no external toolchain:
>
> Kernel = 2.6.36.1
> uClibc = .9.31.x with .9.31.x.config file
> Busybox = 1.17.x with 1.17.x.config file
> gcc = 4.3.x
> bootloader selected = grub
>
> I have not added any files/applications to be built, so all that is
> being built is the toolchain, kernel, grub and busybox. ?Everything
> downloads and builds fine!
>
> The problem is when I copy to flash and boot the system it comes up as
> read-only! ?I copy things to the flash as root and preserve all
> permissions, etc. ?I've looked at the mailing list and long ago the
> threads said to have the entry in inittab remount the filesystem as RW
> and it should correct the problem. ?The issue is my default inittab
> file has this entry in it so I don't understand why I am seeing this.
>
> If I execute the command manually from the command line after logging
> in, it mounts the filesystem back as RW just fine. ?Also, if I include
> a "rw" on my kernel line in grub.conf the filesystem comes in as RW.
>
> Is this a busybox issue? ?I am using all buildroot defaults. ?Any
> thoughts or ideas of things I can check?
>

I'm not sure, but it sounds like a kernel default behavior. On my
2.6.23 is boot nfs readonly unless I add "rw" to the kernel command
line.
Haven't you changed the kernel config file ?

Regards,

--
Lionel Landwerlin
