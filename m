From: Assaf Inbal <shmuelzon@gmail.com>
Date: Thu, 3 May 2012 23:08:03 +0300
Subject: [Buildroot] Building For Host as Target
In-Reply-To: <20120503180857.GA2763@tarshish>
References: <CADwac6DA5MDVkfZDmAO-s2+rPsebpefJ-paTWLzkk0hC_qAOZg@mail.gmail.com>
 <20120503180857.GA2763@tarshish>
Message-ID: <-6765526173700250339@unknownmsgid>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Baruch,

I've already thought of this solution, but there are a couple of problems
by doing so. First, I only use buildroot's architecture for downloading,
patching, compiling and wrapping. I've removed everything else so I don't
prepare a full file system and so can't chroot into it. The other issue is
that one of my packages controls a USB device so that might also cause me
some issues.

Thanks



On 3 ???? 2012, at 21:09, Baruch Siach <baruch@tkos.co.il> wrote:

Hi Assaf,

On Thu, May 03, 2012 at 06:14:49PM +0300, Assaf Inbal wrote:

I'm working on a project based on buildroot and I want to have the ability

to compile my packages for both my MIPS target using an external toolchain

(which works great) but I also want to be able to compile for my host.

To be precise, I want to use the local gcc and libraries so I will be able

to run my packages locally as well.

I've tried setting an external toolchain path as "/usr" but as a part of

preparing the target file system everything from my /lib,/etc and others

are copied to the output directory, which is, well, bad.


I've also toyed with creating a fake toolchain that was basically links to

the host's binaries but that also didn't go very well.


Does anyone have an idea on how I might be able to achieve this?


It seems to me that the easiest way is to select either i386 or x86_64 as
target architecture (assuming that your host is a PC, we have recently
discovered that this is not always the case), and run the result in a
chroot,
or in a virtualized system, on your development host. For a ready made qemu
example see board/qemu/x86/readme.txt.

baruch

-- 
    http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
  - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120503/7da860ef/attachment.html>
