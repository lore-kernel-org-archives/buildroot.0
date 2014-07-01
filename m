From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 1 Jul 2014 13:07:27 +0300
Subject: [Buildroot] [PATCH] wget: Depends on libuuid
In-Reply-To: <2414587.c08SQIiSAD@aspotashev>
References: <1404206129-27696-1-git-send-email-a.potashev@geoscan.aero>
 <20140701113549.1d3f2569@free-electrons.com>
 <2414587.c08SQIiSAD@aspotashev>
Message-ID: <20140701100727.GN4425@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexander,
On Tue, Jul 01, 2014 at 01:55:35PM +0400, Alexander Potashev wrote:
> ? ?????? ?? 1 ???? 2014 11:35:49 ???????????? Thomas Petazzoni ???????:
> > However, it indeed seems to be a possible optional dependency of wget,
> > in which case what you want is the following addition in wget.mk:
> > 
> > ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
> > WGET_DEPENDENCIES += util-linux
> > endif
> 
> Looks good, although one could argue if keeping *_DEPENDENCIES up-to-date is 
> important when we also have dependency assurance in Config.in.

No. These are two different levels of dependencies. Config.in 'select' 
determines which packages are to be built. You need this for mandatory 
dependencies. The per package $(PKG)_DEPENDENCIES determines the ORDER of the 
build. $(PKG)_DEPENDENCIES should list both mandatory AND optional 
dependencies to get a reproducible result.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
