From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Jan 2015 13:04:12 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-01-13
In-Reply-To: <54B79C90.4030102@imgtec.com>
References: <20150114073013.B78E1100B35@stock.ovh.net>
 <54B79C90.4030102@imgtec.com>
Message-ID: <20150115110411.GP2481@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Thu, Jan 15, 2015 at 11:55:12AM +0100, Vicente Olivert Riera wrote:
> On 14/01/15 08:30, Thomas Petazzoni wrote:
> >Build statistics for 2015-01-13
> >     mips64el |      start-stop-daemon-1.16.15 | NOK | http://autobuild.buildroot.net/results/24e37550749dc15ed7223fd515fa4628803f341e/
> 
> On 15/01/15 08:30, Thomas Petazzoni wrote:
> > Build statistics for 2015-01-14
> >     xtensa |        start-stop-daemon-1.16.15 | NOK | http://autobuild.buildroot.net/results/445bf4742d78a0bf93b4c75dc733c4315530031e/
> 
> this can be fixed by replacing this:
> 
> dpkg_arch=$($srcdir/run-script $PERL scripts/dpkg-architecture.pl -t$host
> -qDEB_HOST_ARCH 2>/dev/null)
> 
> with this:
> 
> dpkg_arch=$(uname -m)
> 
> in the configure script. Does anyone know a more elegant way to fix this?

This would give you the host architecture, I'm not sure that's what you want.

I'd go for changing AC_MSG_ERROR to AC_MSG_WARN in m4/dpkg-arch.m4 and see 
whether these values are actually needed.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
