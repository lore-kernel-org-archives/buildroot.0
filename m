From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 16:00:32 +0200
Subject: [Buildroot] [git commit] package/wmctrl: x-includes and
 x-libraries must be set for cross-compiling
In-Reply-To: <20180418094654.8BA0288272@busybox.osuosl.org>
References: <20180418094654.8BA0288272@busybox.osuosl.org>
Message-ID: <20180420160032.7f74e16e@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

This commit should be backported to 2018.02.x to solve:

  http://autobuild.buildroot.net/results/7e5cba8a5650a00e10d1a5528f38cb2bf772aee1/

Thanks,

Thomas

On Wed, 18 Apr 2018 11:46:48 +0200, Thomas Petazzoni wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=046c5e25634bbf827c43617bf1967ab469418908
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> set x-includes and x-libraries configure option for cross-compiling.
> wmctrl can use poisoned paths if these options are not passed to
> configure script.
> 
> Fixes:
> http://autobuild.buildroot.net/results/7e5/7e5cba8a5650a00e10d1a5528f38cb2bf772aee1
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: J?r?me Pouiller <jezz@sysmic.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/wmctrl/wmctrl.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/wmctrl/wmctrl.mk b/package/wmctrl/wmctrl.mk
> index 0d4aeebc1d..36ad3513ff 100644
> --- a/package/wmctrl/wmctrl.mk
> +++ b/package/wmctrl/wmctrl.mk
> @@ -11,4 +11,8 @@ WMCTRL_LICENSE_FILES = COPYING
>  
>  WMCTRL_DEPENDENCIES = libglib2 xlib_libX11 xlib_libXmu
>  
> +WMCTRL_CONF_OPTS = \
> +	--x-includes=$(STAGING_DIR)/usr/include \
> +	--x-libraries=$(STAGING_DIR)/usr/lib
> +
>  $(eval $(autotools-package))



-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
