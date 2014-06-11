From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 11 Jun 2014 06:49:15 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-06-10
In-Reply-To: <20140611063007.B20E7101726@stock.ovh.net>
References: <20140611063007.B20E7101726@stock.ovh.net>
Message-ID: <CANQCQpaiwOhYMyXoQ_7bcHNGApKnVWOmHrxGzzjPHq5P1GSx2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 11, 2014 at 1:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Build statistics for 2014-06-10
> ===============================
>
<snip>

>       bfin |                  omniorb-4.1.6 | NOK | http://autobuild.buildroot.net/results/de5cdae456d83b0a1ac86cfcddf0c973c2304009/

posix.cc: In member function 'void omni_thread::start()':
posix.cc:603:2: error: invalid conversion from 'pthread_t*' to 'pthread_t'
posix.cc:603:2: error:   initializing argument 1 of 'int
pthread_detach(pthread_t)'
posix.cc: In static member function 'static omni_thread* omni_thread::self()':
posix.cc:800:5: error: too many arguments to function 'void*
pthread_getspecific(pthread_key_t)'

This looks like a blackfin uclinux(uclibc) pthread issue, since I have
tested this with uclibc successfully.  I'm not to familiar with the
blackfin's uclinux posix implementation completeness and didn't find
any open bug reports on this package.  So I'll take a look at this and
see if the best option is to limit the package to not build for
blackfin or to fix the problem and submit a path to the omni
maintainers (they are currently not actively taking updates/patches,
so I would probably go with the first option).

Thanks,
-- 
Matthew L Weber / Sr Software Engineer / Platform Software
matthew.weber at rockwellcollins.com
www.rockwellcollins.com
