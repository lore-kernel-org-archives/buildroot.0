From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Feb 2017 22:20:26 +0100
Subject: [Buildroot] How to force AUTORECONF for everything
In-Reply-To: <20170216174538.GC4986@free.fr>
References: <089f01d28877$aa0cff70$fe26fe50$@codeaurora.org>
 <20170216174538.GC4986@free.fr>
Message-ID: <20170216222026.788ee7b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Feb 2017 18:45:38 +0100, Yann E. MORIN wrote:

> No, there is no global setting that forces that behaviour.
> 
> You'll have to hack the autotools infra. See in package/pkg-autotools.mk at 143:
> 
>   139 ifndef $(2)_AUTORECONF
>   140  ifdef $(3)_AUTORECONF
>   141   $(2)_AUTORECONF = $$($(3)_AUTORECONF)
>   142  else
>   143   $(2)_AUTORECONF ?= NO
>   144  endif
>   145 endif
> 
> You may want to change that "NO" to a "YES"
> 
> But beware, here be dragins...

In theory, there should be no dragons.

In practice, lots and lots of package to not autoreconf properly, so
you're going to face a *lot* of build failures by forcing autoreconf on
all packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
