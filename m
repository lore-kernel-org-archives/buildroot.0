From: Charles Manning <cdhmanning@gmail.com>
Date: Sun, 17 Mar 2013 10:11:59 +1300
Subject: [Buildroot] [PATCH] rework patch model
In-Reply-To: <1363466942-21510-1-git-send-email-spdawson@gmail.com>
References: <1363466942-21510-1-git-send-email-spdawson@gmail.com>
Message-ID: <CAE21AQp4Vx8vnc-2KJJOxR=d1DLx=rsXba-tgtzqeqoB_Wvmqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 17, 2013 at 9:49 AM,  <spdawson@gmail.com> wrote:
> From: Simon Dawson <spdawson@gmail.com>
>
> At the Buildroot Developers Meeting (4-5 February 2013, in Brussels) a change
> to the patch logic was discussed. See
>
> http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013
>
> for details. In summary:
>
> * For patches stored in the package directory, if package/<pkg>/<version>/ does exist, apply package/<pkg>/<version>/*.patch, otherwise, apply package/<pkg>/*.patch
> * For patches stored in the global patches directory, if $(GLOBAL_PATCH_DIR)/<pkg>/<version>/ does exist, apply $(GLOBAL_PATCH_DIR)/<pkg>/<version>/*.patch, otherwise, apply $(GLOBAL_PATCH_DIR)/<pkg>/*.patch
>
> This patch adds the new BR2_GLOBAL_PATCH_DIR configuration item, and reworks
> the generic package infrastructure to implement the new patch logic.
>
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  Config.in              |    7 +++++++
>  package/pkg-generic.mk |   16 ++++++++--------
>  2 files changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/Config.in b/Config.in
> index a2c305f..3008374 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -437,6 +437,13 @@ config BR2_PACKAGE_OVERRIDE_FILE
>           as the source directory for a particular package. See the
>           Buildroot documentation for more details on this feature.
>
> +config BR2_GLOBAL_PATCH_DIR
> +       string "global patch directory"
> +       help
> +         You may specify a directory containing global package patches.
> +         Note that any global patches for a package will be applied AFTER
> +         the default Buildroot patch set for the package.
> +
>  endmenu

Bloody fantastic!

I was looking for something that does exactly this.


Thanks

Charles
