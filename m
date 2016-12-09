From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Dec 2016 10:55:07 +0100
Subject: [Buildroot] [PATCH v2] sdl_mixer: fix static linking issue
In-Reply-To: <20161209042718.GC15584@waldemar-brodkorb.de>
References: <20161208172331.GA13013@waldemar-brodkorb.de>
 <20161208220602.37cfb553@free-electrons.com>
 <20161209042718.GC15584@waldemar-brodkorb.de>
Message-ID: <20161209105507.4d3d7910@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 9 Dec 2016 05:27:18 +0100, Waldemar Brodkorb wrote:

> > musl is also using a "everything in libc" policy. Does this problem
> > also occurs with musl? If not, why?  
> 
> It does not happen with musl because musl does not use libgcc
> unwinding functionality for pthread_cancel implementation.
> If anyone want to hack on uClibc-ng, I would love to get the libgcc
> dependency out. Old linuxthreads didn't use it, so this would
> be a good starting point to look at :)
> 
> If you would allow to use glibc for static linking, which is
> technically possible, you would see the same issue.

OK. Thanks a lot for this explanation. This clarifies why we're seeing
this with uClibc-ng only, which is what I wanted to understand.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
