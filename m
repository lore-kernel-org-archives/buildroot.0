From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Jun 2017 21:27:01 +0200
Subject: [Buildroot] Policy for upgrading toolchains in LTS version
In-Reply-To: <232c0fde-c837-ccfd-949c-eeec82a24fdb@free.fr>
References: <232c0fde-c837-ccfd-949c-eeec82a24fdb@free.fr>
Message-ID: <20170622192701.GC3054@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mason, All,

On 2017-06-22 11:23 +0200, Mason spake thusly:
> Providing an LTS version is an interesting idea.
> 
> I was wondering about the policy for upgrading toolchains
> in LTS versions (I use Linaro).
> 
> Case in point: 2017.02.x branch is set up to use gcc-linaro-6.2.1-2016.11
> 
> Since then, Linaro has released two bug-fix versions:
> 
> https://releases.linaro.org/components/toolchain/binaries/6.1-2016.08/
> https://releases.linaro.org/components/toolchain/binaries/6.2-2016.11/
> https://releases.linaro.org/components/toolchain/binaries/6.3-2017.02/
> https://releases.linaro.org/components/toolchain/binaries/6.3-2017.05/
> 
> AFAIU, these releases are all on the same branch, i.e. they
> keep the packages (mostly) stable:
> gcc 6, glibc 2.23, newlib 2.4, binutils 2.27, gdb 7.12
> NB: Apparently gdb got bumped from 7.11 to 7.12 in 2016.11
> (IIUC, this is a cross-debugger, when using remote gdb.)
> 
> For example, this bug seems likely to affect current BR LTS:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=78253
> (It was fixed in Linaro 2017.02)
> 
> I think there is a case for upgrading the toolchain in the LTS
> branch (while staying on the same Linaro branch of course.)
> 
> What do you think?

I think that it all depends. ;-)

First, Peter is in charge of the LTS branch, so it's all about what he
believes it is too intrusive or not...

Then, I have basically no knowledge of the Linaro toochains and their
release criterions.

If as you state they are only bug-fix releases, then we could indeed
bump those toolchains, yes. It imho complies with the goal of an LTS.

Note however that we so far never bumped the gcc version in the LTS
branch, but we already had 6.3 at the time we cut the LTS. So it;s
difficult to say if we would bump it. Probably, I'd say...

My 2 euro-cents...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
