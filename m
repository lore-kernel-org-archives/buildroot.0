From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 7 Aug 2013 08:16:49 +0200
Subject: [Buildroot] [PATCH 5/5] manual: minor formating fixes
In-Reply-To: <1375824984-8226-6-git-send-email-s.martin49@gmail.com>
References: <1375824984-8226-1-git-send-email-s.martin49@gmail.com>
 <1375824984-8226-6-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LU7D--my3=9W73f9j+zWJehqxJ6AXkDD+=T5QF_XnxZfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 6, 2013 at 11:36 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  docs/manual/adding-packages-generic.txt | 14 ++++++++++----
>  docs/manual/make-tips.txt               |  5 +++--
>  2 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index a6f9565..3545598 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -99,24 +99,30 @@ of the shell script(s) needing fixing. All these names are relative to
>  In addition, the scripts listed in +LIBFOO_CONFIG_SCRIPTS+ are removed
>  from +$(TARGET_DIR)/usr/bin+, since they are not needed on the target.
>
> -Example 1:
> -
> +.Config script: 'divine' package
> +================================
>  Package divine installs shell script '$(STAGING_DIR)/usr/bin/divine-config'.
>
>  So it's fixup would be:

Not touched by this patch, but this should be 'its fixup'.

>
> +--------------------------------
>  DIVINE_CONFIG_SCRIPTS = divine-config
> +--------------------------------
> +================================
>
> -Example 2:
> -
> +.Config script: 'imagemagick' package:
> +================================
>  Package imagemagick installs the following scripts:
>  '$(STAGING_DIR)/usr/bin/{Magick,Magick++,MagickCore,MagickWand,Wand}-config'
>
>  So it's fixup would be:
>
> +--------------------------------
>  IMAGEMAGICK_CONFIG_SCRIPTS = \
>     Magick-config Magick++-config \
>     MagickCore-config MagickWand-config Wand-config
> +--------------------------------
> +================================
>
>  On line 14, we specify the list of dependencies this package relies
>  on. These dependencies are listed in terms of lower-case package names,
> diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
> index e1af62a..870c029 100644
> --- a/docs/manual/make-tips.txt
> +++ b/docs/manual/make-tips.txt
> @@ -29,8 +29,7 @@ The result of the search shows the help message of the matching items.
>   $ make help
>  --------------------
>
> -.Not all targets are always available,
> -
> +Not all targets are always available,
>  some settings in the +.config+ file may hide some targets:
>
>  * +linux-menuconfig+ and +linux-savedefconfig+ only work when
> @@ -69,6 +68,8 @@ The manual outputs will generated in 'output/docs/manual'.
>  *Note* : +asciidoc+ is required to build it. There is a known issue
>  that you can't build it under Dedian Squeeze.

I guess you mean Debian here?

>
> +.Reseting Buildroot for a new target:
> +
>  To delete all build products as well as the configuration:
>
>  --------------------

Best regards,
Thomas
