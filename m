From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 May 2017 23:30:04 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/ltp-testsuite: add
 dependency on BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20170508211833.3462-2-romain.naour@gmail.com>
References: <20170508211833.3462-1-romain.naour@gmail.com>
 <20170508211833.3462-2-romain.naour@gmail.com>
Message-ID: <20170508233004.55d93b91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 May 2017 23:18:33 +0200, Romain Naour wrote:

>  comment "ltp-testsuite needs a glibc or uClibc toolchain w/ NPTL"
>  	depends on !BR2_nios2
> +	depends on !BR2_TOOLCHAIN_HAS_SYNC_4 && !BR2_arc && !BR2_i386 \
> +		&& !BR2_powerpc && !BR2_powerpc64 && !BR2_powerpc64le \
> +		&& !BR2_x86_64

Wrong. You want the dependencies on the Config.in comment in the same
direction as for the main symbol. Or better: introduce a
BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
