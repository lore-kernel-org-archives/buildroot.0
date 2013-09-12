From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Sep 2013 09:23:00 +0200
Subject: [Buildroot] [PATCH] gcc-initial: Add host-elf2flt dependency
 when BR2_PACKAGE_HOST_ELF2FLT=y
In-Reply-To: <CAFRkauDMtOvQj0dx0Xxz2KhWxeHBFERvvU6cohSmpwv5ydRtiQ@mail.gmail.com>
References: <1378307915.5313.1.camel@phoenix> <20130904181958.36251b69@skate>
 <52305E98.7040202@zacarias.com.ar>
 <CAFRkauDMtOvQj0dx0Xxz2KhWxeHBFERvvU6cohSmpwv5ydRtiQ@mail.gmail.com>
Message-ID: <20130912092300.0b3fbb9d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Thu, 12 Sep 2013 09:13:21 +0800, Axel Lin wrote:

> Probably not directly related to this topic, but I have a question
> about the dependency between BR2_BINFMT_FLAT &
> BR2_PACKAGE_HOST_ELF2FLT.
> 
> Why not just make BR2_PACKAGE_HOST_ELF2FLT depend on BR2_BINFMT_FLAT
> rather than "depends on BR2_arm || BR2_bfin || BR2_sh || BR2_sparc"?

As Gustavo pointed out (maybe on IRC ?), BR2_PACKAGE_HOST_ELF2FLT
should simply be removed. There is no need to have a Kconfig option to
host tools when they can simply be built as a dependency of something
else (which is the case here).

The only case for which we add a Kconfig option for host tools is when
this host tool is not built as a dependency of something else, and that
the user may still be interested in building it.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
