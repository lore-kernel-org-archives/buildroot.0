From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 09:30:56 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <5319165F.2080401@openwide.fr>
References: <20140303090219.65a08cc7@skate>
 <495852511.10469178.1393846305700.JavaMail.root@openwide.fr>
 <20140303134805.2eb084c4@skate> <5319165F.2080401@openwide.fr>
Message-ID: <20140307093056.23f6c021@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 07 Mar 2014 01:44:15 +0100, Romain Naour wrote:

> It seems that __ELF__ has been removed from gcc

I don't really the relation between this statement you're making.

> http://gcc.gnu.org/gcc-4.9/changes.html
> "Support for a number of older systems and recently unmaintained or 
> untested target ports of GCC has been declared obsolete in GCC 4.9"

And this statement.

> 
> (version 4.9.0)
> ./microblaze-buildroot-linux-gnu-cpp -dM /dev/null | grep __ELF__
> 
> (version 4.7.2)
> (code sourcery toolchain x86)
> ./i686-pc-linux-gnu-cpp -dM /dev/null | grep __ELF__
> #define __ELF__ 1
> 
> (version 4.8.2)
> (buildroot internal toolchain x86)
> ./i686-buildroot-linux-gnu-cpp -dM /dev/null | grep __ELF__
> #define __ELF__ 1

And a x86 toolchain with gcc 4.9.x ?

> I'll send a patch to remove this test since buildroot does not have 
> support for non ELF system.

That's not true: we support Blackfin FLAT, which is not an ELF binary
format.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
