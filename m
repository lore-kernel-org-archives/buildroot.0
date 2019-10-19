From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Oct 2019 00:23:13 +0200
Subject: [Buildroot] [PATCH] package/util-linux: Add autoreconf for
 wipefs
In-Reply-To: <20191019220452.496313-1-sam.voss@gmail.com>
References: <20191019220452.496313-1-sam.voss@gmail.com>
Message-ID: <0259a1be-4690-a8fd-6e83-614fe296895b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/10/2019 00:04, sam.voss at gmail.com wrote:
> From: Sam Voss <sam.voss@gmail.com>
> 
> Patch for adding the `--enable-wipefs` configuration option requires an
> reconfiguration of autotools which is causing autobuilder failures.
> 
> Signed-off-by: Sam Voss <sam.voss@gmail.com>

 Applied to master, thanks.

 Thank you Bernd for noticing. And shame on you Arnout for not noticing :-)

 Regards,
 Arnout

> ---
> 
> In reference to
> 
> http://autobuild.buildroot.net/?reason=util-linux-2.34
> 
>  package/util-linux/util-linux.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 0374420b58..534cff2492 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -23,6 +23,7 @@ UTIL_LINUX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
>  UTIL_LINUX_CONF_OPTS += \
>  	--disable-rpath \
>  	--disable-makeinstall-chown
> +UTIL_LINUX_AUTORECONF = YES
>  UTIL_LINUX_LIBS = $(TARGET_NLS_LIBS)
>  
>  # system depends on util-linux so we enable systemd support
> 
