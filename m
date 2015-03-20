From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 14:09:47 +0100
Subject: [Buildroot] [PATCH v1] evtest: fix
 program_invocation_short_name undeclared
In-Reply-To: <1426803498-18890-1-git-send-email-ps.report@gmx.net>
References: <1426803498-18890-1-git-send-email-ps.report@gmx.net>
Message-ID: <20150320140947.38980613@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

Adding Alexey from Synopsys in Cc.

On Thu, 19 Mar 2015 23:18:18 +0100, Peter Seiderer wrote:
> Add fallback in case program_invocation_short_name is undeclared,
> e.g. in case of some uclibc configurations.
> 
> Fixes [1]:
>   evtest.c:730:20: error: 'program_invocation_short_name' undeclared (first use in this function)
>     printf("%s %s\n", program_invocation_short_name, PACKAGE_VERSION);
> 
> [1] http://autobuild.buildroot.net/results/0fd/0fd36a0d79c4d82aedebb5aca8d3ce4214b1ed61
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Shouldn't we instead ask Synopsys to rebuild their toolchains with a
uClibc configuration that includes
UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y, so that it matches the
default Buildroot uClibc and we don't have to add gazillions of
workarounds in multiple packages just to support the ARC external
toolchain?

Alexey ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
