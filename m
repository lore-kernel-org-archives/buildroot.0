From: kevint <kevint@lanl.gov>
Date: Wed, 17 Oct 2007 16:12:01 -0600
Subject: [Buildroot] compiler.h
Message-ID: <2DA72617-4802-4BCF-9179-36B21AF6259E@lanl.gov>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am preparing a package that uses unlikely and likely gcc  
extensions.  The code includes:

<linux/compiler.h>

and this file does not exist in my toolchain's header directory.  How  
do I get this file?  Am I missing something terribly obvious?

For now, I am considering placing a compiler.h file in the headers  
directory that is similar to:

#ifndef likely
# define likely(x)	__builtin_expect((!!(x)),1)
#endif
#ifndef unlikely
# define unlikely(x)	__builtin_expect((!!(x)),0)
#endif

to get this package compiled.

Thanks in advance,

********************************************
Kevin Tegtmeier
HPC-3 Scientific Computing Resources
Los Alamos National Laboratory
email:  kevint at lanl.gov
********************************************



-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20071017/9cafe24c/attachment.htm 
