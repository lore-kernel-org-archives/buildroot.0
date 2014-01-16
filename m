From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Jan 2014 11:30:38 +0200
Subject: [Buildroot] [RFC,
 PATCH 4/8] package/powerpc-utils: Add powerpc hardware utilities
In-Reply-To: <1389862338.918857.878477328980.4.gpush@pablo>
References: <1389862338.917573.283530987294.0.gpush@pablo>
 <1389862338.918857.878477328980.4.gpush@pablo>
Message-ID: <20140116093038.GB4602@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeremy,

On Thu, Jan 16, 2014 at 04:52:18PM +0800, Jeremy Kerr wrote:
> This change adds a package definition for the powerpc-utils project,
> containing a set of powerpc-specific hardware management utilities.
> 
> We're using a git tag from upstream, which contains a few build-system
> fixes. We also add a patch to use `reboot` instead of `shutdown -r`,
> allowing compatibility with busybox.
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

[...]

> diff --git a/package/powerpc-utils/powerpc-utils.mk 
> b/package/powerpc-utils/powerpc-utils.mk
> new file mode 100644
> index 00000000..15deb2e9
> --- /dev/null
> +++ b/package/powerpc-utils/powerpc-utils.mk
> @@ -0,0 +1,14 @@
> +#############################################################
> +#
> +# powerpc-utils
> +#
> +#############################################################
> +
> +POWERPC_UTILS_VERSION = aeb32757

Please use the full 40-char commit id.

> +POWERPC_UTILS_SITE = git://git.code.sf.net/p/powerpc-utils/powerpc-utils
> +POWERPC_UTILS_AUTORECONF = YES
> +POWERPC_UTILS_DEPENDENCIES = zlib
> +
> +POWERPC_UTILS_CONF_OPT += --without-librtas
> +
> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
