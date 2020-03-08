From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 14:52:58 +0100
Subject: [Buildroot] [PATCH] package/spidermonkey: do not build the
 JavaScript shell, by default
In-Reply-To: <20200308032128.306-1-unixmania@gmail.com>
References: <20200308032128.306-1-unixmania@gmail.com>
Message-ID: <20200308145258.44d80049@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Sun,  8 Mar 2020 00:21:28 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Add a configuration to enable the JavaScript shell (default off). So
> far only libmozjs is required (by polkit) and the shell takes around
> 24MiB.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  ....in-install-shell-only-if-it-s-built.patch | 28 +++++++++++++++++++
>  package/spidermonkey/Config.in                | 11 ++++++++
>  package/spidermonkey/spidermonkey.mk          |  1 +
>  3 files changed, 40 insertions(+)
>  create mode 100644 package/spidermonkey/0001-js-src-Makefile.in-install-shell-only-if-it-s-built.patch
> 
> diff --git a/package/spidermonkey/0001-js-src-Makefile.in-install-shell-only-if-it-s-built.patch b/package/spidermonkey/0001-js-src-Makefile.in-install-shell-only-if-it-s-built.patch
> new file mode 100644
> index 0000000000..f6092af7ef
> --- /dev/null
> +++ b/package/spidermonkey/0001-js-src-Makefile.in-install-shell-only-if-it-s-built.patch

We already had a 0001 patch, we actually have 10 patches on
spidermonkey, so I renamed this one 0011.

Has this patch been submitted upstream ?

> diff --git a/package/spidermonkey/spidermonkey.mk b/package/spidermonkey/spidermonkey.mk
> index 579dc7b864..9bd19b01d1 100644
> --- a/package/spidermonkey/spidermonkey.mk
> +++ b/package/spidermonkey/spidermonkey.mk
> @@ -30,6 +30,7 @@ SPIDERMONKEY_CONF_OPTS = \
>  	--host=$(GNU_HOST_NAME) \
>  	--target=$(GNU_TARGET_NAME) \
>  	--disable-jemalloc \
> +	--$(if $(BR2_PACKAGE_SPIDERMONKEY_JS_SHELL),en,dis)able-js-shell \

That's really not the typical/conventional way of writing that in
Buildroot, so I've expanded that into our more verbose, but more
standard ifeq .. else .. endif conditional.

Then I've applied to master, because I really consider a 24 MB space
saving to be a fix :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
