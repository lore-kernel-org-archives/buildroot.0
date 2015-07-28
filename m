From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:57:07 +0200
Subject: [Buildroot] [PATCH] binutils: more fixes for arc-2015.06 tools
In-Reply-To: <1438090392-30182-1-git-send-email-abrodkin@synopsys.com>
References: <1438090392-30182-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150728225707.1b257d69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue, 28 Jul 2015 16:33:12 +0300, Alexey Brodkin wrote:
> Two patches below are taken from development branch of ARC binutils,
> so one the next release of ARC tools happens both patches must be removed.
> 
> These 2 patches:
>  0003-ld-arc-Provide-the-.tdata-symbol.patch
>  0004-Provide-.tbss-symbol.patch
> fix missing .tbss and .tdata sections during linkage stage such as:
> ------------------------------>8---------------------------
> arc-linux-g++ test.cpp
> ../arc-buildroot-linux-uclibc/lib/libstdc++.so: undefined reference to '.tbss'
> collect2: error: ld returned 1 exit status
> ------------------------------>8---------------------------

Applied, thanks. After applying this patch, I've started a rebuild of
the pre-built ARC external toolchain, so that we test with the latest
fixes. I will deploy it probably tomorrow morning.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
