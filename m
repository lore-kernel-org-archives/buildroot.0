From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jun 2017 11:25:10 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-06-23
In-Reply-To: <20170625090751.GB3673@scaer>
References: <20170624063043.4336020982@mail.free-electrons.com>
 <20170624195411.37qp6b5ocvenrjeo@tarshish>
 <20170624223852.7812d38d@windsurf.home>
 <20170625090751.GB3673@scaer>
Message-ID: <20170625092510.GC3673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, ABaruch, Richard, All,

On 2017-06-25 11:07 +0200, Yann E. MORIN spake thusly:
> > > On Sat, Jun 24, 2017 at 08:30:43AM +0200, Thomas Petazzoni wrote:
> > > >      aarch64 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/937c2c1e025bb16ca6fc26bc025ca728ad92bd3b |     
> > > >       x86_64 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/d397964e0a9b97fcc887143cdeaa02137e92469a |     
> > > >       xtensa |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/dccea3d71f2433f45eca4403343a15d01dda5be7 |     
> > > >      aarch64 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/af9accf066801b61bc05f0deef0ea6cdf36dabed |     
> > > >         m68k |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/a114fef820ed6e25603ded8594e6930f952cdfa2 |     
> > > >      powerpc |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/e25e8b031a944320c6ab5260220910b03820bfda |     
> > > >        nios2 |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/ee77acba11239511009bd98255599c9ecc043f6c |     
> > > >       mipsel |                  openvpn-2.4.3 | NOK | http://autobuild.buildroot.net/results/059e916b409e8aac42f565c9eba29bd8fad9cadf |       
[--SNIP--]
> OK, so I have two machien I've doen the test from. And indeed my
> autobuilder has an issue:
> 
> (yem at autobuild)$ wget 'http://swupdate.openvpn.net/community/releases/openvpn-2.4.3.tar.xz'
> (yem at autobuild)$ sha256sum openvpn-2.4.3.tar.xz
> 7aa86167a5b8923e54e8795b814ed77288c793671f59fd830d9ab76d4b480571  openvpn-2.4.3.tar.xz
[--SNIP--]
> However, when I do the same from my home machine, I get the expected
> hash:
> 
> (yem at home)$ wget 'http://swupdate.openvpn.net/community/releases/openvpn-2.4.3.tar.xz'
> (yem at home)$ sha256sum openvpn-2.4.3.tar.xz
> 15e15fc97f189b52aee7c90ec8355aa77469c773125110b4c2f089abecde36fb  openvpn-2.4.3.tar.xz

Furthermore, here is the diffstat beytween the two tarballs:

$ diff -du autobuild/openvpn-2.4.3 home/openvpn-2.4.3/ |diffstat
 home/openvpn-2.4.3/aclocal.m4   |   55    29    26     0 +
 home/openvpn-2.4.3/compile      |    2     1     1     0
 home/openvpn-2.4.3/config.guess |   47    30    17     0 +
 home/openvpn-2.4.3/config.h.in  |    3     1     2     0 -
 home/openvpn-2.4.3/config.sub   |   37    21    16     0 +
 home/openvpn-2.4.3/configure    | 2102  1247   855     0 +++++++++------
 home/openvpn-2.4.3/depcomp      |    2     1     1     0
 home/openvpn-2.4.3/install-sh   |  361   164   197     0 +--
 home/openvpn-2.4.3/ltmain.sh    | 5430  3458  1972     0 +++++++++++++++++++++++++---------------
 home/openvpn-2.4.3/Makefile.in  |   49    31    18     0 +
 home/openvpn-2.4.3/missing      |    2     1     1     0
 11 files changed, 4984 insertions(+), 3106 deletions(-)

So, it seems to be constrained to only the build scripts...

That is still utterly weird... :-(

I'm still investigating, but I'll be quite busy IRL today, so don't hold
your breath...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
