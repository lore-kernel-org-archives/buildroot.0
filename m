From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Thu, 13 Aug 2020 13:41:38 +0200
Subject: [Buildroot] [PATCH v2 1/5]
 support/scripts/gen-bootlin-toolchains: add new script to support Bootlin
 toolchains
In-Reply-To: <20200809193818.1139805-2-thomas.petazzoni@bootlin.com>
References: <20200809193818.1139805-1-thomas.petazzoni@bootlin.com>
 <20200809193818.1139805-2-thomas.petazzoni@bootlin.com>
Message-ID: <4168571a-d237-d489-656e-c1fa159858cd@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Glad to see the Bootlin toolchains landing soon in Buildroot :)

On 9/08/20 21:38, Thomas Petazzoni wrote:
> https://toolchains.bootlin.com/ has been providing for a few years a
> number of ready-to-use pre-built toolchains, for a wide range of
> architectures (which it turns out, are all built using Buildroot).
> 
> While toolchains.bootlin.com provides Buildroot config fragments to
> easily use those toolchains with Buildroot (see [0] for example), this
> is not visible anywhere. So instead, we would like to add support for
> these toolchains in Buildroot just like we have existing support for
> Linaro, ARM, Synopsys, etc. toolchains.
> 
> [0] https://toolchains.bootlin.com/downloads/releases/toolchains/aarch64/fragments/aarch64--glibc--bleeding-edge-2020.02-2.frag
> 
> However, the number of toolchains provided by toolchains.bootlin.com
> is really large, and they are regularly updated. Maintaining that
> manually would be time consuming and error-prone. So instead, this
> commit introduces a script that automatically generates:
> 
>   - toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
>   - toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.mk
>   - toolchain/toolchain-external/toolchain-external-bootlin/toolchain-external-bootlin.hash
>   - support/testing/tests/toolchain/test_external_bootlin.py
> 
> We create a single external toolchain package, with a Kconfig "choice"
> as a sub-option to select the toolchain variant to be used. The script
> contains a Python dict that provides the mapping between the
> toolchains provided by toolchains.bootlin.com, and the architecture
> options/variants they are applicable to.
> 
> The test cases allow to verify that the toolchain configuration is
> correct, and that it is able to build a Busybox based system. It
> doesn't do any runtime testing as such testing is already done by
> toolchains.bootlin.com: the test cases here are only meant to verify
> that the toolchain-external-bootlin package works as expected.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Reviewed-by: Titouan Christophe <titouan.christophe@railnova.eu>
Tested-by: Titouan Christophe <titouan.christophe@railnova.eu>


Best regards,

Titouan
