From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Dec 2016 22:44:47 +0100
Subject: [Buildroot] [PATCH 2/2] toolchain: simplify the conditions for
 BR2_TOOLCHAIN_ARM_HAS_SYNC_8
In-Reply-To: <47d66856-80eb-9c55-026d-3b74b44886b1@mind.be>
References: <20161121234340.30463-1-arnout@mind.be>
 <20161121234340.30463-2-arnout@mind.be>
 <20161122093515.6db0df30@free-electrons.com>
 <47d66856-80eb-9c55-026d-3b74b44886b1@mind.be>
Message-ID: <20161208224447.271fc4a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 25 Nov 2016 00:13:16 +0100, Arnout Vandecappelle wrote:

> > On Tue, 22 Nov 2016 00:43:40 +0100, Arnout Vandecappelle
> > (Essensium/Mind) wrote:
> >   
> >>  config BR2_TOOLCHAIN_ARM_HAS_SYNC_8
> >>  	bool
> >>  	default y
> >>  	depends on BR2_arm || BR2_armeb
> >> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> >> -	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_ARM_CPU_ARMV7A
> >> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8  
> > 
> > Can we make this instead:
> > 
> > 	depends on (BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 && BR2_TOOLCHAIN_USES_GLIBC) || BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> > 
> > This way, glibc toolchains (which were never affected by the _write
> > issue) still expose the fact that they support the __sync_8 thing.
> > Otherwise, your change introduces a regression: a 4.7 glibc external
> > toolchain was prior to your patch exposing the fact that it supports
> > 8-byte sync, but no longer after your patch.not-quite  
> 
>  Now I think about it again, I think the condition should simply be
> 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7

Could you submit a new version that does this?

I'll mark your patch as Changes Requested for the time being.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
