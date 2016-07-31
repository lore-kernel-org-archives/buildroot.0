From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jul 2016 23:01:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/openswan: not available on musl
In-Reply-To: <20160731160517.GJ3620@tarshish>
References: <1469958682-6087-1-git-send-email-bernd.kuhls@t-online.de>
 <1469969267.9042.2.camel@embedded.rocks>
 <20160731160517.GJ3620@tarshish>
Message-ID: <20160731230102.070d5413@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Jul 2016 19:05:17 +0300, Baruch Siach wrote:

> netbsd-queue is a header only package, so it adds nothing to packages that 
> don't use it. libglob adds libglob.so that is only useful for few packages. We 
> can do something similar to way we handle gettext by adding
> 
>   select BR2_PACKAGE_LIBGLOB if BR2_TOOLCHAIN_USES_MUSL
> 
> for each such package.

Agreed.

BTW, the other day I was wondering if we shouldn't add another dummy
package for musl that adds the <sys/cdefs.h> header. It's supposedly an
internal glibc header but *lots* of packages use the __BEGIN_DECLS /
__END_DECLS definitions, and it's really annoying to fix them all, for
not a huge benefit.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
