From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 04 Sep 2013 08:27:17 -0300
Subject: [Buildroot] [PATCH] dependencies: Add host prerequisite for
	elf2flt
In-Reply-To: <20130904131900.7225d262@skate>
References: <1378282615.12336.1.camel@phoenix> <20130904105101.1662e059@skate>
 <52270CBA.1000603@zacarias.com.ar> <20130904131900.7225d262@skate>
Message-ID: <52271915.6050702@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/2013 08:19 AM, Thomas Petazzoni wrote:

>> HOST_ELF2FLT_DEPENDENCIES = host-binutils host-zlib
> 
> What I was suggesting is that host-elf2flt should have been a
> dependency of host-binutils. But that's obviously wrong, since elf2flt
> requires the libbfd library I suspect.

Yes that's true, the order would be binutils -> elf2flt -> gcc -> world
domination.

> Indeed. If it's not needed during the gcc build, one solution is to add
> its as a dependency in host-gcc-final.

It's needed for some uClibc combination, link-flat.so which uses elf2flt
pulls in libgcc according to uclibc/Makerules (used in
uclibc/libc/Makefile.in).
I think it's safer to pull it in for gcc-intermediate or even gcc-initial.
Regards.
