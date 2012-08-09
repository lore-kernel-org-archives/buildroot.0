From: Jan Pohanka <xhpohanka@gmail.com>
Date: Thu, 09 Aug 2012 11:43:53 +0200
Subject: [Buildroot] libev on armv5 - illegal instruction
Message-ID: <op.wirpbfhyyxxkfz@pohanka-pc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'd like to use libev on my arm system with arm9 processor (armv5te).  
Unfortunately when I use libev-4.11 compiled by buildroot there is a  
problem with SIGILL illegal instruction. I checked the compiled library  
more deeply and there is really 'vldr' instruction which works only on  
cores with NEON.

I tried to compile the libev outside the buildroot with same CFLAGS  
(-march=armv5te -mcpu=arm926ej-s -mtune=arm926ej-s -mfloat-abi=softfp -Os)  
and cross-compiler (arm-2011.03 from codesourcery) and in this case the  
library works as expected.

When I set the path to BRROOT/output/host/bin and compile it there is the  
illegal instruction problem again. Even if the wrappers in host directory  
calls the same compiler.

Could please anyone give me some advice how to solve this problem? The  
rest of applications from buildroot works without any problems.

best regards
Jan

-- 
Tato zpr?va byla vytvo?ena p?evratn?m po?tovn?m klientem Opery:  
http://www.opera.com/mail/
