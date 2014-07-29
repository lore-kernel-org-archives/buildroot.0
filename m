From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Jul 2014 13:26:08 +0300
Subject: [Buildroot] [PATCH] libpcap: fix build for uclinux target
In-Reply-To: <20140726092752.150736ed@free-electrons.com>
References: <15676708c0726cb3fbed1dfaafae5e85c918ff3f.1406267235.git.baruch@tkos.co.il>
 <20140726092752.150736ed@free-electrons.com>
Message-ID: <20140729102608.GE2480@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Jul 26, 2014 at 09:27:52AM +0200, Thomas Petazzoni wrote:
> On Fri, 25 Jul 2014 08:47:15 +0300, Baruch Siach wrote:
> > As usual, uclinux is also linux. Also, -lpthread is needed to link the canusb
> > test.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/3af/3af796bc0eaa8563f0fd1dfce090083482fa57b9/
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> I've applied your patch, after making one minor change:
> 
> > +Also we need -lpthread for the test to build for noMMU targets.
> > +
> > +Signend-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Typo: Signend -> Signed.

Thanks for fixing and applying.

> Also, do you think you could send your new patch, as well as the
> existing 0001 patch on libpcap to the upstream project? It'd be great
> to be able to drop them at some point, and remove LIBPCAP_AUTORECONF =
> YES.

Done: https://github.com/the-tcpdump-group/libpcap/pull/372.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
