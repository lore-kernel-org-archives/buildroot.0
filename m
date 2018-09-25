From: Alvaro G. M. <alvaro.gamez@hazent.com>
Date: Tue, 25 Sep 2018 14:56:39 +0200
Subject: [Buildroot] Kernel module insertion fails with unknown rela
 relocation: 4
Message-ID: <20180925125637.GA17649@salem.gmr.ssr.upm.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I'm trying to build a buildroot system which shall include a kernel module I
was provided by a vendor. This module uses Jungo Connectivity WinDriver, and
it includes a binary blob that is supposed to be linked against an open
source module provided by the vendor. A headache in itself, and the fact
that there's a binary blob, may be related to this particular error.

I have been able to compile and use this module on Debian with kernel 3.16,
so that's my starting point for buildroot. I'm using latest buildroot
master, with kernel 3.16.57 and binutils 2.29.1 (although I've tried the
same with 2.28.1 and 2.31.1). In order to be as similar as possible to the
debian version on which the module works fine, I chose GCC 4.9.x

So, what happens is that on module insertion, insmod fails with error 
"Unknown rela relocation: 4". I've searched lot about this and it seems to
be related to this https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b21ebf2fb4cd

Now, I could easily apply that small patch to my 3.16.57 kernel version but,
how come that binutils 2.28.1 is using R_X86_64_PLT32 if that's supposedly
not on binutils until after binutils 2.31? Is there anything else that I'm
missing, some option on the toolchain definition on buildroot or something
like that?

Thank you!

-- 
Alvaro G. M.
