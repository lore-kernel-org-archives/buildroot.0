From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Mar 2018 10:55:06 +0200
Subject: [Buildroot] [PATCH v1 1/2] gnutls: needs C++ support
In-Reply-To: <20180327100822.4ba3ac42@windsurf.home>
References: <20180321202312.23021-1-ps.report@gmx.net>
 <87605it0kv.fsf@dell.be.48ers.dk>
 <20180327100822.4ba3ac42@windsurf.home>
Message-ID: <20180327085506.GE2736@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2018-03-27 10:08 +0200, Thomas Petazzoni spake thusly:
> On Tue, 27 Mar 2018 09:54:56 +0200, Peter Korsgaard wrote:
> > It is a bit stupid that we have pull in C++ support here and in all the
> > reverse dependencies just because of a stupid configure check, but I
> > guess it is the simplest/best solution.
> > 
> > Should we then also revert bd39d11d2eaa679f (core/infra: fix build on
> > toolchain without C++)?
> > 
> > Yann, Thomas, Arnout - What do you say?
> 
> I just fired up a build to reproduce the issue and have a look. But
> from what I remember last time I had a look, it was just some
> completely brain-damaged autoconf sorcery, and there wasn't really any
> hope of fixing it.

Yeah, this is a libtool issue... libtool will call to AC_PROG_CXXCPP as
soon as CXX is set and is not 'no':

    https://git.savannah.gnu.org/cgit/libtool.git/tree/m4/libtool.m4#n6305

Currently, we're passing CXX=false when C++ is not enabled. Maybe we
whould pass 'no' instead? Lemme run a test...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
