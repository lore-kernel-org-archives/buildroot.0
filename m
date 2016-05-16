From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 May 2016 07:29:36 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-13
In-Reply-To: <20160515215357.7d8fbfce@free-electrons.com>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
 <57373DF3.5070509@zacarias.com.ar>
 <20160515215357.7d8fbfce@free-electrons.com>
Message-ID: <20160516042936.GC2583@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, May 15, 2016 at 09:53:57PM +0200, Thomas Petazzoni wrote: 
> > >>          i686 |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/3eb32c19f90a5fd8d45a0c36676e015e8278a469/  
> > >
> > >    CCLD     event-debug
> > > ../src/.libs/libinput.so: undefined reference to `static_assert'
> > >
> > > Baruch, you recently looked at libinput, could you investigate this
> > > build failure?  
> > 
> > static_assert() needs "modern" C11 support, and the feature isn't 
> > checked for in configure, that's the problem.
> > Quickie fix could be an #ifdef since it's basically a build check.
> 
> Baruch has sent a fix, I'll apply it.

I marked this patch as Rejected because it is wrong. Peter Hutterer suggested 
a better upstream fix[1]. I'll test this fix and post an updated patch.

[1] https://lists.freedesktop.org/archives/wayland-devel/2016-May/028881.html

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
