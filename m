From: Microbit_Ubuntu <microbit@virginbroadband.com.au>
Date: Fri, 28 May 2010 10:49:14 +1000
Subject: [Buildroot] Buildroot 2010.05-rc3 released
In-Reply-To: <201005272315.11295.yann.morin.1998@anciens.enib.fr>
References: <877hmpv7km.fsf@macbook.be.48ers.dk>
	<1274986723.7293.8.camel@ubuntu>
	<201005272315.11295.yann.morin.1998@anciens.enib.fr>
Message-ID: <1275007754.6387.30.camel@ubuntu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

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

I hope the list will forgive me sending to you & list.
Your posts have not reached me at all yet through busybox.net :-(

A follow-up as promised.
I'm rather surprised that the new build still bleats about 'can't load
libthread_db.so.1' when starting gdbserver...
That lib is in ../staging/lib as a symlink to libthread_db-0.9.30.1.so.
There's also a symlink in /staging/usr/lib called libthread_db.so which
points to libthread_db.so.1 - hmm.

As mentioned, the previous rootfs runs fine, however there is no trace
of this lib on the target.

I'm a bit stumped on this one.
I've used linuxthreads (new) in uclibc 0.9.30.1 config.

TIA
Ici avec beaucoup de soucis !!!
(rather than "sans soucis" :-)
-- Kris
