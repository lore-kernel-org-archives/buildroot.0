From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 25 Jan 2017 23:15:34 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-01-24
In-Reply-To: <1485378342.7516.1.camel@embedded.rocks>
References: <20170125073013.D171D20CD4@mail.free-electrons.com>
 <1485378342.7516.1.camel@embedded.rocks>
Message-ID: <20170125211534.dugtv6byofg3wvg5@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Wed, Jan 25, 2017 at 10:05:42PM +0100, J?rg Krause wrote:
> On Wed, 2017-01-25 at 08:30 +0100, Thomas Petazzoni wrote:
> [snip]
> 
> > Detail of failures
> > ===================
> > 
> > ????????i586 |????????????????bctoolbox-0.4.0 | NOK | http://autobuil
> > d.buildroot.net/results/4b4b00ad3b95ddacc9d5cc31c34e457ee55c9364
> 
> Unfortunately I cannot reproduce this issue. Is it a rpath issue? cmake
> links a test program with host zlib:
> 
> [..]/i586-buildroot-linux-musl/bin/ld: warning: libc.so.6, needed by
> /usr/lib32/libz.so.1, not found (try using -rpath or -rpath-link)
> /usr/lib32/libz.so.1: undefined reference to `strcpy at GLIBC_2.0'

This is your host library.

> I have no idea how to fix it. bctoolbox' cmakelists.txt does set
> CMAKE_INSTALL_RPATH=/usr/lib. Is this a problem?

That is definitely not compatible with cross compilation.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
