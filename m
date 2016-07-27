From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 21:26:12 +0200
Subject: [Buildroot] [PATCH] ipkg: fix ARM MMU-less build
In-Reply-To: <5593192e371e7a40e09e9b0189f3bfb2432a0e67.1469536052.git.baruch@tkos.co.il>
References: <5593192e371e7a40e09e9b0189f3bfb2432a0e67.1469536052.git.baruch@tkos.co.il>
Message-ID: <20160727212612.6e55d337@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 15:27:32 +0300, Baruch Siach wrote:
> The code incorrectly tests for __ARCH_HAS_MMU__ which is true for the ARM
> architecture, instead of __ARCH_USE_MMU__ which applies to this specific
> build. Add a patch making direct use of HAVE_FORK that configure defines when
> fork() is detected.

Your commit log and patch descriptor seems to imply it's ARM related,
but it's not. m68k is equally affected. So I've changed the commit log
and the patch description, and applied (even if ipkg has been marked
deprecated).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
