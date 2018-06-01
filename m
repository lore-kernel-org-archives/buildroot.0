From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 Jun 2018 16:27:39 +0200
Subject: [Buildroot] wireshark failure
In-Reply-To: <87y3fyzitn.fsf@dell.be.48ers.dk>
References: <20180530060038.E361F20D99@mail.bootlin.com>
 <85e276a9-676f-168f-898c-8605adc0aa51@mind.be>
 <87y3fyzitn.fsf@dell.be.48ers.dk>
Message-ID: <20180601162739.6ff0e13b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 01 Jun 2018 16:23:48 +0200, Peter Korsgaard wrote:

>  >  This is because gcc 6 has started providing stdlib.h itself, but wireshark
>  > changes all -I options into -isystem which makes the include_next not find
>  > stdlib.h any more. (Note, I have not found out why it didn't fail before
>  > November 11; the autobuilders were already using GCC6, and wireshark itself was
>  > bumped months before...).  
> 
>  >  There are two possible solutions for this:  
> 
>  > 1. Revert upstream commit 67d9daa65b9d "autotools: Fix extra-compiler-warnings
>  > for system headers". It's a rather big commit, though, and it doesn't revert
>  > cleanly.  
> 
>  > 2. Switch to CMake, which anyway has to happen at some point since newer
>  > releases have dropped autotools.  
> 
>  >  I've started doing the latter, but it turns out that the CMake infrastructure
>  > no longer supports GTK2. So, that would also imply removing GTK2 support from
>  > wireshark.  
> 
>  >  Since we're just before the 2018.05 release, and since this should also be
>  > backported to 2018.02, I wasn't sure whether that was acceptable...  
> 
>  >  Basically, it's choosing between supporting GTK2, or supporting QT5 + GCC6, or
>  > a possibly very complicated configure.ac + Makefile.am patch.  
> 
> Hmm, neither of which sounds very appealing. I think dropping gtk2
> support is probably the least bad option, so lets go for cmake.

I agree that this is the option that makes the most sense, because it's
the one that is future proof, as they are dropping autotools support.
gtk2 is fairly old by now, I don't think it's a big deal to drop
support for it, especially in the context of Buildroot where people are
unlikely to build wireshark for its GUI support.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
