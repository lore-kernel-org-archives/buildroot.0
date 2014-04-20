From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 20 Apr 2014 08:23:48 +0300
Subject: [Buildroot] Analysis of build results for 2014-04-18
In-Reply-To: <20140420035125.GA4425@tarshish>
References: <20140419063009.6CB4810148A@stock.ovh.net>
 <20140419090850.339ca98f@skate> <20140420035125.GA4425@tarshish>
Message-ID: <20140420052348.GB4425@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Apr 20, 2014 at 06:51:25AM +0300, Baruch Siach wrote:
> On Sat, Apr 19, 2014 at 09:08:50AM +0200, Thomas Petazzoni wrote:
> > On Sat, 19 Apr 2014 08:30:09 +0200 (CEST), Thomas Petazzoni wrote:
> > 
> > >         success : 60 
> > >        failures : 22 
> > 
> > Much better than yesterday. Analysis below.
> 
> [...]
> 
> > >     xtensa |                  mesa3d-10.0.4 | NOK | http://autobuild.buildroot.net/results/66a9d2c664e0a9b2b0c51b998c72c2ceda90ff9b/
> > 
> > We need to add a NPTL dependency to mesa3d.
> > 
> > In file included from pipebuffer/pb_buffer_fenced.c:47:0:
> > ./os/os_thread.h: In function 'pipe_barrier_init':
> > ./os/os_thread.h:325:4: error: implicit declaration of function 'pthread_barrier_init' [-Werror=implicit-function-declaration]
> > ./os/os_thread.h: In function 'pipe_barrier_destroy':
> > ./os/os_thread.h:330:4: error: implicit declaration of function 'pthread_barrier_destroy' [-Werror=implicit-function-declaration]
> > ./os/os_thread.h: In function 'pipe_barrier_wait':
> > ./os/os_thread.h:335:4: error: implicit declaration of function 'pthread_barrier_wait' [-Werror=implicit-function-declaration]
> 
> pthread_barrier_* are also available on LT and LT.old.

This is wrong. These declarations are under '#if 0' in LT.old, but implemented 
in LT.

> It seems mesa3d just needs threads support. I'll try to work on this today.

I guess that making mesa3d depend on NPTL should be enough, though.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
