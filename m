From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 23:28:26 +0200
Subject: [Buildroot] [PATCH 2/4 v3] package/kvm-unit-tests: introduce
 _ARCH_SUPPORTS
In-Reply-To: <996d1d52c27da1a7725ed425ac895c3a7b5b7301.1499592591.git.yann.morin.1998@free.fr>
References: <cover.1499592591.git.yann.morin.1998@free.fr>
 <996d1d52c27da1a7725ed425ac895c3a7b5b7301.1499592591.git.yann.morin.1998@free.fr>
Message-ID: <20170722232826.68061aec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Jul 2017 11:29:59 +0200, Yann E. MORIN wrote:

> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 if BR2_i386
> +	depends on BR2_HOST_GCC_AT_LEAST_4_5 if BR2_x86_64

Did you actually test this? "make menuconfig" complains:

thomas at windsurf:~/projets/buildroot (master)$ make menuconfig
package/kvm-unit-tests/Config.in:16: syntax error
package/kvm-unit-tests/Config.in:15: invalid option
package/kvm-unit-tests/Config.in:17: syntax error
package/kvm-unit-tests/Config.in:16: invalid option
Makefile:876: recipe for target 'menuconfig' failed

So I've replaced them with the more usual:

+       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 || !BR2_i386
+       depends on BR2_HOST_GCC_AT_LEAST_4_5 || !BR2_x86_64

I've also re-add the Config.in comment about the host gcc >= 4.5
dependency.

Applied with those changes. Thanks!	

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
