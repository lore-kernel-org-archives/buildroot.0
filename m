From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 22:02:12 +0100
Subject: [Buildroot] [PATCH] blktrace: new package
In-Reply-To: <1418135309-909-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418135309-909-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141210220212.6c20823e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  9 Dec 2014 11:28:29 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in              |  1 +
>  package/blktrace/Config.in     | 19 +++++++++++++++++++
>  package/blktrace/blktrace.hash |  2 ++
>  package/blktrace/blktrace.mk   | 22 ++++++++++++++++++++++
>  4 files changed, 44 insertions(+)
>  create mode 100644 package/blktrace/Config.in
>  create mode 100644 package/blktrace/blktrace.hash
>  create mode 100644 package/blktrace/blktrace.mk

Thanks applied. See one comment below, though.

> +	# Because of libaio arch depends
> +	depends on \
> +		BR2_arm   || BR2_armeb || BR2_avr32  || BR2_i386    || \
> +		BR2_m68k  || BR2_mips  || BR2_mipsel || BR2_powerpc || \
> +		BR2_sparc || BR2_x86_64

That's now the third duplication of this list of architecture
dependencies (it's already in the gadgetfs-test package. Maybe time to
add a BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS variable?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
