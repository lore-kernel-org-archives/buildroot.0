From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Feb 2017 16:45:39 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-24
In-Reply-To: <20170225125211.GD3627@free.fr>
References: <20170225072908.E590E20E2C@mail.free-electrons.com>
 <20170225104929.GC3627@free.fr> <20170225125211.GD3627@free.fr>
Message-ID: <20170225154539.GE3627@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2017-02-25 13:52 +0100, Yann E. MORIN spake thusly:
> On 2017-02-25 11:49 +0100, Yann E. MORIN spake thusly:
> > On 2017-02-25 08:29 +0100, Thomas Petazzoni spake thusly:
> > > Detail of failures
> > >         i686 |                   libcec-4.0.2 | NOK | http://autobuild.buildroot.net/results/dfb708172afa7dbe785ef1f5d177f745939e18e7
> > 
> > This build tries to link with host libraries, which is definitely not a
> > good thing...
> > 
> > I reverted all changes to cmake back to when it was cmake 3.6 and this
> > fixes the problem. I still have to investigate whether it is the bump to
> > 3.7 that causes the failure, or the pkg-config fix we added in 0904b80.
> 
> So here is the results of the investigations.
> 
> First, here are the cmake-related changes we've had recently:
> 
>     f8a6990 cmake: bump version to 3.7.2
>     b754237 cmake: adjust dependencies added for libuv
>     0904b80 cmake: pass HOST_CONFIGURE_OPTS at configure time
>     d96fafc cmake: bump version to 3.7.1
>     1ffcf36 cmake: bump version to 3.7.0
> 
> 1- Reverting all five of them fixes the build failure of libcec (adn
>    freerdp?)
> 
> 2- Reverting all but 0904b80 fixes the problem
> 
> 3- Reverting only 0904b80 does not fix the problem
> 
> So, cmake 3.7 broke the biuld of some cmake-based packages.

So far, I have identified three packages that suffer from the problem:

  - libcec
    http://autobuild.buildroot.org/results/3f3/3f3593bab7734dd274faf5b5690895e9424cbb89/

  - freerdp
    http://autobuild.buildroot.org/results/5d4/5d429d0e288754a541ee5d8be515454c5fccd28b/

  - domoticz
    http://autobuild.buildroot.org/results/fd0/fd0ba54c7abf973691b39a0ca1bb4e07d749593a/

(only one failure listed per package, there are many more...)

What do we do about that cmake bump?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
