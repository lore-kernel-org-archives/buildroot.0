From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Dec 2010 17:52:44 +0100
Subject: [Buildroot] [PATCH] toolchain-external: check sysroot *after*
 copying
In-Reply-To: <1292171123-32551-1-git-send-email-vapier@gentoo.org>
References: <1292171123-32551-1-git-send-email-vapier@gentoo.org>
Message-ID: <20101213175244.72901d85@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Dec 2010 11:25:23 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> The current toolchain checking code will probe the files in the
> sysroot to make sure things are sane, but it does this *before* it
> actually copies the files in question over.  Thus from a clean build,
> it's impossible to actually use the external toolchain option.
> 
> So re-order things so we initialize the local sysroot first and then
> check the result.

SYSROOT_DIR points to the original sysroot of the toolchain, not the
one we copy locally for Buildroot. So the original sysroot of the
toolchain is already available when starting a new build.

See the definition of SYSROOT_DIR:

TARGET_CC_NO_SYSROOT=$(filter-out --sysroot=%,$(TARGET_CC_NOCCACHE))
SYSROOT_DIR=$(shell $(TARGET_CC_NO_SYSROOT) -print-sysroot 2>/dev/null)

Could you point the specific problem you're having ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
