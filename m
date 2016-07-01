From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 23:19:37 +0200
Subject: [Buildroot] [PATCH v2 09/15] toolchain/helpers: add fortran
 check
In-Reply-To: <20160701162920.19632-10-s.martin49@gmail.com>
References: <20160701162920.19632-1-s.martin49@gmail.com>
 <20160701162920.19632-10-s.martin49@gmail.com>
Message-ID: <20160701231937.4530ee2e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Jul 2016 18:29:14 +0200, Samuel Martin wrote:

> +check_fortran = \
> +	__CROSS_FC=$(strip $1) ; \
> +	printf 'program hello\n\tprint *, "Hello Fortran!\\n"\nend program hello\n' | \
> +		$${__CROSS_FC} -x f95 -o /dev/null - ; \

We've seen in the past some toolchains that didn't support this
solution of taking the source on the standard input and throwing away
the output (see 375bc18850f0f8fec90e1e478c0e9d2159377a64). I'd prefer
to use the same solution.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
