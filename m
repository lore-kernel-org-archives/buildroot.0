From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Aug 2016 15:50:06 +0200
Subject: [Buildroot] [PATCH] openal: Explicitly enable/disable NEON
 support to avoid trouble with precompiled toolchains
In-Reply-To: <1472387820-6783-1-git-send-email-nerv@dawncrow.de>
References: <1472387820-6783-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20160828155006.0abb2572@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Why do you think the problem is with "precompiled" toolchains only?

On Sun, 28 Aug 2016 14:37:00 +0200, Andr? Hentschel wrote:
> Fixes:
> http://autobuild.buildroot.net/results/d7ccef77a355ccc23f26d012e8441af931469ae4
> http://autobuild.buildroot.net/results/b5777a0ed33f6bb7a5fc0486ea21ecef58615dac
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/openal/openal.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/openal/openal.mk b/package/openal/openal.mk
> index 2916aa6..8205f9e 100644
> --- a/package/openal/openal.mk
> +++ b/package/openal/openal.mk
> @@ -50,4 +50,11 @@ ifeq ($(BR2_STATIC_LIBS),y)
>  OPENAL_CONF_OPTS += -DLIBTYPE=STATIC
>  endif
>  
> +# Explicitly enable/disable NEON support to avoid trouble with precompiled toolchains
> +ifeq ($(BR2_ARM_FPU_NEON)$(BR2_ARM_FPU_NEON_VFPV4),y)

I believe you should use BR2_ARM_CPU_HAS_NEON instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
