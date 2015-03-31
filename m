From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Mar 2015 20:11:43 +0300
Subject: [Buildroot] [PATCH 1/1] package/libseccomp: needs headers >=
	3.12
In-Reply-To: <XnsA46EC1420D725berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1427819637-2471-1-git-send-email-bernd.kuhls@t-online.de>
 <20150331165723.GP12479@tarshish>
 <XnsA46EC1420D725berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150331171143.GQ12479@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Tue, Mar 31, 2015 at 06:59:53PM +0200, Bernd Kuhls wrote:
> Baruch Siach <baruch@tkos.co.il> wrote in 
> news:20150331165723.GP12479 at tarshish:
> 
> > Can't we limit the 3.12 headers dependency to BR2_aarch64?
> 
> no, the build errors are not limited to aarch64: 
> http://autobuild.buildroot.net/?reason=libseccomp-v2.2.0

Now I see. It is kernel commit 909e3ee41 that adds both EM_ARM and EM_AARCH64 
to a generic header. In this case maybe patching the code is preferable. 
Something like:

#ifndef EM_ARM
#define EM_ARM 40
#endif

#ifndef EM_AARCH64
#define EM_AARCH64 183
#endif

Something like that should be acceptable upstream.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
