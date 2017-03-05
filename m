From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Mar 2017 10:09:53 +0100
Subject: [Buildroot] Analysis of build results for 2017-03-04
In-Reply-To: <20170305094814.7fd9ae85@free-electrons.com>
References: <20170305072847.53355206EF@mail.free-electrons.com>
 <20170305094814.7fd9ae85@free-electrons.com>
Message-ID: <20170305090953.GA3671@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-05 09:48 +0100, Thomas Petazzoni spake thusly:
> On Sun,  5 Mar 2017 08:28:47 +0100 (CET), Thomas Petazzoni wrote:
> >       x86_64 |                    cmake-3.7.2 | NOK | http://autobuild.buildroot.net/results/f30228e1885e7292957528158d0fb74cb51e2330
> 
> Not sure:
> 
> [ 77%] Building CXX object Source/CMakeFiles/CPackLib.dir/CPack/IFW/cmCPackIFWInstaller.cxx.o
> /home/test/autobuild/run/instance-1/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so: undefined reference to `libssh2_scp_recv2'
> /home/test/autobuild/run/instance-1/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libcurl.so: undefined reference to `libssh2_session_handshake'
> 
> Samuel, Yann, Vicente?

Dang, cmake again... :-(  I'll be looking at it.

> > microblazeel |                 wayland-1.13.0 | NOK | http://autobuild.buildroot.net/results/291e0f1ea18004190ae5acd9bec147cacc3e4bda
> 
> Reported to Gustavo already: Wayland normally doesn't need C++, except
> to build one of its tests.

I have a patch here that I'm testing, that adds a --disable-tests
configure option. It should be ready before the end of the day...

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
