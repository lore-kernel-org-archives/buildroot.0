From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Jun 2014 13:52:30 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-06-10
In-Reply-To: <CANQCQpaiwOhYMyXoQ_7bcHNGApKnVWOmHrxGzzjPHq5P1GSx2w@mail.gmail.com>
References: <20140611063007.B20E7101726@stock.ovh.net>
 <CANQCQpaiwOhYMyXoQ_7bcHNGApKnVWOmHrxGzzjPHq5P1GSx2w@mail.gmail.com>
Message-ID: <20140611135230.6b1d487f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Wed, 11 Jun 2014 06:49:15 -0500, Matthew Weber wrote:

> >       bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/de5cdae456d83b0a1ac86cfcddf0c973c2304009/
> 
> posix.cc: In member function 'void omni_thread::start()':
> posix.cc:603:2: error: invalid conversion from 'pthread_t*' to 'pthread_t'
> posix.cc:603:2: error:   initializing argument 1 of 'int
> pthread_detach(pthread_t)'
> posix.cc: In static member function 'static omni_thread* omni_thread::self()':
> posix.cc:800:5: error: too many arguments to function 'void*
> pthread_getspecific(pthread_key_t)'
> 
> This looks like a blackfin uclinux(uclibc) pthread issue, since I have
> tested this with uclibc successfully.  I'm not to familiar with the
> blackfin's uclinux posix implementation completeness and didn't find
> any open bug reports on this package.  So I'll take a look at this and
> see if the best option is to limit the package to not build for
> blackfin or to fix the problem and submit a path to the omni
> maintainers (they are currently not actively taking updates/patches,
> so I would probably go with the first option).

This might also be a NPTL vs. linuxthreads issue.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
