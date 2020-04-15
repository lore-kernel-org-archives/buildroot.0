From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 22:10:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: use -msse2
 only when supported
In-Reply-To: <20200414102621.18804-1-asafka7@gmail.com>
References: <20200414102621.18804-1-asafka7@gmail.com>
Message-ID: <20200415221030.1e6aafd0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Tue, 14 Apr 2020 13:26:21 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> The package adds the '-msse2' flag according to the result of the
> pythonic "platform.machine()" statement, which runs on the host
> and doesn't necessarily reflects the existence of this flag on
> the target compiler.
> Hence, we'll set the 'optimzed' variable in setup.py only when

optimzed -> optimized

> +define PYTHON_ARGON2_CFFI_SET_OPTIMZED_FLAG

optimized

> +        $(SED) 's;^\(optimized = *\)\(.*\);\1$(if $(BR2_X86_CPU_HAS_SSE2),True,False);' $(@D)/setup.py
> +endef
> +
> +PYTHON_ARGON2_CFFI_POST_PATCH_HOOKS += PYTHON_ARGON2_CFFI_SET_OPTIMZED_FLAG

optimized

But can't we do better here ? Check if the compiler supports the -msse2
flag ? See
https://github.com/pybind/python_example/blob/master/setup.py#L38 for
an example on how to do that.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
