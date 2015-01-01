From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 1 Jan 2015 12:36:48 +0200
Subject: [Buildroot] [PATCH] glibc: add debug symbols when
 BR2_ENABLE_DEBUG
In-Reply-To: <20150101112940.0d1859fa@free-electrons.com>
References: <5517167ba77f268eeeaa8c5763078aeeb53741c6.1420107403.git.baruch@tkos.co.il>
 <20150101112940.0d1859fa@free-electrons.com>
Message-ID: <20150101103648.GU16594@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Jan 01, 2015 at 11:29:40AM +0100, Thomas Petazzoni wrote:
> On Thu,  1 Jan 2015 12:16:43 +0200, Baruch Siach wrote:
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/glibc/glibc.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> 
> Thanks!
> 
> Do you know if there's an easy way of checking if ELF binaries have
> debugging symbols? If so, we could add a check to verify that all ELF
> binaries have debugging symbols when BR2_ENABLE_DEBUG=y, and add this
> check in the autobuilders.

I guess looking for '.debug_info' in the output of 'objdump -h' or 'readelf 
-S' should be enough.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
