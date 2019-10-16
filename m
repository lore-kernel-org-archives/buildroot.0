From: Lothar Felten <lothar.felten@gmail.com>
Date: Wed, 16 Oct 2019 19:57:36 +0200
Subject: [Buildroot] [RFC PATCH 2/4] ti-sgx-*: bump to latest TI version
In-Reply-To: <20191016092842.0092549c@windsurf>
References: <20191015213101.27460-1-lothar.felten@gmail.com>
 <20191015213101.27460-2-lothar.felten@gmail.com>
 <20191016092842.0092549c@windsurf>
Message-ID: <5e7fc2e58d554b052e821e724bdc4c7a94b7187b.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2019-10-16 at 09:28 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 15 Oct 2019 23:30:59 +0200
> Lothar Felten <lothar.felten@gmail.com> wrote:
> 
> > bump the ti-sgx-km,-um and -demos to the TI version that matches
> > the TI SDK 06.00.00.07.
> > 
> > Removed all targets except AM335x.
> 
> Are you sure about this ? I've briefly browsed through the commits
> 2b7523d07a13ab704a24a7664749551f4a13ed32..4519ed3b83d1d72207ddc2874c7
> eb5e5a7f20d8d
> in ti-sgx-km, and I don't see anything about removing support for
> platforms.
> 
> However indeed there used to be a per-platform directory in
> eurasia_km/eurasiacon/build/linux2/:
> 
> omap437x_linux
> omap5430_linux
> omap335x_linux
> omap4430_linux
> 
> But it has now been replaced by a single folder omap_linux, in commit
> 5f8570e190b37e534c9195728812190ec999c9d5, which says:
> 
> commit 5f8570e190b37e534c9195728812190ec999c9d5
> Author: Eric Ruei <e-ruei1@ti.com>
> Date:   Fri Feb 22 12:42:58 2019 -0500
> 
>     km: Makefile cleanup
>     
>     This patch simplifies the omap makefile to improve readability.
>     The makefile is used to build DRM-based SGX user modules for K4.x
> and
>     AM3/4/5/6 SoC only and therefore there is no need to keep the
> unused
>     environment variables and conditions in history.
>     - Remove unsupported targets
>     - Remove unused environment variables
>     - Remove unused and/or dead conditions
>     
>     Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> 
> There are still tests for various TARGET_PRODUCT values:
> 
> eurasia_km/eurasiacon/build/linux2/omap_linux/Makefile:ifneq
> ($(filter omap5uevm jacinto6evm,$(TARGET_PRODUCT)),)
> eurasia_km/eurasiacon/build/linux2/omap_linux/Makefile:ifneq
> ($(filter ti654x,$(TARGET_PRODUCT)),)
> eurasia_km/eurasiacon/build/linux2/omap_linux/Makefile:ifneq
> ($(filter ti335x ti437x,$(TARGET_PRODUCT)),)
> eurasia_km/eurasiacon/build/linux2/omap_linux/Makefile: ifeq
> ($(TARGET_PRODUCT), ti437x)
> 
> Could you clarify why you think there is only support for AM335x left
> ?

Sorry the message was misleading, I meant to say: currently the
buildroot package only supports the target am335x.

The support for the other boards can be added by selecting the correct
TARGET_PRODUCT/TI_SGX_UM_TARGET as you stated.

Those patches are preliminary as the goal to build qt5 with sgx
acceleration still needs some work. I just modified the package so it
builds at least for AM335x. The other targets need at least menu
entries for the variable, maybe more.

Best regards,
Lothar

> 
> Best regards,
> 
> Thomas
