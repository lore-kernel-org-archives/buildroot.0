From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 27 May 2010 23:15:11 +0200
Subject: [Buildroot] Buildroot 2010.05-rc3 released
In-Reply-To: <1274986723.7293.8.camel@ubuntu>
References: <877hmpv7km.fsf@macbook.be.48ers.dk>
	<1274986723.7293.8.camel@ubuntu>
Message-ID: <201005272315.11295.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kris, All,

On Thursday 27 May 2010 20:58:43 Microbit_Ubuntu wrote:
[--SNIP--]
> PS : ct-ng only offers "linuxthreads".

That's only true if you build a uClibc-based toolchain. If you build a
glibc- or a eglibc-based toolchain, then crosstool-NG allows you to
use NPTL.

So I'll take that you build a uClibc-based toolchain...

> So are we supposed to use 
> "stable/old" in BR or "new" (latter, I guess) ????

That has to match the way you configured uClibc in your toolchain.
Check the uClibc .config file for that.

> I seem to have had problems with that - invoking gdbserver prompts :
> "can't load libthread_db.so.1".
> This worked fine with internal toolchain... Anyone ?

libthread_db.so.1 is dlopen(3)ed by gdbserver, so you have to get it on
your target, in the standard libraries search path.

Also, there is a known dangling issue wrt cross-gdb + gdbserver.
See this thread:
  http://lists.busybox.net/pipermail/buildroot/2010-May/034435.html

In short, you have to get the cross-gdb *and* the gdbserver from the
same version of gdb, to be sure they know how to speak to each other.
So: either get both from crosstool-NG, or get both from buildroot.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
