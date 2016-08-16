From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 16 Aug 2016 06:50:45 +0300
Subject: [Buildroot] [PATCH 1/1] package/simh: new package
In-Reply-To: <1471297357-11637-1-git-send-email-lothar.felten@gmail.com>
References: <1471297357-11637-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <20160816035044.GB3368@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lothar,

On Mon, Aug 15, 2016 at 11:42:37PM +0200, Lothar Felten wrote:
> diff --git a/package/simh/Config.in b/package/simh/Config.in
> new file mode 100644
> index 0000000..bcf6a3d
> --- /dev/null
> +++ b/package/simh/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_SIMH
> +	bool "simh"
> +	help
> +	  SIMH is a highly portable, multi-system simulator.
> +
> +	  http://simh.trailing-edge.com

There are fork() calls in the code, so this package might need a BR2_USE_MMU 
dependency.

> diff --git a/package/simh/simh.mk b/package/simh/simh.mk
> new file mode 100644
> index 0000000..f650c69
> --- /dev/null
> +++ b/package/simh/simh.mk
> @@ -0,0 +1,21 @@
> +################################################################################
> +#
> +# simh
> +#
> +################################################################################
> +
> +SIMH_VERSION = e93b55b4887dfcf1d0dd6ff86f94470e42a10702
> +SIMH_SITE = https://github.com/simh/simh
> +SIMH_SITE_METHOD = git

Please use the github helper. See 
http://nightly.buildroot.org/manual.html#github-download-url.

> +SIMH_LICENSE = simh license

Looking into a random source file like sim_imd.c, the license seems to be MIT. 
See https://opensource.org/licenses/MIT.

> +SIMH_LICENSE_FILES = README

I couldn't find this file in the source.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
