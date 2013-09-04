From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Sep 2013 13:34:45 +0200
Subject: [Buildroot] [PATCH] dependencies: Add host prerequisite for
 elf2flt
In-Reply-To: <52271915.6050702@zacarias.com.ar>
References: <1378282615.12336.1.camel@phoenix> <20130904105101.1662e059@skate>
 <52270CBA.1000603@zacarias.com.ar> <20130904131900.7225d262@skate>
 <52271915.6050702@zacarias.com.ar>
Message-ID: <20130904133445.0af91136@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 04 Sep 2013 08:27:17 -0300, Gustavo Zacarias wrote:

> > Indeed. If it's not needed during the gcc build, one solution is to add
> > its as a dependency in host-gcc-final.
> 
> It's needed for some uClibc combination, link-flat.so which uses elf2flt
> pulls in libgcc according to uclibc/Makerules (used in
> uclibc/libc/Makefile.in).
> I think it's safer to pull it in for gcc-intermediate or even gcc-initial.

gcc-intermediate is going to be skipped in some situations after my
patch "[PATCHv2 03/14] toolchain-internal: skip gcc-intermediate when
possible" is merged.

So, as a dependency of gcc-initial seems like a better choice.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
