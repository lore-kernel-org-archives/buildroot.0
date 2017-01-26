From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 Jan 2017 13:11:25 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-01-24
In-Reply-To: <CAHXCMM+cL0UnnfhgFTtkeC7L+jRh8s=tr-U5CTC0YZxzUBb4bA@mail.gmail.com>
References: <20170125073013.D171D20CD4@mail.free-electrons.com>
 <1485378342.7516.1.camel@embedded.rocks>
 <20170125211534.dugtv6byofg3wvg5@tarshish>
 <CAHXCMM+cL0UnnfhgFTtkeC7L+jRh8s=tr-U5CTC0YZxzUBb4bA@mail.gmail.com>
Message-ID: <20170126111125.f7snoblajixwt322@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Thu, Jan 26, 2017 at 12:04:41PM +0100, Samuel Martin wrote:
> On Wed, Jan 25, 2017 at 10:15 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Wed, Jan 25, 2017 at 10:05:42PM +0100, J?rg Krause wrote:
> >> On Wed, 2017-01-25 at 08:30 +0100, Thomas Petazzoni wrote:
> >> [snip]
> >>
> >> > Detail of failures
> >> > ===================
> >> >
> >> >         i586 |                bctoolbox-0.4.0 | NOK | http://autobuil
> >> > d.buildroot.net/results/4b4b00ad3b95ddacc9d5cc31c34e457ee55c9364
> 
> Regarding this package, apologies I missed it during the initial review :s
> 
> This build failure occurs because it goes in a path it should not.
> In the Config.in: it is mentionned that mbedtls is prefered to
> polarssl [1], hence the select [1] and the dependency in the *.mk [2].
> However, the cmake configure flags are not set accordingly to this,
> and the defaults may play against us [3].
> 
> I would suggest to set the ENABLE_{MBEDTLS,POLARSSL} flags in the *.mk first.
> This should prevent from following this case [4], as displayed in the
> build log [5].
> 
> After this, if the CheckSymbolExists still causes error, we may need
> to patch the bctoolbox
> cmake code to set/fix the variables used by CheckSymbolExists [6].
> 
> >>
> >> Unfortunately I cannot reproduce this issue. Is it a rpath issue? cmake
> >> links a test program with host zlib:
> 
> Note: I'm not able to reproduce the error either.

Do you have a 32bit libz.so.1 in /usr/lib on your host machine?

> >> [..]/i586-buildroot-linux-musl/bin/ld: warning: libc.so.6, needed by
> >> /usr/lib32/libz.so.1, not found (try using -rpath or -rpath-link)
> >> /usr/lib32/libz.so.1: undefined reference to `strcpy at GLIBC_2.0'

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
