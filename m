From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Jun 2015 07:50:07 +0200
Subject: [Buildroot] [V2] moarvm: new package
In-Reply-To: <1433448072-13632-1-git-send-email-francois.perrad@gadz.org>
References: <1433448072-13632-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150605075007.410bd306@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu,  4 Jun 2015 22:01:12 +0200, Francois Perrad wrote:

> diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
> new file mode 100644
> index 0000000..4427e55
> --- /dev/null
> +++ b/package/moarvm/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_MOARVM
> +	bool "moarvm"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS

You don't use libatomic, so: why?

> +	help
> +	  MoarVM (short for Metamodel On A Runtime Virtual Machine) is
> +	  a runtime built for the 6model object system. It is primarily aimed
> +	  at running NQP and Rakudo Perl 6, but should be able to serve as
> +	  a backend for any compilers built using the NQP compiler toolchain.

I think the lines of the help text are slightly too long.

> +MOARVM_CONF_OPTS = \
> +	--build=$(GNU_HOST_NAME) \
> +	--host=$(GNU_TARGET_NAME) \
> +	--ar="$(TARGET_AR)" \
> +	--cc="$(TARGET_CC)" \
> +	--ld="$(TARGET_CC)" \
> +	--prefix="/usr"
> +
> +ifeq ($(BR2_ENDIAN),"BIG")
> +MOARVM_CONF_OPTS += --big-endian
> +endif
> +
> +define MOARVM_CONFIGURE_CMDS
> +	(cd $(@D); perl Configure.pl $(MOARVM_CONF_OPTS))

Is using the system provided Perl OK or should we use host-perl instead?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
