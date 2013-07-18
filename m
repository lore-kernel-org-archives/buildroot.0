From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu, 18 Jul 2013 21:43:59 +0000
Subject: [Buildroot] [PATCH 0/3] Upgrade ARC port to new toolchain
In-Reply-To: <20130718215757.044949c7@skate>
References: <1374172354-3248-1-git-send-email-mjonker@synopsys.com>
 <20130718215757.044949c7@skate>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D633A09EE2@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas wrote:
> Can you send a followup patch to remove:
> 
> ifeq ($(BR2_GCC_VERSION_4_4_7_ARC),y)
> HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison endif
> 
> from package/gcc/gcc.mk
> 
> and
> 
> ifeq ($(BINUTILS_VERSION),2.19-arc)
> HOST_BINUTILS_DEPENDENCIES = host-flex host-bison else
> HOST_BINUTILS_DEPENDENCIES = endif
> 
> from binutils.mk ?

Ouch... thanks for reminding me about this one! I have uninstalled flex/bison on my system and figured out that these packages are indeed still required. Only for gcc fortunately, so we can at least clean it up partially. v2 patch set on its way with these fixes, and two more clean-ups.

Thanks,

Mischa
