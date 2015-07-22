From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 22 Jul 2015 21:41:58 +0300
Subject: [Buildroot] buildroot for SAMA5D3 illegal instruction
In-Reply-To: <20150722171602.766be19e@free-electrons.com>
References: <55AF3847.503@mydatex.cz>
 <20150722085912.66ff27e0@free-electrons.com>
 <55AF3FF8.4020305@mydatex.cz> <55AFB25A.8040408@mydatex.cz>
 <20150722171602.766be19e@free-electrons.com>
Message-ID: <20150722184158.GO13027@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Jul 22, 2015 at 05:16:02PM +0200, Thomas Petazzoni wrote:
> On Wed, 22 Jul 2015 17:10:18 +0200, Daniel Smolik wrote:
> 
> > Many many thanks. Problem was in kernel headers. I run kernel 3.12.44
> > and use wrong headers.
> 
> Glad to hear it solved the problem.
> 
> This makes me wonder if using always the latest and greatest kernel
> headers by default in Buildroot is a good idea, because it clearly
> won't match what most people will need.

Maybe we should default to the highest BR2_TOOLCHAIN_HEADERS_AT_LEAST_* 
requirement. Currently this is v3.12 for libseccomp. Or maybe refine the rule 
to the oldest LTS kernel version that is not lower than highest 
BR2_TOOLCHAIN_HEADERS_AT_LEAST_* (also v3.12 at the moment).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
