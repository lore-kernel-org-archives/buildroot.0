From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:52 -0800
Subject: [Buildroot] [buildroot 0001025]: New User Questions
Message-ID: <5ca80334b2ba6e1dcfa5ac955c6143e4@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1025 
====================================================================== 
Reported By:                mboutte
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1025
Category:                   Documentation
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-08-2006 15:29 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    New User Questions
Description: 
Hi - I am very new to buildroot, and first I want to say that it seems to
be exactly what I need and also incredibly sophisticated. Thank you and
all of your associates for this massive work effort.

The sophistication is where my problems arise, plus very little
documentation that I can find. So I have a few questions that I think
could help others if they were part of a FAQ. Let me try to explain why I
want to use buildroot first, but I won't bore you with too many details.

I designed and built a board based on the powerpc MPC8xx series of
Freescale processors. It has a few unique ports designed for my use.

I discovered and successfully adapted first U-Boot and then the ELDK from
Denx to customize a bootloader and Linux 2.6 to run on this board. It
originally used the ELDK "self" which is a small glibc based root
filesystem. The filesystem quickly became too big to run, even in the 16M
flash and 32M RAM on my board.

A friend created a new rootfilesystem based on uClibc and busybox on an
older MAC that uses the powerpc, so that he was working natively. He
attempted to build a cross compiler for the filesystem on a PC but was
unsuccessful. This root filesystem works fine as far as it goes, but now I
want to compile new programs and update the old ones and I no longer have
access to this MAC. So I started working with your buildroot system on an
X86 (actually AMD64) running Linux Fedora Core.

So far I seem to be flailing around and barely getting anywhere. A few
false starts have shown me that I absolutely have to simply "make" without
changing anything in the default config except targetting to my powerpc
target processor. Then I can successfully build a larger system. So here
are my questions:

1. How do I go about making a cross compiler for the existing root
filesystem which is 0.9.27? I see no way to do that because the svn access
always seems to go for the latest (0.9.28-29) unless I call out a specific
build, which is still not tied to a version though. I find the older
compressed versions but do not know how to use those with the buildroot
that I have already managed to create.

2. How do I determine what Toolchain Options to use for Kernel Headers,
Binutils version and GCC compiler version? Is there some correlation to
the versions of these items used to cross compile the kernel?

3. How do I start building a fresh rootfilesystem? The "make clean" and
"make distclean" seem to leave an awful lot behind? On the same lines how
do I remove something from the root filesystem? For example I tried
including Python and the resulting root was huge, but removing it from the
configuration does not remove it from the root - and understanably, as I
would expect to be able to put my own applications into the filesystem and
not have them wiped out by rebuilding. So far I have simply created two
directories to play in - one named uclibc and the other uclibc-0.9.27, the
latter where I have been attempting to get a 0.9.27 version going. each has
its own separate buildroot under it to work in.

4. The configuration "endian-ness" seems to track the target processor,
except that the JFFS2 file system option has an endian configuration
selection. If my powerpc is big-endian should I make this big-endian?

5. Is there somewhere else that might have more information in the way of
faqs, documentation or case studies? I would be happy to write up anything
that I discover for use by others. How about a Wiki based documentation
system that users could add to?

I read somewhere that almost 50% of new embedded designs were abandoned
because of hardware/software complexity!

Thank you in advance for your help.
Mike Boutte

====================================================================== 

---------------------------------------------------------------------- 
 vapier - 09-09-06 15:15  
---------------------------------------------------------------------- 
the bug tracker isnt for such things; please send an e-mail to the mailing
lists 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-08-06 15:29  mboutte        New Issue                                    
09-08-06 15:29  mboutte        Status                   new => assigned     
09-08-06 15:29  mboutte        Assigned To               => uClibc          
09-09-06 15:15  vapier         Note Added: 0001629                          
09-09-06 15:15  vapier         Status                   assigned => closed  
09-09-06 15:15  vapier         Resolution               open => suspended   
09-09-06 15:15  vapier         View Status              private => public   
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================
