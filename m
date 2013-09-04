From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Sep 2013 10:51:01 +0200
Subject: [Buildroot] [PATCH] dependencies: Add host prerequisite for
 elf2flt
In-Reply-To: <1378282615.12336.1.camel@phoenix>
References: <1378282615.12336.1.camel@phoenix>
Message-ID: <20130904105101.1662e059@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Axel Lin,

On Wed, 04 Sep 2013 16:16:55 +0800, Axel Lin wrote:
> This ensures elf2flt will be built when BR2_PACKAGE_HOST_ELF2FLT=y before
> building other packages.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
> I don't have a blackfin platform, only test build this for blackfin.
> Without this patch, the first time build will result in ELF binary because
> busybox is built before elf2flt.
> With this path, the result looks good, it produces BFLT executable for busybox.

I don't think host-elf2flt should be added at this level of dependency.
If I understand correctly elf2flt, it interfaces with the linker, so I
believe making elf2flt a dependency of binutils would probably make a
bit more sense.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
