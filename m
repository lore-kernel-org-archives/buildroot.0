From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Feb 2015 15:32:32 +0100
Subject: [Buildroot] [PATCH v1] qt5base: disable gold linker
In-Reply-To: <1423637231-4145-1-git-send-email-ps.report@gmx.net>
References: <1423637231-4145-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150211153232.2dcd2b32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Wed, 11 Feb 2015 07:47:11 +0100, Peter Seiderer wrote:
> Fixes [1],[2]:
> powerpc-ctng_e500v2-linux-gnuspe-g++: error: unrecognized command line option '-fuse-ld=gold'
> Makefile:1192: recipe for target '../../lib/libQt5Core.so.5.4.0' failed

The Qt configure script has some logic to detect whether the compiler
supports -fuse-ld=gold or not. Do you know why this logic is not
properly working, and not detecting that this specific compiler doesn't
support this?

Disabling unconditionally this feature is maybe OK, but I'd like to
understand why the configure script logic to auto-detect this is not
working.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
