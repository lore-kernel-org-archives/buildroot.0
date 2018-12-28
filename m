From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 14:22:57 +0100
Subject: [Buildroot] [PATCH 1/2] php: fix building curl extension.
In-Reply-To: <20181227174903.39339-1-aduskett@gmail.com>
References: <20181227174903.39339-1-aduskett@gmail.com>
Message-ID: <20181228142257.1d99b43e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Dec 2018 12:49:02 -0500, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> The configure option "--with-curl=$(STAGING_DIR)/usr" is broken.
> PHP will detect libcurl.pc, which will pass the configure checks, but will then
> prepend $(STAGING_DIR)/usr to the paths in libcurl.pc.
> 
> Thus php will then search $(STAGING_DIR)/usr/$(STAGING_DIR)/usr/lib/ for
> curl libraries during linking, which causes linking errors.
> 
> Removing "=$(STAGING_DIR)/usr" from --with-curl fixes the issue.
> 
> Fixes:
> http://autobuild.buildroot.net/results/44b/44b9ea1edca85b222a117a8e241a26b8dce33929/
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/php/php.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
