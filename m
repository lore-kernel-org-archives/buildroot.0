From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 22:15:30 +0200
Subject: [Buildroot] [PATCH] package/18xx-ti-utils: update makefile in
 order to compile wlconf
In-Reply-To: <20200916210146.12836-1-mvalabdas@distech-controls.com>
References: <20200916210146.12836-1-mvalabdas@distech-controls.com>
Message-ID: <20200917221530.2f56c1b4@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Sep 2020 17:01:46 -0400
Miken Valabdas via buildroot <buildroot@busybox.net> wrote:

> Signed-off-by: Miken Valabdas <mvalabdas@distech-controls.com>
> ---
> Change  v2 -> v3:
>   -  typo
> Changes v1 -> v2:
>   - adjust compilation parameters
> ---
>  package/18xx-ti-utils/18xx-ti-utils.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/18xx-ti-utils/18xx-ti-utils.mk b/package/18xx-ti-utils/18xx-ti-utils.mk
> index d1f0388c3a..cbd5096eed 100644
> --- a/package/18xx-ti-utils/18xx-ti-utils.mk
> +++ b/package/18xx-ti-utils/18xx-ti-utils.mk
> @@ -21,10 +21,16 @@ define 18XX_TI_UTILS_BUILD_CMDS
>  		NFSROOT="$(STAGING_DIR)" NLVER=3 $(MAKE) -C $(@D) \
>  		CFLAGS="$(TARGET_CFLAGS) $(18XX_TI_UTILS_CFLAGS)" \
>  		$(18XX_TI_UTILS_BUILD_TARGET)
> +
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/wlconf \
> +		CC="$(HOSTCC)" \
> +		CFLAGS="$(HOST_CFLAGS)"

I've replaced CC and CFLAGS here by $(HOST_CONFIGURE_OPTS)

> +		

There was some trailing white space here, so I've simply dropped this
line.

Applied to master with those changes, and a slightly improved commit
log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
