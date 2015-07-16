From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 23:25:30 +0200
Subject: [Buildroot] [PATCH] ARC: allow selection of MMU page size
In-Reply-To: <1437073441-11321-1-git-send-email-abrodkin@synopsys.com>
References: <1437073441-11321-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150716232530.761b0529@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Thu, 16 Jul 2015 22:04:01 +0300, Alexey Brodkin wrote:

> +choice
> +	prompt "MMU Page Size"
> +	default BR2_arc_page_size_8k
> +	help
> +	    MMU starting from version 3 (could be found in ARC 770) and now
> +	    version 4 (could be found in ARC HS38) allows selection of page
> +	    size during ASIC design creation. And it's important to build

Remove the "And".

> +	    a toolchain with page size setting that matches hardware.

"with a page size matching the hardware configuration"

> +	    Otherwise user-space applications will fail on execution due to

"will fail at runtime"

> +	    unexpected data layout/alignment.

What is the impact for people using external toolchains?

> +
> +config BR2_arc_page_size_4k

Can you use BR2_ARC_PAGE_SIZE_4K instead? I know the BR2_arc option is
lower-case, but for most architectures options are upper-case, even if
the core selection is lower-case. I think lower-case options is more an
accident of the past rather than a real policy.

> +	bool "4KB"
> +	depends on BR2_arc770d || BR2_archs38
> +
> +config BR2_arc_page_size_8k
> +	bool "8KB"
> +
> +config BR2_arc_page_size_16k
> +	bool "16KB"
> +	depends on BR2_arc770d || BR2_archs38

Can you quickly comment on why 4 KB / 16 KB have dependencies on
specific ARC cores and not 8 KB ?

Can you respin with those changes?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
