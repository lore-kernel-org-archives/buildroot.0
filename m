From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Aug 2016 22:34:16 +0200
Subject: [Buildroot] fixdep not found
In-Reply-To: <9DBD7782-3142-403E-9161-874B233FBAF0@gmail.com>
References: <CAK7rcp-qDKDR-qGPVBoUfpwCj22Qs4dmjvFg_=uaZok_kHC-nQ@mail.gmail.com>
 <9DBD7782-3142-403E-9161-874B233FBAF0@gmail.com>
Message-ID: <20160820223416.23798a74@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Aug 2016 13:31:58 -0700, Khem Raj wrote:

> > I'm getting an issue during >>> linux-headers 3.14.51 Configuring
> > where it executes a make ... headers_install, and then goes to execute
> > scripts/basic/fixdep, but cannot find it. I can see that fixdep must
> > be compiled from fixdep.c, which I can find within the particular
> > build directory. But it's not already compiled when buildroot
> > generates code that would depend on it.
> > 
> > How do I resolve this?  
> 
> it could be a race condition, so may be you can divide the build into two steps
> first does make tools and then make headers

Hu? How could the kernel build system has race conditions? We have
gazillions of builds involving linux-headers running every day, and we
never had a single race condition issue.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
