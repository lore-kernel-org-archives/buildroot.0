From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 27 Jul 2014 07:52:19 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-07-24
In-Reply-To: <CAMo8BfJ96eqY5hHU-Y8=MPAP48DbC6=tYZ90c0r7FgtoVGYjGQ@mail.gmail.com>
References: <20140725063012.8107D1015AE@stock.ovh.net>
 <CAMo8BfJ96eqY5hHU-Y8=MPAP48DbC6=tYZ90c0r7FgtoVGYjGQ@mail.gmail.com>
Message-ID: <20140727045219.GA2480@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,

On Sun, Jul 27, 2014 at 02:49:46AM +0400, Max Filippov wrote:
> On Fri, Jul 25, 2014 at 10:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Build statistics for 2014-07-24
> >     xtensa |       network-manager-0.9.10.0 | NOK | http://autobuild.buildroot.net/results/d33ed1c3bf1be7c8f8ea02590a770b0d29c7d9fa/
> 
> It fails with
> 
> NetworkManagerUtils.c:1020:23: error: 'CLOCK_BOOTTIME' undeclared
> (first use in this function)
>   err = clock_gettime (CLOCK_BOOTTIME, tp);
> 
> because there's no CLOCK_BOOTTIME in uClibc.
> Not sure what's the proper fix for that, adding support for
> CLOCK_BOOTTIME into uClibc?
> (looks fairly easy). Or just disabling network manager on uClibc?

A less intrusive solution might be adding

#ifndef CLOCK_BOOTTIME
#define CLOCK_BOOTTIME			7
#endif

in NetworkManagerUtils.c.

Adding CLOCK_BOOTTIME to uClibc sounds like a good idea anyway. I wonder 
though why we see so few build failures like this one (only two at 
http://autobuild.buildroot.net/?reason=network-manager-0.9.10.0 at the 
moment).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
