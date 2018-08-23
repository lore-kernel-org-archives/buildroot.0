From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Aug 2018 13:43:53 +0200
Subject: [Buildroot] [PATCH 1/1] mjpegtools: fix build on powerpc
 without altivec
In-Reply-To: <20180822203008.3249-1-fontaine.fabrice@gmail.com>
References: <20180822203008.3249-1-fontaine.fabrice@gmail.com>
Message-ID: <20180823134353.5c76e7b6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Aug 2018 22:30:08 +0200, Fabrice Fontaine wrote:
> mpjegtools fails to build on powerpc without altivec:
> 
> build_sub44_mests.c: In function 'build_sub44_mests_altivec':
> build_sub44_mests.c:268:9: internal compiler error: Segmentation fault
>      vr1 = vec_ld(rowstride, (unsigned char*)s44blk);
> 
> It seems mpjegtools is wrongly detecting altivec support:
> configure:   - PowerPC Optimizations:
> configure:     - AltiVec enabled             : true
> 
> Fix this by adding BR2_PACKAGE_MJPEGTOOLS_SIMD_SUPPORT and setting
> --enable-simd-accel / --disable-simd-accel
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/c9464712f43efb8954fd2e5460126ad193660353
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I've applied to master, but it would have be nicer to figure out why
the Altivec detection doesn't work properly. But OK, that's good enough
for Buildroot with --enable/disable-simd-accel.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
