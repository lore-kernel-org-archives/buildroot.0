From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jan 2011 16:11:58 +0100
Subject: [Buildroot] Buildroot with 2.4.27 kernel: Network problems
In-Reply-To: <20110130145510.5d371b00@x41>
References: <20110130084425.5cc28ae3@x41> <87bp2yybq0.fsf@macbook.be.48ers.dk>
	<20110130130131.10c3fcf5@x41> <877hdmy32g.fsf@macbook.be.48ers.dk>
	<20110130145510.5d371b00@x41>
Message-ID: <20110130161158.43d90798@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Jan 2011 14:55:10 +0100
Simon Kagstrom <simon.kagstrom@gmail.com> wrote:

> #
> # Kernel Header Options
> #
> # BR2_KERNEL_HEADERS_2_6_34 is not set
> # BR2_KERNEL_HEADERS_2_6_35 is not set
> BR2_KERNEL_HEADERS_2_6_36=y

If you use the toolchain produced by Buildroot in this configuration to
build your Busybox, then maybe it's this setting causing problem: your
toolchain is built with kernel headers 2.6.36, so its vision of the
userspace <-> kernelspace API/ABI is the one of 2.6.36. And then, you
run your programs with a much, much older kernel.

You should try to build your toolchain with the kernel headers with a
version equal or older to the kernel you're running. Unfortunately,
with a recent Buildroot, you won't be able to specify just "2.4.xx"
version for kernel headers: the mechanism to install kernel headers
when building the toolchain has changed quite a bit between 2.4 and
2.6, and we don't support 2.4 since a long time.

You can probably find some old stuff by looking at the history of
toolchain/kernel-headers/ in Buildroot git, but it's quite likely going
to be a little bit hard to revive the 2.4 support.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
