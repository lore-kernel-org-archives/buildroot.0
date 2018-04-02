From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 21:43:14 +0200
Subject: [Buildroot] [PATCH] waf: fix autobuilders failure
In-Reply-To: <20180402171427.24300-1-maxime.hadjinlian@gmail.com>
References: <20180402171427.24300-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180402214314.72292c87@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 Apr 2018 19:14:27 +0200, Maxime Hadjinlian wrote:
> The package is host only and so the variable to use must be prefixed by
> 'HOST_'
> 
> Fixes:
> 	http://autobuild.buildroot.org/results/01d/01d8c21df4baa9ecc6a0e45744fe6a4d086a0652/
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/waf/waf.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master after adjusting the commit title and commit log.
Thanks!

However, I really think packages shouldn't have to use
HOST_<pkg>_DL_DIR, and therefore the infra should probably define
<pkg>_DL_DIR.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
