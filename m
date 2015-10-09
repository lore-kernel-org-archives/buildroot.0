From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 17:09:01 +0200
Subject: [Buildroot] liquid-dsp: new package
In-Reply-To: <1444336646-12586-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1444336646-12586-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20151009170901.28799ac1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Oct 2015 14:37:25 -0600, Guillaume William Bres wrote:

> Liquid-DSP is a DSP library using pure C and only relying on libm.
> This patch clones the master branch because the latest tag is quite old,
> and configure.ac does not know of armv7|armv8 in that version for instance.
> 
> Autoconf requires to include -I(PACKAGE_DIR)/scripts, so I did my best
> to have something working, you guys might have suggestions to improve that.

What do you mean by "requires to include" ?

> Finally, ./configure does not work with an uclibc toolchain, so I added BR2_TOOLCHAIN_GLIBC
> as a dependency. The error is crealf() is not found (<complex.h>).

crealf() is available in musl, so you should instead:

	# needs crealf() complex math function
	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
