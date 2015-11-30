From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Nov 2015 22:20:11 +0100
Subject: [Buildroot] [git commit] guile: use libltdl,
	needs dynamic libraries
In-Reply-To: <87k2p5vxdn.fsf@dell.be.48ers.dk>
References: <20151125222250.4B3B07FC4C@busybox.osuosl.org>
 <20151126093555.5459974e@free-electrons.com>
 <87k2p5vxdn.fsf@dell.be.48ers.dk>
Message-ID: <20151130222011.14df7412@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Thu, 26 Nov 2015 12:00:20 +0100, Peter Korsgaard wrote:

>  > from guile.mk. But it is weird, because I remember adding those three
>  > lines in guile.mk in commit 49593aba5a56c9c297c31c12fc4dc3de5679e7b1,
>  > and at the time, I tested a static build of guile and it worked fine.
>  > But maybe it was a static build with a dynamic capable toolchain, so I
>  > didn't see all the problems.
> 
> The problem is really about toolchains with dynamic library support but
> used in a static buildroot configuration. The libtool configure script
> detects that the system supports dlopen/dlsym and builds libltdl with
> that backend, but then later the guile configure script fails to link a
> test program with libltdl as it doesn't link with -ldl.
> 
> As far as I can see libltdl with a toolchain not supporting shared
> libraries doesn't do anything sensible. Perhaps libtool itself should
> depend on !BR2_STATIC_LIBS?

Perhaps, yes.

> With that said, I am not sure if guile works at runtime without shared
> libraries so I went with the safe approach of disallowing it for
> 2015.11.

Yes, and I also don't care about guile too much, and even less so in
static configurations :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
