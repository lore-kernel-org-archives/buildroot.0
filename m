From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Dec 2015 22:41:25 +0200
Subject: [Buildroot] [PATCH 3/3] ltp-testsuite: disable tirpc tests
 using authdes_create
In-Reply-To: <1449740174-11062-3-git-send-email-patrickdepinguin@gmail.com>
References: <1449740174-11062-1-git-send-email-patrickdepinguin@gmail.com>
 <1449740174-11062-3-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20151210204125.GB3021@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Dec 10, 2015 at 10:36:14AM +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> In buildroot, libtirpc is patched to remove authdes_create functions.
> As a result, compilation of tests that use these functions, fails.
> 
> A previous fix was implemented in commit
> 8f1c4c49a2ab0fc9e6cf73370f4483e253e5ac2d, but simply disabled linking with
> libtirpc entirely. This broke usage of ltp-testsuite on targets where the
> toolchain does not have RPC support and libtirpc is mandatory.
> 
> Instead, disable only the problematic tests, leaving ltp-testsuite usable
> with libtirpc.

Thanks for following up on this. I think however that this patch should come 
first in this series for the sake of bisectability.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
