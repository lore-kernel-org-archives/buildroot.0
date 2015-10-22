From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 22 Oct 2015 22:48:41 +0200
Subject: [Buildroot] [git commit] util-linux: disable systemd support
In-Reply-To: <20151022204331.ADB7481D8B@busybox.osuosl.org>
References: <20151022204331.ADB7481D8B@busybox.osuosl.org>
Message-ID: <20151022204841.GM21428@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,
Peter Korsgaard wrote,

> commit: http://git.buildroot.net/buildroot/commit/?id=762b64daa2fd1424053754ed55d0f9704ccc2405
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Fixes (works around) #8421
> 
> Util-linux has optional systemd support, but we cannot enable it as systemd
> depends on util-linux, so that would create a circular dependency.
> 
> The systemd unit directory location detection also fails as pkg-config
> 0.9.12+ prefixes all directory variables with the sysroot, and the configure
> script expects to see the target location, so disable that as well for good
> measure.
> 
> The systemd support doesn't seem to add much, so it isn't a big loss.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/util-linux/util-linux.mk |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 27d22cb..39ba544 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -26,6 +26,12 @@ UTIL_LINUX_CONF_OPTS += \
>  	--disable-makeinstall-chown \
>  	--without-python
>  
> +# system depends on util-linux so we enable systemd support
> +# (which needs systemd to be installed)
> +UTIL_LINUX_CONF_OPTS += \
> +	--without-systed \

I think this must be a typo:
$ ./configure --help|grep systemd
                          systemd)
  --with-systemd          build with support for systemd


best regards
 Waldemar
