From: Michael Boutte <maboutte@pacbell.net>
Date: Sat, 09 Sep 2006 09:43:00 -0700
Subject: [Buildroot] New User Basic Questions
Message-ID: <4502EF14.7090808@pacbell.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi - I am very new to buildroot, and first I want to say that it seems 
to be exactly what I need and also incredibly sophisticated. Thank you 
to all who make this at least possible.

The sophistication is where my problems arise, plus very little 
documentation that I can find. So I have a few questions that I think 
could help others too. Let me try to briefly explain why I want to use 
buildroot first, but I won't bore you with too many details.

I designed and built a board based on the powerpc MPC8xx series of 
Freescale processors. It has a few unique ports designed for my use.

I discovered and successfully adapted first U-Boot and then the ELDK 
from Denx to customize a bootloader and Linux 2.6.15 to run on this 
board. It originally used the ELDK "SELF" which is a small glibc based 
root filesystem. The filesystem quickly became too big to run, even in 
the 16M flash and 32M RAM on my board.

A friend created a new rootfilesystem based on uClibc 0.9.27 and BusyBox 
on an older MAC that uses the powerpc, so that he was working natively. 
He first attempted to build a cross compiler for the filesystem on a PC 
but was unsuccessful. This root filesystem works fine as far as it goes, 
but now I want to compile new programs and update the old ones and I no 
longer have access to this MAC. So I started working with your buildroot 
system on an X86 PC running Linux Fedora Core a few days ago.

So far I seem to be flailing around and barely getting anywhere. A few 
false starts have shown me that I absolutely have to simply "make" 
without changing anything in the default config except targetting to my 
powerpc target processor. After the first build I can sometimes 
successfully build a larger system in a few instances. So here are my 
questions:

1. How do I go about making one version as a cross compiler for the 
existing root filesystem which is 0.9.27? I see no way to do that 
because the svn access always seems to go for the latest (0.9.28 or 
0.9.29) unless I call out a specific build, which is still not tied to a 
version though. I also find the older compressed uClibc versions but do 
not know how to use those with the buildroot that I have already managed 
to create.

2. How do I determine what Toolchain Options to use for Kernel Headers, 
Binutils version and GCC compiler version? Is there some correlation to 
the versions of these items used to cross compile the kernel? Is there 
some way to know what combination of versions works for any particular 
architecture?

3. How do I start building a fresh rootfilesystem without starting over 
in a new directory? The "make clean" and "make distclean" seem to leave 
an awful lot behind? On the same vein how do I properly remove something 
from the root filesystem? For example I tried including Python and the 
resulting root was huge, but removing it from the configuration does not 
remove it from the root - and understanably, as I would expect to be 
able to put my own applications into the filesystem and not have them 
wiped out by rebuilding. So far I have simply created two directories to 
play in - one named uclibc and the other uclibc-0.9.27, the latter where 
I have been attempting to get a 0.9.27 version going. Each has its own 
separate buildroot under it to work in.

4. The configuration "endian-ness" seems to track the target processor, 
except that the JFFS2 file system option has an endian configuration 
selection. If my powerpc is big-endian should I also make this big-endian?

5. Is there somewhere else that might have more information in the way 
of faqs, documentation or case studies? I would be happy to write up 
anything that I discover for use by others. How about a Wiki based 
documentation system that users could add to?

Thank you in advance for your help.
Mike Boutte
