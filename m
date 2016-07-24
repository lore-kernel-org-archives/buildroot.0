From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 23:49:32 +0200
Subject: [Buildroot] [PATCH] leaktracer: New package
In-Reply-To: <f6cb2b96-270c-d11e-d6dd-c8d4fc14d00c@gmail.com>
References: <1467412308-17545-1-git-send-email-maxime.hadjinlian@gmail.com>
 <f6cb2b96-270c-d11e-d6dd-c8d4fc14d00c@gmail.com>
Message-ID: <20160724234932.276586df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Jul 2016 23:35:24 +0200, Romain Naour wrote:

> > diff --git a/package/leaktracer/Config.in b/package/leaktracer/Config.in
> > new file mode 100644
> > index 0000000..18c07a7
> > --- /dev/null
> > +++ b/package/leaktracer/Config.in
> > @@ -0,0 +1,8 @@
> > +config BR2_PACKAGE_LEAKTRACER
> > +	bool "leaktracer"  
> 
> leaktracer must depends on !musl and !uClibc-ng since it use execinfo.h
> 
> libleaktracer/include/MemoryTrace.hpp:25:22: fatal error: execinfo.h: No such
> file or directory
>  #include <execinfo.h>
> 
> see
> http://www.openwall.com/lists/musl/2015/04/09/3

Or alternatively (better), make sure that the Makefile does not pass
-DUSE_BACKTRACE. Indeed, it is already planned in the leaktracer source
code to support systems with <execinfo.h>. Maybe a simple patch to the
Makefile would allow passing a make variable to disable backtrace usage.

Maxime, can you look into this and respin a new version of this patch?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
