From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:29:11 +0100
Subject: [Buildroot] [PATCH] package/iprutils: disable for musl
 toolchains
In-Reply-To: <1453582679-30476-1-git-send-email-romain.naour@gmail.com>
References: <1453582679-30476-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160125232911.6d1f5375@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 23 Jan 2016 21:57:59 +0100, Romain Naour wrote:
> Disable iprutils for musl toolchain until someone
> is interested enough to fixes it.
> 
> Note: the latest version (2.4.10) doesn't event build
> with uClibc due to a test in the new configure script.
> 
> AC_CHECK_LIB([m], [matherr], [], [AC_ERROR("libm not found.")])
> 
> Avoid:
> http://autobuild.buildroot.net/results/61e/61e121c25fc07083bcccedfcb4f938d18f5c5456/
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Disabling on musl seems really excessive. I looked at the problem, and
by:

 * Removing the #include <bits/sockaddr.h> from iprlib.h

 * Adding #include <limits.h> to iprlib.h

I was able to build the iprutils package with the musl C library on ARM.

Could you look into this and cook a better patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
