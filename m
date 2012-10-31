From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 31 Oct 2012 21:47:44 +0100
Subject: [Buildroot] [PATCH v2] Add support for custom package patches
In-Reply-To: <1351688107-6194-1-git-send-email-spdawson@gmail.com>
References: <1351688107-6194-1-git-send-email-spdawson@gmail.com>
Message-ID: <CAHXCMMJjQDsjzEzgFOa5oi6W-s8V6A3W-_LJK3-0tTEJv+BbyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

2012/10/31  <spdawson@gmail.com>:
> From: Simon Dawson <spdawson@gmail.com>
>
> Add a configuration item to allow a space-separated list of directories
> to be specified, from which custom package patches will be applied.
>
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> ---
>  v2: Incorporate improvements suggested by Arnout Vandecappelle, and
>      fix handling of the case where the new configuration item is not set
>
>  Config.in              |    7 +++++++
>  package/pkg-generic.mk |   28 ++++++++++++++++------------
>  2 files changed, 23 insertions(+), 12 deletions(-)
>
> diff --git a/Config.in b/Config.in
> index dab7787..2ea3fbb 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -415,6 +415,13 @@ config BR2_PACKAGE_OVERRIDE_FILE
>           as the source directory for a particular package. See the
>           Buildroot documentation for more details on this feature.
>
> +config BR2_EXTRA_PACKAGE_PATCH_DIRS
> +       string "extra package patch directories"
> +       help
> +         You may specify a space-separated list of directories containing
> +         extra package patches. Note that any extra patches for a package
> +         will be applied AFTER the Buildroot patch set for the package.
> +
>  endmenu
>

It'd be great to have a section in the documentation about this feature.


Regards,


-- 
Sam
