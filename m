From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 21:37:11 +0100
Subject: [Buildroot] [PATCH] package/python-brotli: fix build failure
 due to gcc bug 68485
In-Reply-To: <20191205111650.76395-1-giulio.benetti@benettiengineering.com>
References: <20191205111650.76395-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191205213711.3c0a54ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  5 Dec 2019 12:16:50 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> The python-brotli package exhibits gcc bug 68485 when built for the
> Microblaze architecture with optimization enabled, which causes a build
> failure.
> 
> As done for other packages in Buildroot work around this gcc bug by
> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.
> 
> Fixes:
> 
> http://autobuild.buildroot.net/results/24b/24b23175ab27615fb377bb4d5f6c656dccf10a86/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/python-brotli/python-brotli.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
