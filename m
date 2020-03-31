From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Mar 2020 23:32:06 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: add openssh runtime
 test
In-Reply-To: <20200330162411.9678-1-romain.naour@smile.fr>
References: <20200330162411.9678-1-romain.naour@smile.fr>
Message-ID: <20200331233206.632dcfce@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Mar 2020 18:24:10 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> +class TestOpenSshGlibc(TestOpensshBase):
> +    config = \
> +        TestOpensshBase.opensshconfig + \
> +        """
> +        BR2_x86_64=y
> +        BR2_x86_core2=y

Why use an x86-64 system? It forces you to build your own kernel? For
this glibc configuration, you could build your own toolchain, but
probably stick to using a prebuilt kernel.

> +        BR2_TOOLCHAIN_BUILDROOT_GLIBC=y

What about using the ARM ARM toolchain, and boot using the pre-built
vexpress kernel ? This will significantly speed-up the build of the
system for this runtime test.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
