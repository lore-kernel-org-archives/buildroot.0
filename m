From: Microbit_Ubuntu <microbit@virginbroadband.com.au>
Date: Fri, 28 May 2010 07:51:46 +1000
Subject: [Buildroot] Buildroot 2010.05-rc3 released
In-Reply-To: <201005272315.11295.yann.morin.1998@anciens.enib.fr>
References: <877hmpv7km.fsf@macbook.be.48ers.dk>
	<1274986723.7293.8.camel@ubuntu>
	<201005272315.11295.yann.morin.1998@anciens.enib.fr>
Message-ID: <1274997106.436.29.camel@ubuntu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

On Thu, 2010-05-27 at 23:15 +0200, Yann E. MORIN wrote:
> Kris, All,
> 
> On Thursday 27 May 2010 20:58:43 Microbit_Ubuntu wrote:
> [--SNIP--]
> > PS : ct-ng only offers "linuxthreads".
> 
> That's only true if you build a uClibc-based toolchain. If you build a
> glibc- or a eglibc-based toolchain, then crosstool-NG allows you to
> use NPTL.
> 
> So I'll take that you build a uClibc-based toolchain...
> 
> > So are we supposed to use 
> > "stable/old" in BR or "new" (latter, I guess) ????
> 
> That has to match the way you configured uClibc in your toolchain.
> Check the uClibc .config file for that.
> 
> > I seem to have had problems with that - invoking gdbserver prompts :
> > "can't load libthread_db.so.1".
> > This worked fine with internal toolchain... Anyone ?
> 
> libthread_db.so.1 is dlopen(3)ed by gdbserver, so you have to get it on
> your target, in the standard libraries search path.
> 
> Also, there is a known dangling issue wrt cross-gdb + gdbserver.
> See this thread:
>   http://lists.busybox.net/pipermail/buildroot/2010-May/034435.html
> 
> In short, you have to get the cross-gdb *and* the gdbserver from the
> same version of gdb, to be sure they know how to speak to each other.
> So: either get both from crosstool-NG, or get both from buildroot.
> 
> Regards,
> Yann E. MORIN.
> 


I've been compiling with both from buildroot at all times, so that
should be OK.
While I was doing a sanity check vis-a-vis (sorry for the missing accent
grave) module inserting (solved), I used an older kernel uImage
(generated when I still used internal BR toolchain).

gdbserver of course is still happy there, but I can't find a trace of
libthread_db.so.1 on my rootfs target. (looked in /lib and /usr/lib).
I do have libpthread.so.0 etc.
I tried with an ltrace but that's not helping much.. (only see
__uClib_main)

I'll compile shortly and keep you posted.

Thanks for the help Yann, it's greatly appreciated !

-- Kris
