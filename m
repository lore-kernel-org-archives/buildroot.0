From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 22:07:54 +0200
Subject: [Buildroot] [PATCH] support/config-fragments/autobuild: Add ARC
 glibc fragment
In-Reply-To: <20171013160909.1408-1-abrodkin@synopsys.com>
References: <20171013160909.1408-1-abrodkin@synopsys.com>
Message-ID: <20171021220754.0fec8a92@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Oct 2017 19:09:09 +0300, Alexey Brodkin wrote:
> glibc is now supported for ARC so let's kick-start autobuilders
> with glibc toolchain for ARC HS.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  support/config-fragments/autobuild/br-arc-full-internal-glibc.config | 4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 support/config-fragments/autobuild/br-arc-full-internal-glibc.config

You forgot to add the toolchain to toolchain-configs.csv, without which
it wouldn't have been taken into account as a possible toolchain for
the autobuilders. Also, the "full" part of the name was only meant for
uclibc to indicate that "all uClibc options" were enabled. For a glibc
toolchain, it din't make sense, so I dropped this part of the file name.

I'd prefer to have an external toolchain for this configuration rather
than rebuild over and over again that toolchain. But we can do this
once we have such a toolchain available on
http://toolchains.free-electrons.com.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
