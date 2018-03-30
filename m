From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Mar 2018 21:06:41 +0200
Subject: [Buildroot] [PATCH v4 03/11] package/llvm: enable AMDGPU
In-Reply-To: <b5a9d228-d7e1-7330-b5f6-52ad7ea443b9@mind.be>
References: <20180329113346.10367-1-valentin.korenblit@smile.fr>
 <20180329113346.10367-4-valentin.korenblit@smile.fr>
 <20180330110241.792a6607@windsurf>
 <b5a9d228-d7e1-7330-b5f6-52ad7ea443b9@mind.be>
Message-ID: <20180330210641.334407b0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Mar 2018 20:08:28 +0200, Arnout Vandecappelle wrote:

>  Or maybe
> 
> LLVM_TARGETS_TO_BUILD = $(HOST_LLVM_TARGET_ARCH)
> 
> ifeq ($(BR2_PACKAGE_LLVM_AMDGPU),y)
> LLVM_TARGETS_TO_BUILD += AMDGPU
> endif
> 
> LLVM_CONF_OPTS = -DLLVM_TARGETS_TO_BUILD=$(subst
> $(space),;,$(LLVM_TARGETS_TO_BUILD))
> 
> 
>  Or is that too much GNUmake black magic?

No, that's good.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
