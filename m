From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 6 Apr 2018 21:31:30 +0200
Subject: [Buildroot] [PATCH] php: fix how PCRE JIT is disabled
In-Reply-To: <20180406085403.19096-1-thomas.petazzoni@bootlin.com>
References: <20180406085403.19096-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180406213130.47f46263@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 Apr 2018 10:54:03 +0200, Thomas Petazzoni wrote:
> When the internal PCRE library of PHP is used, it tries to use a JIT
> engine, which is only available on some architectures.
> 
> However, the mechanism used to disable JIT has changed in recent PHP
> versions, and it now has a proper --without-pcre-jit option. Switch
> over to that to properly disable JIT on unsupported platforms.
> 
> It has been tested to fix the build of PHP on ARC and Microblaze.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/e1359fcad7bc57e3c5a7ecc37abaa2cf6a6a9ffa/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/php/php.mk | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
