From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Nov 2014 10:45:31 +0100
Subject: [Buildroot] [PATCH 1/1] binutils/gcc: make it possible to use
 lto
In-Reply-To: <trinity-818df9f3-5f54-4f83-b594-5a2010751e0a-1415611698793@3capp-gmx-bs08>
References: <1415534161-24389-1-git-send-email-syntheticpp@gmx.net>
 <20141109140035.3798a1c7@free-electrons.com>
 <trinity-818df9f3-5f54-4f83-b594-5a2010751e0a-1415611698793@3capp-gmx-bs08>
Message-ID: <20141110104531.1529cf1d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Kuemmel,

On Mon, 10 Nov 2014 10:28:18 +0100, Peter Kuemmel wrote:

> Thought more about it: it is not necessary to make it optional.
> Using --enable-plugins --enable-lto in binutils only allows using lto,
> but when not used, it doesn't change anything. And these options are 
> available in the binutils versions supported by buildroot.
> 
> Also all buildroot's builds of the GCC (>=4.7) support the lto flags,
> and when -flto is not used nothing changed.
> 
> So in both cases optional support of lto is provided without changing
> behavior when lto is not used.

Ok. What about older versions of gcc/binutils, such as gcc 4.2, gcc
4.5, or binutils 2.18. We still support gcc 4.2 and binutils 2.18 for
the AVR32 architecture (even though it's marked deprecated, we still
haven't removed the support for this arch). We still have gcc 4.5 as
the default for Blackfin.

I guess some of those older versions don't support LTO, so maybe a
Config.in knob BR2_GCC_SUPPORTS_LTO will be needed, and ditto for
binutils.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
