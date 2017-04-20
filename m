From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:25:37 +0200
Subject: [Buildroot] [PATCH v2] package: protobuf/python-protobuf: bump
 to v3.2.0.
In-Reply-To: <20170420140614.25998-1-mrugiero@gmail.com>
References: <20170417172225.20472-1-mrugiero@gmail.com>
 <20170420140614.25998-1-mrugiero@gmail.com>
Message-ID: <20170420222537.4226afcc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Apr 2017 11:06:14 -0300, mrugiero at gmail.com wrote:
> From: "Mario J. Rugiero" <mrugiero@gmail.com>
> 
> Both packages are coupled, so both were bumped and build-tested.
> The atomics' support patch is no longer needed, and neither is
> the autoreconf option, and SPARC64 is no longer broken.
> To make sure of this, one config of each of the following archs
> was tested (base defconfig in parens):
> PowerPC (qemu_ppc_g3beige_defconfig)
> SPARC (qemu_sparc_ss10_defconfig)
> SPARC64 (qemu_sparc64_sun4u_defconfig)

Thanks for this patch. Overall it looks good, but I have one
question/comment.


> -# On PowerPC, the __atomic_*() built-ins for 1-byte, 2-byte and 4-byte
> -# types are available built-in. However, the __atomic_*() built-ins for
> -# 8-byte types is implemented via libatomic, so only available since gcc
> -# 4.8.
> -#
> -# In Buildroot, to simplify things, we've decided to simply require gcc
> -# 4.8 as soon as the architectures has at least one __atomic_*() built-in
> -# variant that requires libatomic.
> -#
> -# Since protobuf most likely only uses the 1, 2 and 4-byte variants, it
> -# *could* technically build with gcc 4.7. This is probably not a big deal,
> -# and we can live with requiring gcc 4.8 on PowerPC to build protobuf.

What makes you think all of the above is no longer relevant?

There is still a "default y if BR2_TOOLCHAIN_HAS_ATOMIC", which allows
to build protobuf on all architectures that provide the __atomic_*()
built-ins.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
